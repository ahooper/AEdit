//
//  SyntaxHighlighter.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-04.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//
//  https://www.noodlesoft.com/blog/2012/05/29/syntax-coloring-for-fun-and-profit/
//  https://christiantietze.de/posts/2017/11/syntax-highlight-nstextstorage-insertion-point-change/

import Cocoa

class SyntaxStyle: NSObject {
    static let attributeKey = NSAttributedString.Key("AEdit.SyntaxStyle")
    static let styleNnotificationName = Notification.Name("AEdit.SyntaxStyleDidChange")
    let name:String
    var attributes:[NSAttributedString.Key: Any] = [:]
    var colourObserver: DefaultsObserver?
    
    init(_ name:String) {
        self.name = name
    }
    
    func colourFromDefaults(_ attributeKey:NSAttributedString.Key, _ defaultsColourKey:DefaultsKey<NSColor>) {
        attributes[attributeKey] = Defaults[defaultsColourKey]
        colourObserver = Defaults.observe(key: defaultsColourKey, options:[.new]) { update in
            //print(self.className, "observe", defaultsColourKey, update.newValue ?? "nil")
            if let newValue = update.newValue {
                self.attributes[attributeKey] = newValue
                NotificationCenter.default.post(Notification(name:Self.styleNnotificationName, object:self, userInfo: nil))
            }
        }
    }
    
}

class SyntaxHighlighter: NSObject {
    let textStorage:NSTextStorage
    let typeName:String, pathExtension:String?
    var commentStyle = SyntaxStyle("comment"),
        literalStyle = SyntaxStyle("literal"),
        keywordStyle = SyntaxStyle("keyword"),
        preprocessorStyle = SyntaxStyle("preprocessor"),
        typenameStyle = SyntaxStyle("typename")
    var tokenTypeStyle: [SyntaxStyle?]
    let scanner: SyntaxScan

    init(typeName:String, pathExtension:String?, _ textStorage:NSTextStorage) {
        self.typeName = typeName
        self.pathExtension = pathExtension
        self.textStorage = textStorage
        tokenTypeStyle = []
        scanner = SyntaxScan(typeName:typeName, pathExtension:pathExtension)
        definitions = []
        super.init()
        textStorage.delegate = self
        commentStyle.colourFromDefaults(.foregroundColor, .commentColour)
        literalStyle.colourFromDefaults(.foregroundColor, .literalColour)
        keywordStyle.colourFromDefaults(.foregroundColor, .keywordColour)
        preprocessorStyle.colourFromDefaults(.foregroundColor, .preprocessorColour)
        typenameStyle.colourFromDefaults(.foregroundColor, .typenameColour)
    }

