//
//  TextEditView.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-20.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Cocoa

extension String {
    init(anyString: Any) {
        switch anyString {
        case let string as String:
            self = string
        case let attributedString as NSAttributedString:
            self = attributedString.string
        default:
            preconditionFailure()
        }
    }
}

class TextEditView: NSTextView {
    
    var tabInterval = 4 // local copy to allow temporary setting
    
    override func insertText(_ string: Any, replacementRange: NSRange) {
        guard isEditable
        else {
            return super.insertText(string, replacementRange: replacementRange)
        }
        let input = String(anyString:string)

        if replacementRange.length == 0,
           input == "}" {
            // drop last indent level
            let line = linePrefix(range:replacementRange)
            if line.allSatisfy({ $0.isWhitespace }) {
                if line.last == "\t" {
                    deleteBackward(nil)
                } else if line.hasSuffix(String(repeating:" ", count:tabInterval)) {
                    for _ in 0..<tabInterval { deleteBackward(nil) }
                }
            }
        }

        super.insertText(string, replacementRange: replacementRange)
    }
    
    func linePrefix(range:NSRange)->Substring {
        let rangeInString: Range<String.Index> = Range(range, in:self.string)!
        var lineStart = self.string.startIndex,
            lineEnd = self.string.endIndex,
            contentsEnd = self.string.endIndex
        self.string.getLineStart(&lineStart, end:&lineEnd, contentsEnd:&contentsEnd, for:rangeInString)
        // don't need lineEnd nor contentsEnd, but nil pointers can't be passed for these in Swift
        // unless string is cast to NSString (which then requires converting the result to String.Index)
        return self.string[lineStart..<(rangeInString.lowerBound)]
    }
    
    override func insertNewline(_ sender: Any?) {
        guard isEditable
        else {
            return super.insertNewline(sender)
        }

        let line = linePrefix(range:selectedRange)

        super.insertNewline(sender)
        
        let leadingWhitespace = line.prefix{ $0.isWhitespace },
            insertRange = self.selectedRange // selectedRange is now empty and located after the inserted newline
        if line.last == "{" || line.last == ":" {
            // increase indent on this new line
            if leadingWhitespace.last == "\t" {
                super.insertText(leadingWhitespace+"\t", replacementRange:insertRange)
            } else {
                super.insertText(leadingWhitespace+String(repeating:" ", count:self.tabInterval),
                                 replacementRange:insertRange)
            }
        } else {
            super.insertText(leadingWhitespace, replacementRange:insertRange)
        }
    }
    
    override func insertTab(_ sender: Any?) {
        //TODO indent lines when selection ranges are not empty
        return super.insertTab(sender)
    }
    
    override func insertBacktab(_ sender: Any?) {
        // un-indent lines in selection 
        let range = self.selectedRange
        let rangeInString: Range<String.Index> = Range(range, in:self.string)!
        var lineStart = self.string.startIndex,
            lineEnd = self.string.endIndex,
            contentsEnd = self.string.endIndex // not used
        let tabSpaces = String(repeating:" ", count:self.tabInterval)
        // treat each line in the range
        var point = rangeInString.lowerBound,
            dropRanges = [NSRange]()
        repeat {
            self.string.getLineStart(&lineStart, end:&lineEnd, contentsEnd:&contentsEnd, for:point..<point)
            // don't need contentsEnd but can't pass a nil to omit it
            //print(#function, self.string[lineStart..<lineEnd].debugDescription)
            let line = self.string[lineStart..<lineEnd]
            let leadingWhitespace = line.prefix { character in character.isWhitespace }
            if leadingWhitespace.last == "\t" {
                let lastIndex = self.string.index(lineStart, offsetBy: leadingWhitespace.count-1)
                dropRanges.append(NSRange(lastIndex...lastIndex, in:self.string))
            } else if leadingWhitespace.hasSuffix(tabSpaces) {
                let dropEndIndex = self.string.index(lineStart, offsetBy: leadingWhitespace.count),
                    dropStartIndex = self.string.index(dropEndIndex, offsetBy: -tabSpaces.count)
                dropRanges.append(NSRange(dropStartIndex..<dropEndIndex, in:self.string))
            }
            point = lineEnd
        } while point < rangeInString.upperBound
        print(#function, dropRanges)
        // apply to textStorage
        //TODO does not undo properly
        if let textStorage = textStorage {
            textStorage.beginEditing()
            // reverse enumeration because indexes will shift as characters are removed
            for range in dropRanges.reversed() {
                textStorage.replaceCharacters(in:range, with:"")
            }
            textStorage.endEditing()
        }
    }

    override func deleteBackward(_ sender: Any?) {
        return super.deleteBackward(sender)
    }
    
}

extension TextEditView {

    // highlight selected lines
    // https://lists.apple.com/archives/cocoa-dev/2011/Nov/msg00135.html
    override func drawBackground(in rect: NSRect) {
        super.drawBackground(in: rect)
        if let linesRect = selectedLinesRect() {
            let highlightColour = NSColor.selectedTextBackgroundColor.withAlphaComponent(0.3)
            highlightColour.set()
            NSBezierPath.fill(linesRect)
        }
    }
    
    func selectedLinesRect()->NSRect? {
        guard let layoutManager = self.layoutManager,
              let textContainer = self.textContainer
        else { return nil }
        let selectedRange = self.selectedRange()
        if selectedRange.location < self.string.count {
            let rangeInString: Range<String.Index> = Range(selectedRange, in:self.string)!
            var firstLineStart = self.string.startIndex,
                lastLineEnd = self.string.endIndex,
                contentsEnd = self.string.endIndex // not used
            self.string.getLineStart(&firstLineStart, end:&lastLineEnd, contentsEnd:&contentsEnd, for:rangeInString)
            // don't need contentsEnd but can't pass a nil to omit it
            let selectedCharacterRange = NSRange(firstLineStart..<lastLineEnd, in:self.string)
            let glyphRange = layoutManager.glyphRange(forCharacterRange: selectedCharacterRange,
                                                            actualCharacterRange: nil)
            return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
        }
        return nil
    }

}
