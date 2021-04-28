//
//  FilesWindowController.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-10-24.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Cocoa

class FilesWindowController: NSWindowController {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
        shouldCloseDocument = true
    }
    
    override func windowDidLoad() {
        //print(self, #function, window ?? "nil", window?.identifier?.rawValue ?? "nil")
        super.windowDidLoad()
        window?.delegate = self
        filesViewController = contentViewController as? FilesViewController
    }

    var filesViewController : FilesViewController?
    var filesDocument: NSDocument?
    var activeDocuments = Set<NSDocument>()
    var activeURLs: [URL?] { activeDocuments.map{$0.fileURL} }
    
    override var document: AnyObject? {
        didSet {
            //Swift.print(self, #function, document?.fileURL ?? "nil")
            if let filesDoc = document as? FilesDocument {
                filesDocument = filesDoc
                synchronizeWindowTitleWithDocumentName()
            }
        }
    }

    func addDocument(_ doc:NSDocument) {
        //print(self, #function, doc, doc.fileURL ?? "nil", activeDocuments.contains(doc))
        filesViewController?.addDocumentTab(doc)
        activeDocuments.insert(doc)
        invalidateRestorableState()
    }
    
    func showDocument(_ doc:NSDocument) {
        //print(self, #function, doc, activeDocuments.contains(doc))
        if activeDocuments.contains(doc) {
            filesViewController?.showDocument(doc)
        } else {
            addDocument(doc)
        }
    }
    
    func removeDocument(_ doc:NSDocument) {
        //print(self, #function, doc, activeDocuments.contains(doc))
        activeDocuments.remove(doc) // no error if not present
        filesViewController?.removeDocumentTab(doc)
    }

    func open(_ url: URL) {
        //print(self, #function, url)
        //print(activeDocuments.map{$0.fileURL})
        //print(DocumentController.shared.documents.map{$0.fileURL})
        if let doc = DocumentController.shared.document(for:url),
           activeDocuments.contains(doc) {
            showDocument(doc)
            return
        }
        DocumentController.shared.openDocument(withContentsOf: url, display: false) { document, display, error in
            if let document = document as? ViewableDocument {
                self.addDocument(document)
            } else if let error = error {
                DocumentController.shared.presentError(error)
            } else if document != nil {
                Swift.print(self, "openDocument \(url) class \(document?.className)")
                document?.makeWindowControllers()
                document?.showWindows()
            } else {
                Swift.print(self, "openDocument \(url) failed, unknown error")
            }
        }
    }
    
    //https://stackoverflow.com/a/28787433
    func printResponderChain(_ responder: NSResponder?) {
        guard let responder = responder else { return; }
        print(responder)
        printResponderChain(responder.nextResponder)
    }
    
    override func showWindow(_ sender: Any?) {
        //print(self, #function, sender ?? "NIL")
        super.showWindow(sender)
    }

    /// Returns the window title to be used for a given document display name.
    override func windowTitle(forDocumentDisplayName displayName: String) -> String {
//        print(#function, displayName, window?.representedURL ?? "nil")
        if document === filesDocument {
            return displayName
        }
        let directoryName: String = filesDocument?.displayName ?? "UNKNOWN"
        return displayName + " — "/*em dash*/ + directoryName
    }
       
    @IBAction func closeTab(_ sender: Any) {
        //print(self, #function, activeDocuments.count, document?.fileURL)
        if activeDocuments.count > 0,
           let viewable = document as? ViewableDocument {
            if viewable.isDocumentEdited {
                if saveOrDiscardAlert(viewable, sender as? NSWindow ?? nil) {
                    removeDocument(viewable)
                }
            } else {
                removeDocument(viewable)
            }
        } else {
            super.close()
        }
    }

    // Catch some menu actions which would normally go to the document manager
    // TODO perhaps replace this approach with posting an "add document tab" action to the responder chain in viewabledocument.makewindowcontrollers. That would avoid having to intercept private NSDocumentController action.
    // Or replace the Open Recent menu contents with links to a custom action
    
    /// An action method called by the Open menu command, it runs the modal Open panel and, based on the selected filenames, creates one or more NSDocument objects from the contents of the files.
    @IBAction func openDocument(_ sender: Any?) {
        //print(self, #function)
        DocumentController.shared.beginOpenPanel { urls in
            //print(self, #function, urls)
            guard let urls = urls else { return }
            for url in urls {
                //TODO? check if a folder
                self.open(url)
            }
        }
    }
    
    /// An action method called by the New menu command, this method creates a new NSDocument object and adds it to the list of such objects managed by the document controller.
    @IBAction func newDocument(_ sender: Any?) {
        //This method calls openUntitledDocumentAndDisplay(_:).
        //print(self, #function)
        if let document = try? DocumentController.shared.openUntitledDocumentAndDisplay(false) {
            addDocument(document)
        }
    }
    
    // Hacking private NSDocumentController action
    @IBAction func _openRecentDocument(_ sender: Any?) {
        //print(self, #function, sender)
        if let menuItem = sender as? NSMenuItem,
           let repobj = menuItem.representedObject as? NSObject,
           let url = repobj.value(forKey:"URL") as? URL {
            //print(self, #function, url)
            open(url)
        }
    }

    // State save and restore
    
    /// Saves the interface-related state of the responder.
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with:coder)

        let directoryURL: URL? = filesDocument?.fileURL
        let docURLs: [URL?] = activeDocuments.map{$0.fileURL}
        //print(self, #function, window ?? "nil", directoryURL ?? "nil", docURLs)
        coder.encode(directoryURL, forKey:Self.directoryKey)
        coder.encode(Int64(docURLs.count), forKey:Self.documentCountKey)
        for i in docURLs.indices {
            coder.encode(docURLs[i], forKey:Self.documentsKey+String(i))
        }
    }

    /// Restores the interface-related state of the responder.
    override func restoreState(with coder: NSCoder) {
        super.restoreState(with:coder)
        
        if let url = coder.decodeObject(forKey:Self.directoryKey) as? URL {
            filesDocument = try? FilesDocument(contentsOf: url, ofType: "public.folder")
        }
        let count = coder.decodeInt64(forKey:Self.documentCountKey)
        //print(self, #function, window, count, coder.decodeInt64(forKey:"NSWindowNumber"))
        for i in 0..<count {
            if let url = coder.decodeObject(forKey:Self.documentsKey+String(i)) as? URL? {
                //print("restore URL", url ?? "nil")
                if let url = url {
                    open(url)
                }
            }
        }
    }

    static let documentsKey = "activeDocuments",
               documentCountKey = documentsKey+"Count",
               directoryKey = "currentDirectory"
      
