//
//  TextDocument.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-10-22.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Cocoa

class TextDocument: ViewableDocument {
    
    var content = NSTextStorage()
    var typeName = "public.plain-text"
    var encoding = String.Encoding.utf8
    static let internalLineEnding = "\n"
    var lineEnding = internalLineEnding
    static let lineEndCharacterSet = CharacterSet(charactersIn:"\n\r\u{2028}\u{2029}")
    static let lineEndRegExpPattern = "\\r\\n|[\\n\\r\\u2028\\u2029]"
    var syntaxHighlighter: SyntaxHighlighter?

    //TODO https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/DocBasedAppProgrammingGuideForOSX/ManagingLifecycle/ManagingLifecycle.html

    override init() {
        super.init()
    }

    override class var autosavesInPlace: Bool {
        return false /*TODO*/
    }
    
    override func canAsynchronouslyWrite(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType) -> Bool {
        return false
    }
    
    override class func canConcurrentlyReadDocuments(ofType: String) -> Bool {
        return ofType == "public.text"
    }

    fileprivate func replaceContent(_ string: String) {
        content.mutableString.setString("")
        // remove the layout managers while loading the text
        let layoutManagers = content.layoutManagers
        for layoutManager in layoutManagers {
            content.removeLayoutManager(layoutManager)
        }

        // ensure internalLineEnding to simplify interface between NSTextView and ANTLR
        if let lineEndRange = string.rangeOfCharacter(from: Self.lineEndCharacterSet) {
            lineEnding = String(string[lineEndRange])
            if lineEnding == "\r",
               lineEndRange.upperBound < string.endIndex,
               string[lineEndRange.upperBound] == "\n" {
                lineEnding = "\r\n"
            }
            Swift.print(fileURL, "lineEnding", lineEnding.debugDescription, lineEnding.count)
            // Swift's count of "\r\n" is 1
        }
        
        content.beginEditing()
        if lineEnding == Self.internalLineEnding {
            content.mutableString.setString(string)
        } else {
            content.mutableString.setString(string.replacingOccurrences(of: Self.lineEndRegExpPattern,
                                                                        with: Self.internalLineEnding,
                                                                        options: .regularExpression))
        }
        content.endEditing()

        // replace the layout managers after loading the text
        for layoutManager in layoutManagers {
            content.addLayoutManager(layoutManager)
        }

    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        //Swift.print(self, #function, typeName, fileURL ?? "NIL")
        self.typeName = typeName
        if let decoded = String(bytes: data, encoding: .utf8) {
            replaceContent(decoded)
            encoding = .utf8
        } else if let decoded = String(bytes: data, encoding: .macOSRoman) {
            replaceContent(decoded)
            encoding = .macOSRoman
        } else if let decoded = String(bytes: data, encoding: .ascii) {
            replaceContent(decoded)
            encoding = .ascii
        } else if data[0] == 0xFE && data[1] == 0xFF,
                    let decoded = String(bytes: data, encoding: .utf16BigEndian) {
            replaceContent(decoded)
            encoding = .utf16BigEndian
        } else if data[0] == 0xFF && data[1] == 0xFE,
                    let decoded = String(bytes: data, encoding: .utf16LittleEndian) {
            replaceContent(decoded)
            encoding = .utf16LittleEndian
        } else {
            replaceContent("** UNRECOGNIZED FILE ENCODING **")
        }
        //TODO check for binary data
        syntaxHighlighter = SyntaxHighlighter(typeName:typeName, pathExtension:fileURL?.pathExtension, content)
    }

    override func data(ofType typeName: String) throws -> Data {
        Swift.print(className, #function, typeName, fileURL ?? "nil")
        if lineEnding == Self.internalLineEnding {
            return content.string.data(using:encoding)!
        }
        return content.string.replacingOccurrences(of: Self.internalLineEnding,
                                                   with: lineEnding).data(using:encoding)!
    }
    
    override func makePrimaryViewController()->NSViewController {
        let storyboard = NSStoryboard.main!
        let viewController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Text Document View Controller")) as! NSViewController
        viewController.representedObject = self
        return viewController
    }
    
    override func save(_ sender: Any?) {
        //Swift.print(self, #function, typeName, fileURL ?? "nil", isDocumentEdited)
        // Hairy - make the NSTextView stop editing to commit and release the
        // textStorage so save can complete
        // https://blog.mbcharbonneau.com/2006/12/17/end-editing-in-an-nstextfield/
        // https://redsweater.com//blog/229/stay-responsive
        var resumeFirstResponder: NSResponder?
        for layoutManager in content.layoutManagers {
            if let textView = layoutManager.textViewForBeginningOfSelection {
                if let window = textView.window {
                    Swift.print(className, #function, layoutManager.layoutManagerOwnsFirstResponder(in: window),
                                window.firstResponder)
                    resumeFirstResponder = window.firstResponder
                    if resumeFirstResponder != nil {
                        let ok = window.makeFirstResponder(nil)
                        Swift.print(className, #function, "remove first responder", ok)
                    }
                }
            }
        }

        super.save(sender)
        
        //Swift.print(self, #function, fileURL ?? "nil", isDocumentEdited)
        
        // Resume the first responder saved above
        if let resumeFirstResponder = resumeFirstResponder {
            for layoutManager in content.layoutManagers {
                if let textView = layoutManager.textViewForBeginningOfSelection {
                    if let window = textView.window {
                        let ok = window.makeFirstResponder(resumeFirstResponder)
                        Swift.print(className, #function, "resume first responder", ok)
                    }
                }
            }
        }

        //Swift.print(self, #function, fileURL ?? "nil", isDocumentEdited)

    }

    override func save(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType, completionHandler: @escaping (Error?) -> Void) {
        for layoutManager in self.content.layoutManagers {// from CotEditor-3.8.9/CotEditor/Sources/Document.swift
            layoutManager.textViewForBeginningOfSelection?.breakUndoCoalescing()
        }
        super.save(to: url, ofType: typeName, for: saveOperation, completionHandler: completionHandler)
    }

#if DEBUG

//    override func write(to url: URL, ofType typeName: String) throws {
//        Swift.print(className, #function, fileURL ?? "nil")
//        try super.write(to: url, ofType: typeName)
//    }
//
//    override func write(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType, originalContentsURL absoluteOriginalContentsURL: URL?) throws {
//        Swift.print(className, #function, fileURL ?? "nil")
//        try super.write(to: url, ofType: typeName, for: saveOperation, originalContentsURL: absoluteOriginalContentsURL)
//    }

////override func save(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType, delegate: Any?, didSave didSaveSelector: Selector?, contextInfo: UnsafeMutableRawPointer?) {
//    super.save(to: url, ofType: typeName, for: saveOperation, delegate: delegate, didSave: didSaveSelector, contextInfo: contextInfo)
//}
//override func writeSafely(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType) throws {
//    try super.writeSafely(to: url, ofType: typeName, for: saveOperation)
//}

    override func restoreWindow(withIdentifier identifier: NSUserInterfaceItemIdentifier, state: NSCoder, completionHandler: @escaping (NSWindow?, Error?) -> Void) {
        //Swift.print(self, #function, identifier)
        super.restoreWindow(withIdentifier: identifier, state: state, completionHandler: completionHandler)
    }
#endif
    
}

