//
//  ViewableDocument.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-11-18.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Cocoa

class ViewableDocument: NSDocument {

    func makePrimaryViewController()->NSViewController {
        fatalError("makePrimaryViewController() is a subclass responsibility but has not been overridden.")
    }
    
    override func makeWindowControllers() {
        //Swift.print(self, #function, fileURL ?? "nil")
        // do nothing, driven by TabsWindowController
    }
    
    #if XDEBUG
    
    override func addWindowController(_ windowController: NSWindowController) {
        //Swift.print(self, #function)
        super.addWindowController(windowController)
    }
    
    override func removeWindowController(_ windowController: NSWindowController) {
        //Swift.print(self, #function)
        super.removeWindowController(windowController)
    }
    
    #endif

}
