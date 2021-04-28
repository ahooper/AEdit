//
//  SyntaxScan.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-02-23.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//
//  Add dependency on a local swift package in Xcode: https://stackoverflow.com/a/59183124
//  System-Declared Uniform Type Identifiers:  https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1

import Foundation
import Antlr4

class SyntaxScan {
    static let className = "SyntaxScan"
    
    static let PLIST_RESOURCE_TYPE = "plist"
    static let INTERP_RESOURCE_TYPE = "interp"
    static let LEXER_RESOURCE_SUFFIX = "Lexer"

    struct SyntaxConfig: Codable {
        let syntaxName: String
        let fileNameExtensions: [String]
        let documentContentTypeIdentifiers:[String]
        let grammarName:String
    }
    typealias Configs = [SyntaxConfig]
    static var config: Configs?
    
    private static var byExtension = [String:String]()
    private static var byContentType = [String:String]()
    
    static func loadConfig() {
        //for interpPath in Bundle.main.paths(forResourcesOfType: Self.INTERP_RESOURCE_TYPE,
        //                                    inDirectory: "") {
        //    print(interpPath)
        //}
        if let configPath = Bundle.main.path(forResource:Self.className, ofType:Self.PLIST_RESOURCE_TYPE),
           let configXML = FileManager.default.contents(atPath:configPath) {
            do {
                config = try PropertyListDecoder().decode(Configs.self, from:configXML)
                //print(className, config ?? "No configuration \(configPath)")
                
                for config in Self.config! {
                    for ext in config.fileNameExtensions {
                        if byExtension[ext] == nil {
                            byExtension[ext] = config.grammarName
                        } else {
                            reportDuplicate("extension", ext, byExtension[ext]!, config)
                        }
                    }
                    for ct in config.documentContentTypeIdentifiers {
                        if byContentType[ct] == nil {
                            byContentType[ct] = config.grammarName
                        } else {
                            reportDuplicate("content type", ct, byContentType[ct]!, config)
                        }
                    }
                }
            } catch {
                print(className, #function, configPath, error)
                config = []
                byExtension = [:]
                byContentType = [:]
            }
        }
    }
    
    fileprivate static func reportDuplicate(_ by:String, _ name:String, _ prior:String, _ config:SyntaxConfig) {
        print(className, #function, by, name, "duplicate defined as", config.grammarName, "and", prior)
    }

    class ErrorReporter: BaseErrorListener {
        override func syntaxError<T>(_ recognizer: Recognizer<T>, _ offendingSymbol: AnyObject?, _ line: Int, _ charPositionInLine: Int, _ msg: String, _ e: AnyObject?) where T : ATNSimulator {
            Swift.print(SyntaxScan.className, "line \(line):\(charPositionInLine)", msg)
        }
    }
    
    static let errorReporter = ErrorReporter()
    let lexerData: InterpreterDataReader?
    let parserData: InterpreterDataReader?

    init(typeName:String, pathExtension:String?) {
        if Self.config == nil { Self.loadConfig() }
        var lexer: InterpreterDataReader? = nil
        var parser: InterpreterDataReader? = nil
        do {
            if let grammarName = Self.byContentType[typeName] ??
                                 Self.byExtension[pathExtension ?? " NONE "] {
                if let lexerPath = Bundle.main.path(forResource: grammarName+Self.LEXER_RESOURCE_SUFFIX,
                                                    ofType: Self.INTERP_RESOURCE_TYPE,
                                                    inDirectory: "") {
                    let lex = try InterpreterDataReader(lexerPath)
                    lexer = lex
                    if let parserPath = Bundle.main.path(forResource: grammarName,
                                                         ofType: Self.INTERP_RESOURCE_TYPE,
                                                         inDirectory: "") {
                        let parse = try InterpreterDataReader(parserPath)
                        parser = parse
                    } else {
                        print(Self.className, #function, "resource \(grammarName).\(Self.INTERP_RESOURCE_TYPE) not found")
                    }
                } else {
                    print(Self.className, #function, "resource \(grammarName+Self.LEXER_RESOURCE_SUFFIX).\(Self.INTERP_RESOURCE_TYPE) not found")
                }
            } else {
                print(Self.className, #function, "no scanner configured for content type", typeName, "extension",  pathExtension ?? "\"\"")
            }
        } catch {
            print(Self.className, #function, error)
        }
        self.lexerData = lexer
        self.parserData = parser
    }

    func createLexer(contentString:String)->LexerInterpreter? {
        guard let lexerData = lexerData
        else { return nil }
        let input = ANTLRInputStream(contentString)
        do {
            let lexer = try lexerData.createLexer(input:input)
            lexer.removeErrorListeners()
            lexer.addErrorListener(Self.errorReporter)
            return lexer
        } catch {
            print(Self.className, #function, error)
            return nil
        }
    }
    
    var parserSave: ParserInterpreter?

    func createParser(contentString:String, lexerCallback:@escaping (Token)->Void)->ParserInterpreter? {
        guard let lexer = createLexer(contentString:contentString),
              let parserData = parserData
        else { return nil }
        let inspector = TokenCallbackSource(lexer, lexerCallback)
        let input = CommonTokenStream(inspector)
        do {
            let parser = try parserData.createParser(input:input)
            parser.removeErrorListeners()
            parser.addErrorListener(Self.errorReporter)
            return parser
        } catch {
            print(Self.className, #function, error)
            return nil
        }
    }

    private func reuseOrCreateParser(input:TokenStream)throws->ParserInterpreter? {
        guard let parserData = parserData
        else { return nil }
        if let saved = parserSave {
            let parser = try ParserInterpreter(saved)
            try parser.setInputStream(input)
            return parser
        }
        let parser = try parserData.createParser(input:input)
        parserSave = parser
        return parser
    }
    
    typealias ParseRuleListener = (Token,Int,Int)->Void
    
    class ScanListener: ParseTreeListener {
        let parser: Parser
        let vocabulary: Vocabulary
        let ruleNames: [String]
        private var ruleListener: [ParseRuleListener?]
        
        init(_ parser:Parser) {
            self.parser = parser
            self.vocabulary = parser.getVocabulary()
            self.ruleNames = parser.getRuleNames()
            self.ruleListener = [ParseRuleListener?](repeating:nil, count:ruleNames.count)
        }
        
        fileprivate func displayName(_ token: Token)->String {
            let tokenType: Int = token.getType()
            return vocabulary.getSymbolicName(tokenType) ?? vocabulary.getLiteralName(tokenType) ?? vocabulary.getDisplayName(tokenType)
        }
        
        func visitTerminal(_ node: TerminalNode) {
            let token = node.getSymbol()!
            //print("Terminal", displayName(token), token, parser.getState(), parser.getExpectedTokensWithinCurrentRule())
        }
        
        func visitErrorNode(_ node: ErrorNode) {
            let token = node.getSymbol()!
            print("Error", displayName(token), token.getText(), parser.getState(), parser.getExpectedTokensWithinCurrentRule())
        }
        
        func enterEveryRule(_ ctx: ParserRuleContext) throws {
            // TODO enterEveryRule is not called by ParseInterpreter - is that an ANTLR bug?
            print("Enter", ctx.toInfoString(parser))
        }
        
        func setRuleListener(_ ruleName:String, _ action:@escaping ParseRuleListener) {
            if let ruleIndex = ruleNames.firstIndex(of: ruleName) {
                ruleListener[ruleIndex] = action
            } else {
                print(#function, parser.getGrammarFileName(), "rule name not found", ruleName)
            }
        }
        
        func exitEveryRule(_ ctx: ParserRuleContext) throws {
            let ruleIndex = ctx.getRuleIndex()
            if let listener = ruleListener[ruleIndex] {
                precondition(ctx.start?.getInputStream() === ctx.stop?.getInputStream())
                if let token = ctx.getStart() {
                    listener(token, token.getStartIndex(), token.getStopIndex())
                }
            }
        }
    }
    
    func setRuleListener(parser:ParserInterpreter, ruleName:String, action:@escaping ParseRuleListener) {
        let parseListener = parser.getParseListeners()[0] as! ScanListener
        parseListener.setRuleListener(ruleName, action)
    }
    
    func createParser(contentString:String)->ParserInterpreter? {
        guard let lexer = createLexer(contentString:contentString)
        else { return nil }
        let input = CommonTokenStream(lexer)
        do {
            if let parser = try reuseOrCreateParser(input:input) {
                parser.setBuildParseTree(true)
                            // Using ParserInterpreter, with setBuildParseTree(false), the intermediate
                            // RuleContexts between the rootContext and parse tip will have no strong
                            // references. This will result in the intermediate context(s) being
                            // deallocated, the parent reference(s) becoming nil, and cause a "Fatal
                            // error: Unexpectedly found nil while unwrapping an Optional value" in
                            // ParserATNSimulator when returning from the tip rule.
                parser.setTrace(false)
                parser.removeErrorListeners()
                parser.addErrorListener(Self.errorReporter)
                parser.removeParseListeners()
                let parseListener: SyntaxScan.ScanListener = ScanListener(parser)
                parser.addParseListener(parseListener)
                return parser
            }
        } catch {
            print(Self.className, #function, error)
        }
        return nil
    }

    func printScan(contentString:String) {
        if let lexer = createLexer(contentString:contentString) {
            do {
                let vocabulary = lexer.getVocabulary()
                while true {
                    let token = try lexer.nextToken()
                    Self.printToken(token, vocabulary)
                    if token.getType() == Self.EOF { break }
                }
            } catch {
                print(Self.className, #function, error)
            }
        }
    }
    
    static let EOF = ANTLRInputStream.EOF
    
    static func tokenTypeString(_ vocabulary: Vocabulary, _ token: Token) -> String {
        return vocabulary.getSymbolicName(token.getType()) ??
               vocabulary.getLiteralName(token.getType()) ??
               String(token.getType())
    }
    
    static func printToken(_ token: Token, _ vocabulary: Vocabulary) {
        let channelStr = (token.getChannel() > 0 ? ",channel=\(token.getChannel())" : "")
        var txt: String
        if let tokenText = token.getText() {
            txt = tokenText.replacingOccurrences(of: "\n", with: "\\n")
            txt = txt.replacingOccurrences(of: "\r", with: "\\r")
            txt = txt.replacingOccurrences(of: "\t", with: "\\t")
        } else {
            txt = "<no text>"
        }
        print(token.getTokenIndex(), token.getStartIndex(), token.getStopIndex(),
              tokenTypeString(vocabulary, token),
              channelStr, token.getLine(), token.getCharPositionInLine(), txt)
    }

}
