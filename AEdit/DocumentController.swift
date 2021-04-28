//
//  DocumentController.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-01-28.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Cocoa

class DocumentController: NSDocumentController {
    
    override func runModalOpenPanel(_ openPanel:NSOpenPanel, forTypes types:[String]?)->Int {
        //print(#function, types)
        openPanel.canChooseDirectories = true
        return super.runModalOpenPanel(openPanel, forTypes:types)
    }

#if XDEBUG

    override func removeDocument(_ document: NSDocument) {
        //print(className, #function, document.displayName, documents.contains(document), documents.map{$0.displayName})
        super.removeDocument(document)
    }
    
    override func openDocument(withContentsOf url: URL, display displayDocument: Bool, completionHandler: @escaping (NSDocument?, Bool, Error?) -> Void) {
        //print(className, #function, url, displayDocument)
        super.openDocument(withContentsOf:url, display:displayDocument, completionHandler:completionHandler)
    }
    
    override func openUntitledDocumentAndDisplay(_ displayDocument: Bool) throws -> NSDocument {
        //print(className, #function, displayDocument)
        return try super.openUntitledDocumentAndDisplay(displayDocument)
    }

    override func document(for url: URL) -> NSDocument? {
        //print(className, #function, url)
        return super.document(for:url)
    }

    override func makeUntitledDocument(ofType typeName: String) throws -> NSDocument {
        //print(className, #function, typeName)
        return try super.makeUntitledDocument(ofType:typeName)
    }

    override func reopenDocument(for urlOrNil: URL?, withContentsOf contentsURL: URL, display displayDocument: Bool, completionHandler: @escaping (NSDocument?, Bool, Error?) -> Void) {
        //print(className, #function, urlOrNil, contentsURL, displayDocument)
        super.reopenDocument(for: urlOrNil, withContentsOf: contentsURL, display: displayDocument, completionHandler: completionHandler)
    }

    #endif
    
    // https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/DocBasedAppProgrammingGuideForOSX/StandardBehaviors/StandardBehaviors.html#//apple_ref/doc/uid/TP40011179-CH5-SW8
    /*  From NSWindowRestoration.h
    The following message is sent to request that a window be restored.  If the receiver knows how to restore the identified window, it should invoke the completion handler with the window, possibly creating it.  It is acceptable to invoke the completion handler with a pre-existing window, though you should not pass the same window to more than one completion handler.  If the receiver cannot restore the identified window (for example, the window referenced a document that has been deleted), it should invoke the completion handler with a nil window.  In Mac OS X 10.7, the error parameter is ignored.
     
     The receiver is passed the identifier of the window, which allows the receiver to quickly check for known windows.  For example, you might give your preferences window an identifier of "preferences" in the nib, and then check for that identifier in your implementation.  The receiver is also passed the NSCoder containing the combined restorable state of the window, its delegate, the window controller, and any document.  The receiver may decode information previously stored in the coder to determine what window to restore.
     
     Note that the receiver may invoke the completion handler before or after the method returns, and on any queue.  If you plan to invoke the completion handler after the method returns, you must copy the completion handler via the -copy method, and -release it after you invoke it.  It is not necessary or recommended for implementations of this method to order restored windows onscreen (for example, the window may have been minimized, in which case it will not be ordered onscreen).
     
     */
    override class func restoreWindow(withIdentifier identifier: NSUserInterfaceItemIdentifier, state: NSCoder, completionHandler: @escaping (NSWindow?, Error?) -> Void) {
        if identifier.rawValue == "Files Window",
           let url = state.decodeObject(forKey:FilesWindowController.directoryKey) as? URL {
            //print("DocumentController", #function, url)
            let filesDocument = try? FilesDocument(contentsOf: url, ofType: "public.folder")
            filesDocument?.makeWindowControllers()
            let win = filesDocument?.windowControllers[0].window
            completionHandler(win, nil)
        } else {
            // unrecognized window
            print("DocumentController", #function, "Unrecogized", identifier)
            super.restoreWindow(withIdentifier:identifier, state:state, completionHandler:completionHandler)
        }
    }
    
}
