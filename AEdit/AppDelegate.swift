//
//  AppDelegate.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-10-16.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    override init() {
        
        _ = DocumentController.shared // preempt default document controller
        
        //FilesNode.dynamicUTIExamples()
        
        SyntaxScan.loadConfig()
        
        ValueTransformer.setValueTransformer(ColorDataTransformer(), forName:ColorDataTransformer.name)
        
        // register default setting values
        let defaults = DefaultsSettings.defaults.mapKeys{ $0.rawValue }
        Defaults.register(defaults: defaults)
        NSUserDefaultsController.shared.initialValues = defaults

    }
    
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        //print(className, #function, DocumentController.shared.documents.map{$0.fileURL})
        return false
    }

    #if XDEBUG
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        //Swift.print(className, #function)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(AppDelegate.applicationDidFinishRestoringWindows),
                                               name: NSApplication.didFinishRestoringWindowsNotification,
                                               object: NSApplication.shared)
    }
    
    @objc func applicationDidFinishRestoringWindows(_ notification:Notification) {
        //Swift.print(className, #function)
    }
    
    #endif
    
   func applicationDidFinishLaunching(_ aNotification: Notification) {
        /* "This method is called after the application’s main run loop has been started
         but before it has processed any events. If the application was launched by the
         user opening a file, the delegate’s application:openFile: method is called
         before this method. If you want to perform initialization before any files are
         opened, implement the applicationWillFinishLaunching: method in your delegate,
         which is called before application:openFile:.)" */
        //Swift.print(className, #function, aNotification.userInfo, NSDocumentController.shared.documents)
        //Swift.print()
        if NSApp.windows.isEmpty {
            // https://stackoverflow.com/a/12720841
            OperationQueue.main.addOperation {
                let docs = DocumentController.shared.documents
                //Swift.print(self.className, #function, "OperationQueue", docs.map{$0.fileURL})
                //Swift.print()
                let home = FileManager.default.homeDirectoryForCurrentUser
                let current = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
                DocumentController.shared.openDocument(withContentsOf: home,
                                                       display: true) {
                    document,display,error in
                    //print(self.className, #function, "default open complete", document?.fileURL ?? "nil", error ?? "OK")
                    if let error = error {
                        print(self.className, #function, "default open error", error)
                        DocumentController.shared.presentError(error)
                    }
                }
            }
        }
        //instrumentObjcMessageSends(on:true)
    }
    
    #if XDEBUG
    
    func applicationWillTerminate(_ aNotification: Notification) {
        //Swift.print(className, #function)
    }
    
    #endif

    func applicationShouldTerminate(_ sender: NSApplication)-> NSApplication.TerminateReply {
        //print(className, #function, sender)
        return .terminateNow
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
