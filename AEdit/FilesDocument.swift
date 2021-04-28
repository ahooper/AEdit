//
//  FilesDocument.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-01-30.
//

import Cocoa

class FilesDocument: NSDocument {

    override func makeWindowControllers() {
        //Swift.print(self, #function, fileURL)
        let storyboard = NSStoryboard(name:NSStoryboard.Name("Main"), bundle:nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Files Window Controller")) as! NSWindowController
        addWindowController(windowController)
        windowController.contentViewController?.representedObject = self
    }
    
    override func read(from fileWrapper:FileWrapper, ofType typeName:String) throws {
        //Swift.print(self, #function, fileWrapper.filename, typeName)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        //Swift.print(self, #function, typeName, "unexpected call")
        return try super.data(ofType: typeName) // throws "[General] dataOfType:error: is a subclass responsibility but has not been overridden."
    }

}