    fileprivate func mapTokenToStyle(_ typeMap:[String:Int]) {
        //print(typeMap.keys)
        tokenTypeStyle = []
        var unrecognized = [String]()
        for (symbol,number) in typeMap {
            while number >= tokenTypeStyle.count {
                tokenTypeStyle.append(nil)
            }
            switch symbol {
            case "Comment":
                tokenTypeStyle[number] = commentStyle
            case "Literal":
                tokenTypeStyle[number] = literalStyle
            case "Keyword":
                tokenTypeStyle[number] = keywordStyle
            case "Preprocessor":
                tokenTypeStyle[number] = preprocessorStyle
            case "Typename":
                tokenTypeStyle[number] = typenameStyle
            default:
                unrecognized.append(symbol)
            }
        }
        if !unrecognized.isEmpty {
            print(className, #function, "Unrecognized symbol(s)", unrecognized)
        }
    }
    
    func oldScanTokens() {
        //print(className, #function)
        let scanRange = NSRange(..<textStorage.length)
        //TODO selective range from start of change
        for layoutManager in textStorage.layoutManagers {
            layoutManager.delegate = self
            layoutManager.removeTemporaryAttribute(SyntaxStyle.attributeKey, forCharacterRange:scanRange)
        }
        let content = textStorage.attributedSubstring(from:scanRange).string

        if let lexer = scanner.createLexer(contentString:content) {
            mapTokenToStyle(lexer.getTokenTypeMap())
            //let vocabulary = lexer.getVocabulary()
            let startTime = DispatchTime.now()
            var numTokens = 0
            do {
                while true {
                    let token = try lexer.nextToken()
                    numTokens += 1
                    //SyntaxScan.printToken(token, vocabulary)
                    let tokenType = token.getType()
                    if tokenTypeStyle.indices.contains(tokenType),
                       let style = tokenTypeStyle[tokenType] {
                        let tokenRange = NSRange(token.getStartIndex()...token.getStopIndex())
                        //print(tokenRange, style.name)
                        for layoutManager in textStorage.layoutManagers {
                            layoutManager.addTemporaryAttribute(SyntaxStyle.attributeKey, value:style, forCharacterRange:tokenRange)
                        }
                    }
                    if token.getType() == SyntaxScan.EOF { break }
                }
            } catch {
                print(className, #function, error)
            }
            let time = Float(DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds) / 1e9
            print(time, "seconds", numTokens, "tokens", content.count, "characters", time/Float(numTokens), "per token")
        }
    }
    
    func XXXscanTokens() {
        //print(className, #function)
        let scanRange = NSRange(..<textStorage.length)
        //TODO selective range from start of change
        for layoutManager in textStorage.layoutManagers {
            layoutManager.delegate = self
            layoutManager.removeTemporaryAttribute(SyntaxStyle.attributeKey, forCharacterRange:scanRange)
        }
        let content = textStorage.attributedSubstring(from:scanRange).string

        if let parser = scanner.createParser(contentString: content) {
            let ruleIndex = parser.getRuleIndex("highlightScan")
            for style in [commentStyle, literalStyle, keywordStyle, preprocessorStyle, typenameStyle] {
                scanner.setRuleListener(parser:parser, ruleName:style.name,
                                        action:{ [self] token,startIndex,stopIndex in
                    let tokenRange = NSRange(startIndex...stopIndex)
                    //print(style.name, tokenRange, content[Range(tokenRange, in:content)!])
                    for layoutManager in textStorage.layoutManagers {
                        layoutManager.addTemporaryAttribute(SyntaxStyle.attributeKey, value:style,
                                                            forCharacterRange:tokenRange)
                    }
                })
            }
            
            let startTime = DispatchTime.now()
            
            do {
                _ = try parser.parse(ruleIndex)
            } catch {
                print(className, #function, error)
            }

            let numTokens = (try? parser.getCurrentToken().getTokenIndex()) ?? 0
            let time = Float(DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds) / 1e9
            print(#function, time, "seconds", numTokens, "tokens", content.count, "characters", time/Float(numTokens), "per token")
        }
    }
    
    #if DEBUG
    // Debug scan takes significantly longer than Release
    static let tokensDebounceTime = DispatchTimeInterval.milliseconds(1000)
    static let definitionsDebounceTime = DispatchTimeInterval.milliseconds(5000)
    #else
    static let tokensDebounceTime = DispatchTimeInterval.milliseconds(500)
    static let definitionsDebounceTime = DispatchTimeInterval.milliseconds(2000)
    #endif
    let backgroundTokensQueue = DebounceQueue(delay: tokensDebounceTime,
                                              label: "ca.netdull.AEdit.SyntaxHighlighter.scanTokens")
    let backgroundDefinitionsQueue = DebounceQueue(delay: definitionsDebounceTime,
                                                   label: "ca.netdull.AEdit.SyntaxHighlighter.scanDefinitions")

    func scanTokensWork()->DispatchWorkItem {
        // contortion to capture a "self" WorkItem reference
        var item: DispatchWorkItem?
        item = DispatchWorkItem { [self] in
            //print(className, #function)
            let scanRange = NSRange(..<textStorage.length)
            var styleRanges = [(range:NSRange, style:SyntaxStyle)]() // can't apply layout attributes directly from backgrund thread
            let content = textStorage.attributedSubstring(from:scanRange).string

            if let parser = scanner.createParser(contentString: content) {
                //TODO can the parser be created in initialization, and the input string set later here?
                for style in [commentStyle, literalStyle, keywordStyle, preprocessorStyle, typenameStyle] {
                    scanner.setRuleListener(parser:parser, ruleName:style.name,
                                            action:{ token,startIndex,stopIndex in
                        let tokenRange = NSRange(startIndex...stopIndex)
                        let stringRange: Range<String.Index>? = Range(tokenRange, in:content)
                        //print(style.name, tokenRange, content[stringRange!].debugDescription)
                        styleRanges.append((range:tokenRange, style:style))
                    })
                }
                
                let ruleIndex = parser.getRuleIndex("highlightScan")
                let startTime = DispatchTime.now()
                
                do {
                    guard !item!.isCancelled else {
                        print(className, #function, "cancelled")
                        return
                    }
                    _ = try parser.parse(ruleIndex)
                } catch {
                    print(className, #function, error)
                }
                guard !item!.isCancelled else {
                    print(className, #function, "cancelled")
                    return
                }

                // apply token attributes on UI main thread
                DispatchQueue.main.sync {
                    for layoutManager in textStorage.layoutManagers {
                        // suspend update while attributes are changed
                        if let textLayoutManager = layoutManager as? TextLayoutManager {
                            textLayoutManager.deferInvalidateDisplay = true
                        }
                        layoutManager.removeTemporaryAttribute(SyntaxStyle.attributeKey, forCharacterRange:scanRange)
                        _ = styleRanges.map {
                            layoutManager.addTemporaryAttribute(SyntaxStyle.attributeKey,
                                                                value: $0.style,
                                                                forCharacterRange: $0.range)
                        }
                        if let textLayoutManager = layoutManager as? TextLayoutManager {
                            textLayoutManager.deferInvalidateDisplay = false
                            textLayoutManager.invalidateDisplay(forCharacterRange: scanRange)
                        }
                    }
                }

                let numTokens = (try? parser.getCurrentToken().getTokenIndex()) ?? 0
                let time = Float(DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds) / 1e9
                print(#function, time, "seconds", numTokens, "tokens", content.count, "characters", time/Float(numTokens), "per token")
            }
        }
        return item!
    }
    
    func scheduleScan() {
        // TODO only need this once, but where is the best point?
        for layoutManager in textStorage.layoutManagers {
            layoutManager.delegate = self
        }
        backgroundTokensQueue.schedule(scanTokensWork())
        backgroundDefinitionsQueue.schedule(scanDefinitionsWork())
    }
    
    typealias SymbolDefinition = (name:Substring,position:NSRange)
    var definitions: [SymbolDefinition]
    static let definitionsNnotificationName = Notification.Name("AEdit.DefinitionsDidChange")

    private func scanDefinitionsWork()->DispatchWorkItem {
        // contortion to capture a "self" WorkItem reference
        var item: DispatchWorkItem?
        item = DispatchWorkItem { [self] in
            //print(className, #function)
            let scanRange = NSRange(..<textStorage.length)
            //TODO selective range from start of change
            let content = textStorage.attributedSubstring(from:scanRange).string
            definitions = []

            if let parser = scanner.createParser(contentString: content) {
                scanner.setRuleListener(parser:parser, ruleName:"defined",
                                        action:{ [self] token,startIndex,stopIndex in
                    let tokenRange = NSRange(startIndex...stopIndex)
                    //print("defined", tokenRange, content[Range(tokenRange, in:content)!])
                    definitions.append((name: content[Range(tokenRange, in:content)!],
                                        position: tokenRange))
                })

                let startTime = DispatchTime.now()
                
                let ruleIndex = parser.getRuleIndex("definitionScan")
                do {
                    _ = try parser.parse(ruleIndex)
                } catch {
                    print(className, #function, error)
                }
                
                DispatchQueue.main.async {
                    NotificationCenter.default.post(Notification(name:Self.definitionsNnotificationName, object:self, userInfo: nil))
                }

                let numTokens = (try? parser.getCurrentToken().getTokenIndex()) ?? 0
                let time = Float(DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds) / 1e9
                print(#function, time, "seconds", numTokens, "tokens", time/Float(numTokens), "per token")
            }

        }
        return item!
    }
}

extension SyntaxHighlighter: NSTextStorageDelegate {
    
    func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorageEditActions, range editedRange: NSRange, changeInLength delta: Int) {
        //print(className, #function, editedMask, editedRange, delta)
//        OperationQueue.main.addOperation {
//            self.scanTokens()
//        }
        scheduleScan()
    }
    
}

extension SyntaxHighlighter: NSLayoutManagerDelegate {
    
    func layoutManager(_ layoutManager: NSLayoutManager, shouldUseTemporaryAttributes attrs: [NSAttributedString.Key : Any] = [:], forDrawingToScreen toScreen: Bool, atCharacterIndex charIndex: Int, effectiveRange effectiveCharRange: NSRangePointer?) -> [NSAttributedString.Key : Any]? {
        if toScreen {
            if let style = attrs[SyntaxStyle.attributeKey] as? SyntaxStyle {
                //print(className, /*#function,*/ effectiveCharRange?.pointee ?? "nil", style.name)
                return style.attributes
            }
        }
        return attrs // nothing applied
    }
    
}

extension SyntaxHighlighter: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return definitions.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        definitions[row]
    }
    
}
