//
//  LineNumberRulerView.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-10-20.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//
// https://github.com/iRASPA/iRASPA-COCOA/blob/master/LogViewKit/LineNumberRulerView.swift
// https://github.com/yichizhang/NSTextView-LineNumberView/blob/master/Source/LineNumberRulerView.swift
// https://github.com/raphaelhanneken/line-number-text-view/blob/master/LineNumberTextView/LineNumberTextView/LineNumberGutter.swift
// https://github.com/sjhorn/SwiftEdit/blob/master/SwiftEdit/RulerView.swift
// https://github.com/brutella/TextViewLineNumbers/blob/master/TextViewLineNumbers/LineNumberRulerView.swift
// https://github.com/coteditor/CotEditor/blob/develop/CotEditor/Sources/LineNumberView.swift
// https://github.com/coteditor/CotEditor/blob/develop/CotEditor/Sources/NSTextView%2BLineNumber.swift
// https://github.com/MrNoodle/NoodleKit/blob/master/NoodleLineNumberView.m

import Cocoa

public class LineNumberRulerView: NSRulerView {
    
    var font: NSFont! {
        didSet {
            self.needsDisplay = true
        }
    }
    
    static let AVENIR_NEXT_CONDENSED = "Avenir Next Condensed"

    public init(textView: NSTextView) {
        super.init(scrollView: textView.enclosingScrollView!, orientation: NSRulerView.Orientation.verticalRuler)
        self.font = NSFont(name: LineNumberRulerView.AVENIR_NEXT_CONDENSED, size: NSFont.smallSystemFontSize) ??
            NSFont.systemFont(ofSize: NSFont.smallSystemFontSize, weight: .light)
        //print("LineNumberRulerView font", font.debugDescription)
        self.clientView = textView
        self.ruleThickness = 35
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var backgroundColor: NSColor = NSColor.clear {
        didSet {
            needsDisplay = true
        }
    }
    
    // excerpt from https://github.com/jpsim/SwiftEdit/blob/master/SwiftEdit/RulerView.swift
    public override var clientView: NSView? {
        willSet {
            let center = NotificationCenter.default
            if let oldView = clientView as? NSTextView, oldView != newValue {
                center.removeObserver(self, name: NSText.didEndEditingNotification, object: oldView.textStorage)
                center.removeObserver(self, name: NSView.boundsDidChangeNotification, object: scrollView?.contentView)
            }
            center.addObserver(self, selector: #selector(LineNumberRulerView.textDidChange(_:)), name: NSText.didChangeNotification, object: newValue)
            scrollView?.contentView.postsBoundsChangedNotifications = true
            center.addObserver(self, selector: #selector(LineNumberRulerView.boundsDidChange(_:)), name: NSView.boundsDidChangeNotification, object: scrollView?.contentView)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func boundsDidChange(_ notification: Notification) {
        needsDisplay = true
    }

    @objc func textDidChange(_ notification: Notification) {
        needsDisplay = true
    }
    
    public override func drawHashMarksAndLabels(in rect: NSRect) {
        backgroundColor.set()
        rect.fill()
        
        // excerpts from:
        // https://github.com/coteditor/CotEditor/blob/develop/CotEditor/Sources/NSTextView%2BLineNumber.swift,
        // https://github.com/yichizhang/NSTextView-LineNumberView/blob/master/Source/LineNumberRulerView.swift
        let lineNumberAttributes: [NSAttributedString.Key : Any] = [
                    .font: self.font!,
                    .foregroundColor: NSColor.secondaryLabelColor]
        let highlightedNumberAttributes: [NSAttributedString.Key : Any] = [
                    .font: self.font!,
                    //.backgroundColor: NSColor.selectedTextBackgroundColor.withAlphaComponent(0.5),
                    .foregroundColor: NSColor.textColor]
        if let textView = self.clientView as? NSTextView {
            let selectedRange = textView.selectedRange()
            let relativePoint = self.convert(NSZeroPoint, from: textView)
            if let layoutManager = textView.layoutManager {
                if let visibleRect = textView.enclosingScrollView?.contentView.bounds {
                    if let textContainer = textView.textContainer {
                        let visibleGlyphRange = layoutManager.glyphRange(forBoundingRect:visibleRect,
                                                                         in:textContainer)
                        let firstCharIndex = layoutManager.characterIndexForGlyph(at:visibleGlyphRange.location)
                        var lineNum = LineNumberRulerView.lineAndColumnNumber(at: firstCharIndex,
                                                                              in:textView.string).0
                        var glyphIndex = visibleGlyphRange.location
                        while glyphIndex < visibleGlyphRange.upperBound {
                            let charIndex = layoutManager.characterIndexForGlyph(at: glyphIndex)
                            let lineCharRange = (textView.string as NSString).lineRange(for: NSMakeRange(charIndex, 0))
                            let lineGlyphRange = layoutManager.glyphRange(forCharacterRange: lineCharRange,
                                                                          actualCharacterRange: nil)
                            glyphIndex = lineGlyphRange.upperBound
// markers for wrapped lines:
//                            var wrappedLineGlyphIndex = max(lineGlyphRange.location, glyphRange.lowerBound)
//                            while wrappedLineGlyphIndex < min(glyphIndex, glyphRange.upperBound) {
//                                var range = NSRange(location: NSNotFound, length: 0)
//                                let lineRect = layoutManager.lineFragmentRect(forGlyphAt: wrappedLineGlyphIndex, effectiveRange: &range, withoutAdditionalLayout: true)
//                                //let line: Line = (range.location == lineGlyphRange.location) ? .new(lineNumber, isSelected) : .wrapped
//
//                                //body(line, lineRect)
//
//                                wrappedLineGlyphIndex = range.upperBound
//                            }
                            // number only first line if wrapped
                            var range = NSRange(location: NSNotFound, length: 0)
                            let lineRect = layoutManager.lineFragmentRect(forGlyphAt: lineGlyphRange.location,
                                                                          effectiveRange: &range,
                                                                          withoutAdditionalLayout: true)
                            //print(lineNum,lineRect.minY)
                            let inSelectedRange = NSLocationInRange(selectedRange.lowerBound, lineCharRange)
                                                || NSLocationInRange(selectedRange.upperBound, lineCharRange)
                            //Swift.print(className, #function, lineCharRange, selectedRange)
                            let attrs = inSelectedRange ? highlightedNumberAttributes : lineNumberAttributes
                            drawString(String(lineNum), attributes:attrs,
                                       centerY:relativePoint.y+lineRect.midY)

                            lineNum += 1
                        }
                        if let _ = layoutManager.extraLineFragmentTextContainer {
                            drawString(String(lineNum), attributes:lineNumberAttributes,
                                       centerY:relativePoint.y+layoutManager.extraLineFragmentRect.midY)
                        }
                    }
                }
            }
        }
    }
    
    static func lineAndColumnNumber(at location:Int, in string:String)->(Int,Int) {
        // excerpt from https://github.com/coteditor/CotEditor/blob/develop/CotEditor/Sources/String%2BCounting.swift
        guard !string.isEmpty, location > 0 else { return (1,1) }
        guard let characterRange = Range(NSRange(..<location), in:string) else { return (1,1) }
        var enumerateCount = 0, lastLineStartIndex = string.startIndex, partialLine = true
        string.enumerateSubstrings(in: characterRange,
                                   options: [.byLines, .substringNotRequired]) { (substring, substringRange, enclosingRange, stop) in
            enumerateCount += 1
            lastLineStartIndex = enclosingRange.lowerBound
            partialLine = substringRange == enclosingRange
        }
        //print("lineAndColumnNumber",enumerateCount,partialLine,string[lastLineStartIndex..<characterRange.upperBound])
        if partialLine { return (enumerateCount, string.distance(from:lastLineStartIndex, to:characterRange.upperBound)+1) }
        else { return (enumerateCount+1, 1)}
    }

    fileprivate func drawString(_ string:String, attributes: [NSAttributedString.Key:Any], centerY:CGFloat) {
        let attString = NSAttributedString(string: string, attributes: attributes)
        
        // calculate x position and check width
        let x = self.ruleThickness - 5 - attString.size().width
        if x < 0 {
            // need more room to draw
            //print("LineNumberRulerView ruleThickness",attString.size().width)
            self.ruleThickness = attString.size().width+7
        }
        let y = centerY - attString.size().height / 2
        attString.draw(at: NSPoint(x:x, y:y))
        //TODO centre vertically
    }

}
