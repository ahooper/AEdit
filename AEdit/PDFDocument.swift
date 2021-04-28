//
//  PDFDocument.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-02-21.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Cocoa
import PDFKit

class PDFDocument: ViewableDocument {
    @objc var content: PDFKit.PDFDocument?
    
    override class var autosavesInPlace: Bool { false }
    
    override func read(from data: Data, ofType typeName: String) throws {
        content = PDFKit.PDFDocument(data:data)
    }
    
    // read only, no write
    
    override func makePrimaryViewController()->NSViewController {
        let storyboard = NSStoryboard.main!
        let viewController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("PDF Document View Controller")) as! NSViewController
        viewController.representedObject = self
        let pdfView = viewController.view.subviews[0] as! PDFView
        pdfView.document = content // PDFView does not have a Cocoa binding!
        pdfView.autoScales = true
        return viewController
    }

}