//    override func setDocumentEdited(_ dirtyFlag: Bool) {
//        print(self, #function, document?.fileURL ?? "nil", dirtyFlag)
//        let callStack: [String] = Thread.callStackSymbols
//        print(callStack[2])
//        print(callStack[3])
//        if callStack[2].contains("-[NSWindowController setDocument:]") {
//        } else if callStack[3].contains("-[NSDocument objectDidBeginEditing:]") {
//        } else if callStack[3].contains("-[NSDocument(NSDocumentSaving) _finishSavingToURL:ofType:forSaveOperation:changeCount:]") {
//        } else if callStack[3].contains("-[NSDocument _updateStateFromEdited:showsPanel:recentChanges:unautosavedChanges:afterSaving:]") {
//        } else {
//            callStack.map{print($0)}
//        }
//        super.setDocumentEdited(dirtyFlag)
//    }

    func saveOrDiscardAlert(_ document: NSDocument, _ sender: NSWindow?)->Bool {
        let alert = NSAlert()
        alert.alertStyle = .warning
        alert.messageText = "Do you want to save the changes made to the document “\(document.fileURL?.absoluteString ?? "Untitled")”?"
        alert.informativeText = "Your changes will be lost if you don’t save them."
        alert.addButton(withTitle: "Save")
        alert.addButton(withTitle: "Cancel")
        alert.addButton(withTitle: "Don't save")
        switch alert.runModal() {
        case .alertFirstButtonReturn: // Save
            document.save(sender)
        case .alertSecondButtonReturn: // Cancel
            return false
        case .alertThirdButtonReturn: // Don't save
            //revert.insert(document)
            document.close()
        default:
            return false
        }
        return true
    }

    //    @IBAction func newWindow(_ sender: Any) {
    //        //print(self, #function)
    //        window!.resignMain() // inform ViewableDocument to create new Window controller
    //            //NOTE: resignMain() does not change NSApplication.shared.mainWindow
    //        do {
    //            let newDocument = try DocumentController.shared.openUntitledDocumentAndDisplay(true)
    //            if let window0 = newDocument.windowControllers[0].window {
    //                window0.moveTabToNewWindow(sender)
    //            }
    //        } catch {
    //            print(self, #function, "error", error)
    //            presentError(error)
    //        }
    //    }
    //
    //    @IBAction func openInNewWindow(_ sender: Any) {
    //        //print(self,#function)
    //        DocumentController.shared.beginOpenPanel() { urls in
    //            self.window?.resignMain() // inform ViewableDocument to create new Window controller
    //                //NOTE: resignMain() does not change NSApplication.shared.mainWindow
    //            if let urls = urls {
    //                for url in urls {
    //                    DocumentController.shared.openDocument(withContentsOf: url,
    //                                                             display: true) {
    //                        document, documentWasAlreadyOpen, error in
    //                            if let error = error {
    //                                print(self, #function, "error", error)
    //                                self.presentError(error)
    //                            } else if documentWasAlreadyOpen {
    //                                // TODO
    //                            } else if let document = document {
    //                                if let window0 = document.windowControllers[0].window {
    //                                    window0.moveTabToNewWindow(sender)
    //                                }
    //                            }
    //                    }
    //                }
    //            }
    //        }
    //    }

}

extension FilesWindowController: NSWindowDelegate {
    
    /// Tells the delegate that the user has attempted to close a window or the window has received a performClose(_:) message.
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        //print(self, #function, activeDocuments.map{$0.fileURL})
        var allowClose = true
        var revert = Set<NSDocument>()
        for document in activeDocuments {
            //TODO use? document.canClose(withDelegate: self, shouldClose: #selector(TabsWindowController.shouldCloseDocument), contextInfo: nil/*TODO*/)
            if document.isDocumentEdited {
                allowClose = allowClose && saveOrDiscardAlert(document, sender)
            }
        }
        if allowClose {
            for document in revert {
                document.revertToSaved(sender)
            }
        }
        return allowClose
    }
    
//    func windowWillClose(_ notification: Notification) {
//        print(self, #function, notification)
//        Thread.callStackSymbols.forEach{print($0)}
//    }

//    func windowDidBecomeMain(_ notification: Notification) {
//        Swift.print(self, #function)
//    }
//    
//    func windowDidResignMain(_ notification: Notification) {
//        Swift.print(self, #function)
//    }
//  
//    func windowDidBecomeKey(_ notification: Notification) {
//        Swift.print(self, #function)
//    }
//    
//    func windowDidResignKey(_ notification: Notification) {
//        Swift.print(self, #function)
//    }

}
