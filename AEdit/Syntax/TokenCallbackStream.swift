//
//  TokenCallbackStream.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-11.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Antlr4

class TokenCallbackSource:TokenSource {
    let lexer: Lexer
    let callback: (Token)->Void
    
    init(_ lexer:Lexer, _ callback:@escaping (Token)->Void) {
        self.lexer = lexer
        self.callback = callback
    }
    
    /// Return a _org.antlr.v4.runtime.Token_ object from your input stream (usually a
    /// _org.antlr.v4.runtime.CharStream_). Do not fail/return upon lexing error; keep chewing
    /// on the characters until you get a good one; errors are not passed through
    /// to the parser.
    ///
    func nextToken() throws -> Token {
        let next: Token = try lexer.nextToken()
        callback(next)
        return next
    }
    
    /// Get the line number for the current position in the input stream. The
    /// first line in the input is line 1.
    ///
    /// - Returns: The line number for the current position in the input stream, or
    /// 0 if the current token source does not track line numbers.
    ///
    func getLine() -> Int {
        return lexer.getLine()
    }
    
    /// Get the index into the current line for the current position in the input
    /// stream. The first character on a line has position 0.
    ///
    /// - Returns: The line number for the current position in the input stream, or
    /// -1 if the current token source does not track character positions.
    ///
    func getCharPositionInLine() -> Int {
        return lexer.getCharPositionInLine()
    }
    
    /// Get the _org.antlr.v4.runtime.CharStream_ from which this token source is currently
    /// providing tokens.
    ///
    /// - Returns: The _org.antlr.v4.runtime.CharStream_ associated with the current position in
    /// the input, or `null` if no input stream is available for the token
    /// source.
    ///
    func getInputStream() -> CharStream? {
        return lexer.getInputStream()
    }
    
    /// Gets the name of the underlying input source. This method returns a
    /// non-null, non-empty string. If such a name is not known, this method
    /// returns _org.antlr.v4.runtime.IntStream#UNKNOWN_SOURCE_NAME_.
    ///
    func getSourceName() -> String {
        return lexer.getSourceName()
    }
    
    /// Set the _org.antlr.v4.runtime.TokenFactory_ this token source should use for creating
    /// _org.antlr.v4.runtime.Token_ objects from the input.
    ///
    /// - Parameter factory: The _org.antlr.v4.runtime.TokenFactory_ to use for creating tokens.
    ///
    func setTokenFactory(_ factory: TokenFactory) {
        return lexer.setTokenFactory(factory)
    }
    
    /// Gets the _org.antlr.v4.runtime.TokenFactory_ this token source is currently using for
    /// creating _org.antlr.v4.runtime.Token_ objects from the input.
    ///
    /// - Returns: The _org.antlr.v4.runtime.TokenFactory_ currently used by this token source.
    ///
    func getTokenFactory() -> TokenFactory {
        return lexer.getTokenFactory()
    }

}

class TokenCallbackStream: TokenStream {
    // This is a wrapper as Antlr4.CommonTokenStream is not open to extend outside its package
    let source: CommonTokenStream
    let callback: (Token)->Void
    
    init(_ source: CommonTokenStream, _ callback: @escaping (Token)->Void) {
        self.source = source
        self.callback = callback
    }
    
    func LT(_ k: Int) throws -> Token? {
        return try source.LT(k)
    }
    
    func get(_ index: Int) throws -> Token {
        return try source.get(index)
    }
    
    func getTokenSource() -> TokenSource {
        return source.getTokenSource()
    }
    
    func getText(_ interval: Interval) throws -> String {
        return try source.getText(interval)
    }
    
    func getText() throws -> String {
        return try source.getText()
    }
    
    func getText(_ ctx: RuleContext) throws -> String {
        return try source.getText(ctx)
    }
    
    func getText(_ start: Token?, _ stop: Token?) throws -> String {
        return try source.getText(start, stop)
    }
    
    func consume() throws {
        try callback(get(1))
        return try source.consume()
    }
    
    func LA(_ i: Int) throws -> Int {
        return try source.LA(i)
    }
    
    func mark() -> Int {
        return source.mark()
    }
    
    func release(_ marker: Int) throws {
        return source.release(marker)
    }
    
    func index() -> Int {
        return source.index()
    }
    
    func seek(_ index: Int) throws {
        return try source.seek(index)
    }
    
    func size() -> Int {
        return source.size()
    }
    
    func getSourceName() -> String {
        return source.getSourceName()
    }
    
}
