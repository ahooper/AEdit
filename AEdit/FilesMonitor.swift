//
//  FilesMonitor.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-06.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//
// https://developer.apple.com/library/archive/documentation/Darwin/Conceptual/FSEvents_ProgGuide/UsingtheFSEventsFramework/UsingtheFSEventsFramework.html
// https://github.com/scchn/Stuff/tree/master/File%20Monitor
// https://github.com/eonist/FileWatcher
// https://blog.beecomedigital.com/2015/06/27/developing-a-filesystemwatcher-for-os-x-by-using-fsevents-with-swift-2/

import Foundation

class FilesMonitor {
    
    public struct CreateFlags: OptionSet {
        // From /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/FSEvents.framework/Versions/A/Headers/FSEvents.h
        
        /**
         *  FSEventStreamCreateFlags
         *
         *  Discussion:
         *    Flags that can be passed to the FSEventStreamCreate...()
         *    functions to modify the behavior of the stream being created.
         */
        let rawValue: FSEventStreamCreateFlags

        /**
         * The default.
         */
        static let none = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagNone))

        /**
         * The framework will invoke your callback function with CF types
         * rather than raw C types (i.e., a CFArrayRef of CFStringRefs,
         * rather than a raw C array of raw C string pointers). See
         * FSEventStreamCallback.
         */
        static let useCFTypes = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagUseCFTypes))

        /**
         * Affects the meaning of the latency parameter. If you specify this
         * flag and more than latency seconds have elapsed since the last
         * event, your app will receive the event immediately. The delivery
         * of the event resets the latency timer and any further events will
         * be delivered after latency seconds have elapsed. This flag is
         * useful for apps that are interactive and want to react immediately
         * to changes but avoid getting swamped by notifications when changes
         * are occurringin rapid succession. If you do not specify this flag,
         * then when an event occurs after a period of no events, the latency
         * timer is started. Any events that occur during the next latency
         * seconds will be delivered as one group (including that first
         * event). The delivery of the group of events resets the latency
         * timer and any further events will be delivered after latency
         * seconds. This is the default behavior and is more appropriate for
         * background, daemon or batch processing apps.
         */
        static let noDefer = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagNoDefer))

        /**
         * Request notifications of changes along the path to the path(s)
         * you're watching. For example, with this flag, if you watch
         * "/foo/bar" and it is renamed to "/foo/bar.old", you would receive
         * a RootChanged event. The same is true if the directory "/foo" were
         * renamed. The event you receive is a special event: the path for
         * the event is the original path you specified, the flag
         * kFSEventStreamEventFlagRootChanged is set and event ID is zero.
         * RootChanged events are useful to indicate that you should rescan a
         * particular hierarchy because it changed completely (as opposed to
         * the things inside of it changing). If you want to track the
         * current location of a directory, it is best to open the directory
         * before creating the stream so that you have a file descriptor for
         * it and can issue an F_GETPATH fcntl() to find the current path.
         */
        static let watchRoot = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagWatchRoot))

        /**
         * Don't send events that were triggered by the current process. This
         * is useful for reducing the volume of events that are sent. It is
         * only useful if your process might modify the file system hierarchy
         * beneath the path(s) being monitored. Note: this has no effect on
         * historical events, i.e., those delivered before the HistoryDone
         * sentinel event.  Also, this does not apply to RootChanged events
         * because the WatchRoot feature uses a separate mechanism that is
         * unable to provide information about the responsible process.
         */
        @available(macOS 10.6, *)
        static let ignoreSelf = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagIgnoreSelf))

        /**
         * Request file-level notifications.  Your stream will receive events
         * about individual files in the hierarchy you're watching instead of
         * only receiving directory level notifications.  Use this flag with
         * care as it will generate significantly more events than without it.
         */
        @available(macOS 10.7, *)
        static let fileEvents = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagFileEvents))

        /**
         * Tag events that were triggered by the current process with the "OwnEvent" flag.
         * This is only useful if your process might modify the file system hierarchy
         * beneath the path(s) being monitored and you wish to know which events were
         * triggered by your process. Note: this has no effect on historical events, i.e.,
         * those delivered before the HistoryDone sentinel event.
         */
        @available(macOS 10.9, *)
        static let markSelf = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagMarkSelf))

        /**
         * Requires kFSEventStreamCreateFlagUseCFTypes and instructs the
         * framework to invoke your callback function with CF types but,
         * instead of passing it a CFArrayRef of CFStringRefs, a CFArrayRef of
         * CFDictionaryRefs is passed.  Each dictionary will contain the event
         * path and possibly other "extended data" about the event.  See the
         * kFSEventStreamEventExtendedData*Key definitions for the set of keys
         * that may be set in the dictionary.  (See also FSEventStreamCallback.)
         */
        @available(macOS 10.13, *)
        static let useExtendedData = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagUseExtendedData))

        /**
         * When requesting historical events it is possible that some events
         * may get skipped due to the way they are stored.  With this flag
         * all historical events in a given chunk are returned even if their
         * event-id is less than the sinceWhen id.  Put another way, deliver
         * all the events in the first chunk of historical events that contains
         * the sinceWhen id so that none are skipped even if their id is less
         * than the sinceWhen id.  This overlap avoids any issue with missing
         * events that happened at/near the time of an unclean restart of the
         * client process.
         */
        @available(macOS 10.15, *)
        static let fullHistory = CreateFlags(rawValue:FSEventStreamCreateFlags(kFSEventStreamCreateFlagFullHistory))

    }
    
    init(_ path:String, flags:CreateFlags=[.none]) {
        fseContext = FSEventStreamContext(version: 0,
                                          info: Unmanaged<FilesMonitor>.passUnretained(self).toOpaque(),
                                          retain: nil,
                                          release: nil,
                                          copyDescription: nil)
        let fsPaths = [path] as CFArray
        fseStream = FSEventStreamCreate(kCFAllocatorDefault,
                                        fseCallback,
                                        &fseContext!,
                                        fsPaths,
                                        FSEventStreamEventId(kFSEventStreamEventIdSinceNow),
                                        CFTimeInterval(1.0),
                                        flags.union([.useCFTypes,.noDefer]).rawValue)
        if let fseStream = fseStream {
            FSEventStreamScheduleWithRunLoop(fseStream,
                                             CFRunLoopGetMain(),
                                             CFRunLoopMode.defaultMode.rawValue)
            FSEventStreamStart(fseStream)
        }

    }
    
    deinit {
        if let fseStream = fseStream {
            FSEventStreamStop(fseStream)
            FSEventStreamInvalidate(fseStream)
            FSEventStreamRelease(fseStream)
        }
    }
    
    var fseContext: FSEventStreamContext?
    var fseStream: FSEventStreamRef?
    var callbacks = [(FSEventStreamEventFlags, String)->Void]()
    
    let fseCallback: FSEventStreamCallback = { streamRef, clientCallBackInfo, numEvents, eventPaths, eventFlags, eventIds in
        let s = Unmanaged<FilesMonitor>.fromOpaque(clientCallBackInfo!).takeUnretainedValue()
        //eventPaths is a CFArray since kFSEventStreamCreateFlagUseCFTypes was used. CFArray is “toll-free bridged” to NSArray
        let paths = Unmanaged<NSArray>.fromOpaque(eventPaths).takeUnretainedValue()
        for index in 0..<numEvents {
            //print(/*eventIds[index],*/ flagsDescription(eventFlags[index]), paths[index] as! String)
            _ = s.callbacks.map{$0(eventFlags[index], paths[index] as! String)}
        }
    }

    static func flagsDescription(_ flags:FSEventStreamEventFlags)->Substring {
        var r = ""
        for b in 0..<32 {
            let bit: UInt32 = 1<<b
            if flags & bit != 0 {
                switch Int(bit) {
                case kFSEventStreamEventFlagMustScanSubDirs:
                    r += ",MustScanSubDirs"
                case kFSEventStreamEventFlagUserDropped:
                    r += ",UserDropped"
                case kFSEventStreamEventFlagKernelDropped:
                    r += ",KernelDropped"
                case kFSEventStreamEventFlagEventIdsWrapped:
                    r += ",EventIdsWrapped"
                case kFSEventStreamEventFlagHistoryDone:
                    r += ",HistoryDone"
                case kFSEventStreamEventFlagRootChanged:
                    r += ",RootChanged"
                case kFSEventStreamEventFlagMount:
                    r += ",Mount"
                case kFSEventStreamEventFlagUnmount:
                    r += ",Unmount"
                case kFSEventStreamEventFlagItemCreated:
                    r += ",ItemCreated"
                case kFSEventStreamEventFlagItemRemoved:
                    r += ",ItemRemoved"
                case kFSEventStreamEventFlagItemInodeMetaMod:
                    r += ",InodeMetaMod"
                case kFSEventStreamEventFlagItemRenamed:
                    r += ",ItemRenamed"
                case kFSEventStreamEventFlagItemModified:
                    r += ",ItemModified"
                case kFSEventStreamEventFlagItemFinderInfoMod:
                    r += ",ItemFinderInfoMod"
                case kFSEventStreamEventFlagItemChangeOwner:
                    r += ",ItemChangeOwner"
                case kFSEventStreamEventFlagItemXattrMod:
                    r += ",ItemXattrMod"
                case kFSEventStreamEventFlagItemIsFile:
                    r += ",ItemIsFile"
                case kFSEventStreamEventFlagItemIsDir:
                    r += ",ItemIsDir"
                case kFSEventStreamEventFlagItemIsSymlink:
                    r += ",ItemIsSymlink"
                case kFSEventStreamEventFlagOwnEvent:
                    r += ",OwnEvent"
                case kFSEventStreamEventFlagItemIsHardlink:
                    r += ",ItemIsHardlink"
                case kFSEventStreamEventFlagItemIsLastHardlink:
                    r += ",ItemIsLastHardlink"
                case kFSEventStreamEventFlagItemCloned:
                    r += ",ItemCloned"
                default:
                    r += ",bit\(b)"
                }
            }
        }
        return r.dropFirst(1)
    }

}
