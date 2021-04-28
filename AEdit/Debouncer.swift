//
//  Debouncer.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-31.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//
//  CotEditor-3.8.9/CotEditor/Sources/Debouncer.swift
//  https://www.swiftbysundell.com/articles/a-deep-dive-into-grand-central-dispatch-in-swift/
//  https://theswiftdev.com/ultimate-grand-central-dispatch-tutorial-in-swift/

import Foundation

class DebounceQueue {
    private let queue: DispatchQueue
    private var pending: DispatchWorkItem?
    private let defaultDelay: DispatchTimeInterval
    
    init(delay: DispatchTimeInterval, label:String, qos:DispatchQoS = .utility) {
        queue = DispatchQueue(label: label,
                              qos: qos,
                              attributes: [/*serial*/],
                              target: DispatchQueue.global())
        defaultDelay = delay
    }
    
    func schedule(delay: DispatchTimeInterval? = nil, _ workItem:DispatchWorkItem) {
        // single threading through here by virtue of being called only from main event loop
        let delay = delay ?? defaultDelay
        pending?.cancel()
        pending = workItem
        queue.asyncAfter(deadline: .now() + delay, execute: workItem)
    }
    
}

#if DEBUG

func cancellableWork()->DispatchWorkItem {
    // contortion to capture a "self" WorkItem reference
    var item: DispatchWorkItem?
    item = DispatchWorkItem {
        for n in 0..<5 {
            guard !item!.isCancelled else {
                print("cancelled")
                return
            }
            print(n)
            sleep(1)
        }
        print("done")
    }
    return item!
}

func tryDebounce() {
    let queue = DebounceQueue(delay: .milliseconds(1000), label: "ca.nevdull.AEdit")

    queue.schedule(cancellableWork())
    queue.schedule(cancellableWork())
    Thread.sleep(forTimeInterval: 3)
    queue.schedule(cancellableWork())
    Thread.sleep(forTimeInterval: 20)
    queue.schedule(cancellableWork())
    
    dispatchMain()
}

#endif
