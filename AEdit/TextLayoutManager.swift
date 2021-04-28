//
//  TextLayoutManager.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-11-18.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//
//  https://stackoverflow.com/a/29681234/302852
// https://stackoverflow.com/a/576474/302852
// https://lists.apple.com/archives/cocoa-dev/2005/Jan/msg00075.html

import Cocoa

// CotEditor-3.8.9/CotEditor/Sources/LayoutManager.swift

class TextLayoutManager: NSLayoutManager {
    
    override init() {
        super.init()

        showsInvisibles = Defaults[.showInvisibles]
        showInvisiblesObserver = Defaults.observe(key:.showInvisibles, options:[.new]) { update in
            //print(self.className, "observe showInvisibles", update.newValue ?? "NIL")
            self.showsInvisibles = update.newValue ?? false
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var showInvisiblesObserver: DefaultsObserver?

    var showsInvisibles = false {
        didSet {
            guard let textStorage = textStorage else { return /*assertionFailure()*/ }
            guard showsInvisibles != oldValue else { return }
            
            let wholeRange = NSRange(..<textStorage.length)
            invalidateDisplay(forCharacterRange: wholeRange)
        }
    }
    
    var usesAntialias = true
    
    var textFont: NSFont? { // only used for spacing and invisible characters
        didSet {
            guard let textFont = textFont else { return }
            
            // cache metric values to fix line height
            defaultLineHeight = defaultLineHeight(for: textFont)
            defaultBaselineOffset = defaultBaselineOffset(for: textFont)
            
            // cache width of space char for hanging indent width calculation
            spaceWidth = textFont.advancement(forGlyph: textFont.glyph(withName: "space")).width
            //print(self.className, #function, textFont.description, "defaultLineHeight", defaultLineHeight, "defaultBaselineOffset", defaultBaselineOffset, "spaceWidth", spaceWidth)
            
            invisibleLines = generateInvisibleLines()
        }
    }
    
    var invisiblesColor = NSColor.disabledControlTextColor {
        didSet {
            invisibleLines = generateInvisibleLines()
        }
    }
    
    private(set) var spaceWidth: CGFloat = 0
    private(set) var defaultBaselineOffset: CGFloat = 0  // defaultBaselineOffset for textFont
    
    private var defaultLineHeight: CGFloat = 1.0
    
    private lazy var invisibleLines: InvisibleLines = generateInvisibleLines()
    
    private struct InvisibleLines {
        let space: CTLine
        let tab: CTLine
        let newLine: CTLine
        let fullwidthSpace: CTLine
    }
    
    private func generateInvisibleLines() -> InvisibleLines {
        let fontSize = textFont?.pointSize ?? 0
        let systemFont = NSFont.systemFont(ofSize: fontSize)
        let textFont = self.textFont ?? systemFont
        let fullWidthFont = NSFont(name:"HiraginoSans-W3", size:fontSize) ?? systemFont
        // CotEditor-3.8.9/CotEditor/Sources/Invisible.swift
        return InvisibleLines(space: invisibleLine("·", font: textFont),// ["·", "°", "ː", "␣"]
                              tab: invisibleLine("▹", font: systemFont), // ["¬", "⇥", "‣", "▹"]
                              newLine: invisibleLine("↵", font: systemFont), // ["¶", "↩", "↵", "⏎"]
                              fullwidthSpace: invisibleLine("□", font: fullWidthFont)) // ["□", "⊠", "■", "•"]
    }

    private func invisibleLine(_ symbol:String, font:NSFont)->CTLine {
        let attrString = NSAttributedString(string:symbol, attributes: [.foregroundColor: invisiblesColor,
                                                                         .font: font])
        return CTLineCreateWithAttributedString(attrString)
    }

    override func drawGlyphs(forGlyphRange glyphsToShow: NSRange, at origin: NSPoint) {
        // CotEditor-3.8.9/CotEditor/Sources/LayoutManager.swift
        //print(self.className, #function, glyphsToShow, origin)
        NSGraphicsContext.saveGraphicsState()
        
        if NSGraphicsContext.currentContextDrawingToScreen() {
            NSGraphicsContext.current?.shouldAntialias = usesAntialias
        }

        if showsInvisibles,
            let context = NSGraphicsContext.current?.cgContext,
            let string = textStorage?.string as NSString?
        {
            //let isVertical = (self.firstTextView?.layoutOrientation == .vertical)
            //let isRTL = (self.firstTextView?.baseWritingDirection == .rightToLeft)
            let isOpaque = self.firstTextView?.isOpaque ?? true
            
            if !isOpaque {
                context.setShouldSmoothFonts(false)
            }
            
            if NSGraphicsContext.current?.isFlipped ?? false {
                context.textMatrix = CGAffineTransform(scaleX: 1.0, y: -1.0)
            }
            
            for glyphIndex in Range(glyphsToShow)! {
                let characterIndex = characterIndexForGlyph(at:glyphIndex)
                let codeUnit = string.character(at:characterIndex)
                var line: CTLine
                var lower: CGFloat = 0

                switch codeUnit {
                case 0x0020, 0x00A0:  // SPACE, NO-BREAK SPACE
                    line = invisibleLines.space
                case 0x0009:  // HORIZONTAL TABULATION a.k.a. \t
                    line = invisibleLines.tab
                case 0x000A:  // LINE FEED a.k.a. \n
                    line = invisibleLines.newLine
                    var descent: CGFloat = 0
                    CTLineGetTypographicBounds(line, nil, &descent, nil)
                    //print(self.className, #function, "descent", descent)
                    lower = descent //KLUDGE TODO flipped coordinates, vertical layout
                case 0x3000:  // IDEOGRAPHIC SPACE a.k.a. full-width space (JP)
                    line = invisibleLines.fullwidthSpace
                default:
                    continue // nothing extra to draw
                }

                let lineOrigin = lineFragmentRect(forGlyphAt: glyphIndex,
                                                  effectiveRange: nil,
                                                  withoutAdditionalLayout: true).origin
                let glyphLocation = location(forGlyphAt: glyphIndex)
                let point = lineOrigin.offsetBy(origin).offsetBy(dx: glyphLocation.x,
                                                                 dy: defaultBaselineOffset+lower)
                //print(#function, codeUnit, lineOrigin, glyphLocation, point)
                //TODO corrections for vertical and RTL
                
                context.textPosition = point
                CTLineDraw(line, context)

            }
        }
        
        super.drawGlyphs(forGlyphRange:glyphsToShow, at:origin)
        
        NSGraphicsContext.restoreGraphicsState()
    }
    
    var deferInvalidateDisplay = false // used in SyntaxHighlighter while making bulk changes
    override func invalidateDisplay(forGlyphRange glyphRange: NSRange) {
        if deferInvalidateDisplay { return }
        super.invalidateDisplay(forGlyphRange: glyphRange)
    }
    
    override func invalidateDisplay(forCharacterRange charRange: NSRange) {
        if deferInvalidateDisplay { return }
        super.invalidateDisplay(forCharacterRange: charRange)
    }
    
}

extension CGPoint {
    func offsetBy(dx:CGFloat, dy:CGFloat)->CGPoint {
        return CGPoint(x:x+dx, y:y+dy)
    }
    func offsetBy(_ d:CGPoint)->CGPoint {
        return CGPoint(x:x+d.x, y:y+d.y)
    }
}
