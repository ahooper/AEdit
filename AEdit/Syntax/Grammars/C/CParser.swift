// Generated from /Users/andy/Software/Xcode/AEdit/AEdit/Syntax/Grammars/C/C.antlr4 by ANTLR 4.9.1
import Antlr4

open class CParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = CParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(CParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, 
                 T__6 = 7, T__7 = 8, T__8 = 9, T__9 = 10, T__10 = 11, T__11 = 12, 
                 T__12 = 13, T__13 = 14, T__14 = 15, T__15 = 16, T__16 = 17, 
                 T__17 = 18, T__18 = 19, T__19 = 20, T__20 = 21, T__21 = 22, 
                 T__22 = 23, T__23 = 24, T__24 = 25, T__25 = 26, T__26 = 27, 
                 T__27 = 28, T__28 = 29, T__29 = 30, T__30 = 31, T__31 = 32, 
                 T__32 = 33, T__33 = 34, T__34 = 35, T__35 = 36, T__36 = 37, 
                 T__37 = 38, T__38 = 39, T__39 = 40, T__40 = 41, T__41 = 42, 
                 T__42 = 43, T__43 = 44, T__44 = 45, T__45 = 46, T__46 = 47, 
                 T__47 = 48, T__48 = 49, T__49 = 50, T__50 = 51, T__51 = 52, 
                 T__52 = 53, T__53 = 54, T__54 = 55, T__55 = 56, T__56 = 57, 
                 T__57 = 58, T__58 = 59, T__59 = 60, T__60 = 61, T__61 = 62, 
                 T__62 = 63, T__63 = 64, T__64 = 65, T__65 = 66, T__66 = 67, 
                 T__67 = 68, T__68 = 69, T__69 = 70, T__70 = 71, T__71 = 72, 
                 T__72 = 73, T__73 = 74, T__74 = 75, T__75 = 76, T__76 = 77, 
                 T__77 = 78, T__78 = 79, T__79 = 80, T__80 = 81, T__81 = 82, 
                 T__82 = 83, T__83 = 84, T__84 = 85, T__85 = 86, Identifier = 87, 
                 Literal = 88, Preprocessor = 89, Whitespace = 90, Newline = 91, 
                 Comment = 92, OTHER = 93
	}

	public
	static let RULE_highlightScan = 0, RULE_keyword = 1, RULE_typename = 2, 
            RULE_operator_ = 3, RULE_identifier = 4, RULE_literal = 5, RULE_preprocessor = 6, 
            RULE_asmBlock = 7, RULE_comment = 8, RULE_definitionScan = 9, 
            RULE_definition = 10, RULE_defined = 11, RULE_balanced = 12

	public
	static let ruleNames: [String] = [
		"highlightScan", "keyword", "typename", "operator_", "identifier", "literal", 
		"preprocessor", "asmBlock", "comment", "definitionScan", "definition", 
		"defined", "balanced"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'break'", "'case'", "'continue'", "'default'", "'do'", "'else'", 
		"'for'", "'goto'", "'if'", "'_Pragma'", "'return'", "'switch'", "'while'", 
		"'asm'", "'__asm__'", "'bool'", "'_Bool'", "'char'", "'_Complex'", "'double'", 
		"'float'", "'_Imaginary'", "'int'", "'long'", "'short'", "'signed'", "'unsigned'", 
		"'void'", "'enum'", "'struct'", "'typedef'", "'union'", "'auto'", "'const'", 
		"'extern'", "'register'", "'restrict'", "'static'", "'volatile'", "'inline'", 
		"'<'", "'<='", "'>'", "'>='", "'<<'", "'>>'", "'+'", "'++'", "'-'", "'--'", 
		"'*'", "'/'", "'%'", "'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", 
		"'?'", "':'", "';'", "','", "'='", "'*='", "'/='", "'%='", "'+='", "'-='", 
		"'<<='", "'>>='", "'&='", "'^='", "'|='", "'=='", "'!='", "'->'", "'.'", 
		"'...'", "'{'", "'}'", "'('", "')'", "'['", "']'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, "Identifier", "Literal", "Preprocessor", "Whitespace", 
		"Newline", "Comment", "OTHER"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "C.antlr4" }

	override open
	func getRuleNames() -> [String] { return CParser.ruleNames }

	override open
	func getSerializedATN() -> String { return CParser._serializedATN }

	override open
	func getATN() -> ATN { return CParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return CParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,CParser._ATN,CParser._decisionToDFA, CParser._sharedContextCache)
	}


	public class HighlightScanContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(CParser.Tokens.EOF.rawValue, 0)
			}
			open
			func keyword() -> [KeywordContext] {
				return getRuleContexts(KeywordContext.self)
			}
			open
			func keyword(_ i: Int) -> KeywordContext? {
				return getRuleContext(KeywordContext.self, i)
			}
			open
			func typename() -> [TypenameContext] {
				return getRuleContexts(TypenameContext.self)
			}
			open
			func typename(_ i: Int) -> TypenameContext? {
				return getRuleContext(TypenameContext.self, i)
			}
			open
			func identifier() -> [IdentifierContext] {
				return getRuleContexts(IdentifierContext.self)
			}
			open
			func identifier(_ i: Int) -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, i)
			}
			open
			func literal() -> [LiteralContext] {
				return getRuleContexts(LiteralContext.self)
			}
			open
			func literal(_ i: Int) -> LiteralContext? {
				return getRuleContext(LiteralContext.self, i)
			}
			open
			func preprocessor() -> [PreprocessorContext] {
				return getRuleContexts(PreprocessorContext.self)
			}
			open
			func preprocessor(_ i: Int) -> PreprocessorContext? {
				return getRuleContext(PreprocessorContext.self, i)
			}
			open
			func comment() -> [CommentContext] {
				return getRuleContexts(CommentContext.self)
			}
			open
			func comment(_ i: Int) -> CommentContext? {
				return getRuleContext(CommentContext.self, i)
			}
			open
			func asmBlock() -> [AsmBlockContext] {
				return getRuleContexts(AsmBlockContext.self)
			}
			open
			func asmBlock(_ i: Int) -> AsmBlockContext? {
				return getRuleContext(AsmBlockContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_highlightScan
		}
	}
	@discardableResult
	 open func highlightScan() throws -> HighlightScanContext {
		var _localctx: HighlightScanContext = HighlightScanContext(_ctx, getState())
		try enterRule(_localctx, 0, CParser.RULE_highlightScan)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(36)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__81.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__83.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.T__85.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 64)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(34)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,0, _ctx)) {
		 		case 1:
		 			setState(26)
		 			try keyword()

		 			break
		 		case 2:
		 			setState(27)
		 			try typename()

		 			break
		 		case 3:
		 			setState(28)
		 			try identifier()

		 			break
		 		case 4:
		 			setState(29)
		 			try literal()

		 			break
		 		case 5:
		 			setState(30)
		 			try preprocessor()

		 			break
		 		case 6:
		 			setState(31)
		 			try comment()

		 			break
		 		case 7:
		 			setState(32)
		 			try asmBlock()

		 			break
		 		case 8:
		 			setState(33)
		 			try matchWildcard();

		 			break
		 		default: break
		 		}

		 		setState(38)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(39)
		 	try match(CParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class KeywordContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_keyword
		}
	}
	@discardableResult
	 open func keyword() throws -> KeywordContext {
		var _localctx: KeywordContext = KeywordContext(_ctx, getState())
		try enterRule(_localctx, 2, CParser.RULE_keyword)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(41)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypenameContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_typename
		}
	}
	@discardableResult
	 open func typename() throws -> TypenameContext {
		var _localctx: TypenameContext = TypenameContext(_ctx, getState())
		try enterRule(_localctx, 4, CParser.RULE_typename)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(43)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class Operator_Context: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_operator_
		}
	}
	@discardableResult
	 open func operator_() throws -> Operator_Context {
		var _localctx: Operator_Context = Operator_Context(_ctx, getState())
		try enterRule(_localctx, 6, CParser.RULE_operator_)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(45)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue,CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 41)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IdentifierContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_identifier
		}
	}
	@discardableResult
	 open func identifier() throws -> IdentifierContext {
		var _localctx: IdentifierContext = IdentifierContext(_ctx, getState())
		try enterRule(_localctx, 8, CParser.RULE_identifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(47)
		 	try match(CParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LiteralContext: ParserRuleContext {
			open
			func Literal() -> TerminalNode? {
				return getToken(CParser.Tokens.Literal.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_literal
		}
	}
	@discardableResult
	 open func literal() throws -> LiteralContext {
		var _localctx: LiteralContext = LiteralContext(_ctx, getState())
		try enterRule(_localctx, 10, CParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(49)
		 	try match(CParser.Tokens.Literal.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PreprocessorContext: ParserRuleContext {
			open
			func Preprocessor() -> TerminalNode? {
				return getToken(CParser.Tokens.Preprocessor.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_preprocessor
		}
	}
	@discardableResult
	 open func preprocessor() throws -> PreprocessorContext {
		var _localctx: PreprocessorContext = PreprocessorContext(_ctx, getState())
		try enterRule(_localctx, 12, CParser.RULE_preprocessor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(51)
		 	try match(CParser.Tokens.Preprocessor.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AsmBlockContext: ParserRuleContext {
			open
			func balanced() -> [BalancedContext] {
				return getRuleContexts(BalancedContext.self)
			}
			open
			func balanced(_ i: Int) -> BalancedContext? {
				return getRuleContext(BalancedContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_asmBlock
		}
	}
	@discardableResult
	 open func asmBlock() throws -> AsmBlockContext {
		var _localctx: AsmBlockContext = AsmBlockContext(_ctx, getState())
		try enterRule(_localctx, 14, CParser.RULE_asmBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(53)
		 	try match(CParser.Tokens.T__13.rawValue)
		 	setState(57)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__81.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__83.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.T__85.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 64)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(54)
		 		_la = try _input.LA(1)
		 		if (_la <= 0 || (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == CParser.Tokens.T__80.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}


		 		setState(59)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(60)
		 	try match(CParser.Tokens.T__80.rawValue)
		 	setState(64)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 64)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(61)
		 		try balanced()


		 		setState(66)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(67)
		 	try match(CParser.Tokens.T__81.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CommentContext: ParserRuleContext {
			open
			func Comment() -> TerminalNode? {
				return getToken(CParser.Tokens.Comment.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_comment
		}
	}
	@discardableResult
	 open func comment() throws -> CommentContext {
		var _localctx: CommentContext = CommentContext(_ctx, getState())
		try enterRule(_localctx, 16, CParser.RULE_comment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(69)
		 	try match(CParser.Tokens.Comment.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DefinitionScanContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(CParser.Tokens.EOF.rawValue, 0)
			}
			open
			func definition() -> [DefinitionContext] {
				return getRuleContexts(DefinitionContext.self)
			}
			open
			func definition(_ i: Int) -> DefinitionContext? {
				return getRuleContext(DefinitionContext.self, i)
			}
			open
			func balanced() -> [BalancedContext] {
				return getRuleContexts(BalancedContext.self)
			}
			open
			func balanced(_ i: Int) -> BalancedContext? {
				return getRuleContext(BalancedContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_definitionScan
		}
	}
	@discardableResult
	 open func definitionScan() throws -> DefinitionScanContext {
		var _localctx: DefinitionScanContext = DefinitionScanContext(_ctx, getState())
		try enterRule(_localctx, 18, CParser.RULE_definitionScan)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(75)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 64)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(73)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,4, _ctx)) {
		 		case 1:
		 			setState(71)
		 			try definition()

		 			break
		 		case 2:
		 			setState(72)
		 			try balanced()

		 			break
		 		default: break
		 		}

		 		setState(77)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(78)
		 	try match(CParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DefinitionContext: ParserRuleContext {
			open
			func Newline() -> [TerminalNode] {
				return getTokens(CParser.Tokens.Newline.rawValue)
			}
			open
			func Newline(_ i:Int) -> TerminalNode? {
				return getToken(CParser.Tokens.Newline.rawValue, i)
			}
			open
			func defined() -> DefinedContext? {
				return getRuleContext(DefinedContext.self, 0)
			}
			open
			func Identifier() -> [TerminalNode] {
				return getTokens(CParser.Tokens.Identifier.rawValue)
			}
			open
			func Identifier(_ i:Int) -> TerminalNode? {
				return getToken(CParser.Tokens.Identifier.rawValue, i)
			}
			open
			func typename() -> [TypenameContext] {
				return getRuleContexts(TypenameContext.self)
			}
			open
			func typename(_ i: Int) -> TypenameContext? {
				return getRuleContext(TypenameContext.self, i)
			}
			open
			func balanced() -> [BalancedContext] {
				return getRuleContexts(BalancedContext.self)
			}
			open
			func balanced(_ i: Int) -> BalancedContext? {
				return getRuleContext(BalancedContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_definition
		}
	}
	@discardableResult
	 open func definition() throws -> DefinitionContext {
		var _localctx: DefinitionContext = DefinitionContext(_ctx, getState())
		try enterRule(_localctx, 20, CParser.RULE_definition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(146)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,15, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(80)
		 		try match(CParser.Tokens.Newline.rawValue)
		 		setState(86); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(86)
		 				try _errHandler.sync(self)
		 				switch(try getInterpreter().adaptivePredict(_input,6, _ctx)) {
		 				case 1:
		 					setState(81)
		 					try match(CParser.Tokens.Identifier.rawValue)

		 					break
		 				case 2:
		 					setState(82)
		 					try typename()

		 					break
		 				case 3:
		 					setState(83)
		 					try match(CParser.Tokens.T__28.rawValue)

		 					break
		 				case 4:
		 					setState(84)
		 					try match(CParser.Tokens.T__29.rawValue)

		 					break
		 				case 5:
		 					setState(85)
		 					try match(CParser.Tokens.T__31.rawValue)

		 					break
		 				default: break
		 				}

		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(88); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)
		 		setState(93)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == CParser.Tokens.T__50.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(90)
		 			try match(CParser.Tokens.T__50.rawValue)


		 			setState(95)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(97)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == CParser.Tokens.Newline.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(96)
		 			try match(CParser.Tokens.Newline.rawValue)

		 		}

		 		setState(99)
		 		try defined()
		 		setState(100)
		 		try match(CParser.Tokens.T__82.rawValue)
		 		setState(104)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(101)
		 			try balanced()


		 			setState(106)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(107)
		 		try match(CParser.Tokens.T__83.rawValue)
		 		setState(109)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == CParser.Tokens.Newline.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(108)
		 			try match(CParser.Tokens.Newline.rawValue)

		 		}

		 		setState(111)
		 		try match(CParser.Tokens.T__80.rawValue)
		 		setState(115)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(112)
		 			try balanced()


		 			setState(117)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(118)
		 		try match(CParser.Tokens.T__81.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(120)
		 		try match(CParser.Tokens.Newline.rawValue)
		 		setState(121)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__31.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(122)
		 		try defined()
		 		setState(123)
		 		try match(CParser.Tokens.T__80.rawValue)
		 		setState(127)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(124)
		 			try balanced()


		 			setState(129)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(130)
		 		try match(CParser.Tokens.T__81.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(132)
		 		try match(CParser.Tokens.Newline.rawValue)
		 		setState(133)
		 		try match(CParser.Tokens.T__30.rawValue)
		 		setState(134)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__31.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(135)
		 		try match(CParser.Tokens.T__80.rawValue)
		 		setState(139)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(136)
		 			try balanced()


		 			setState(141)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(142)
		 		try match(CParser.Tokens.T__81.rawValue)
		 		setState(143)
		 		try defined()
		 		setState(144)
		 		try match(CParser.Tokens.T__62.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DefinedContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_defined
		}
	}
	@discardableResult
	 open func defined() throws -> DefinedContext {
		var _localctx: DefinedContext = DefinedContext(_ctx, getState())
		try enterRule(_localctx, 22, CParser.RULE_defined)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(148)
		 	try match(CParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BalancedContext: ParserRuleContext {
			open
			func balanced() -> [BalancedContext] {
				return getRuleContexts(BalancedContext.self)
			}
			open
			func balanced(_ i: Int) -> BalancedContext? {
				return getRuleContext(BalancedContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CParser.RULE_balanced
		}
	}
	@discardableResult
	 open func balanced() throws -> BalancedContext {
		var _localctx: BalancedContext = BalancedContext(_ctx, getState())
		try enterRule(_localctx, 24, CParser.RULE_balanced)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(175)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,19, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(150)
		 		try match(CParser.Tokens.T__82.rawValue)
		 		setState(154)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(151)
		 			try balanced()


		 			setState(156)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(157)
		 		try match(CParser.Tokens.T__83.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(158)
		 		try match(CParser.Tokens.T__84.rawValue)
		 		setState(162)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(159)
		 			try balanced()


		 			setState(164)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(165)
		 		try match(CParser.Tokens.T__85.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(166)
		 		try match(CParser.Tokens.T__80.rawValue)
		 		setState(170)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__0.rawValue,CParser.Tokens.T__1.rawValue,CParser.Tokens.T__2.rawValue,CParser.Tokens.T__3.rawValue,CParser.Tokens.T__4.rawValue,CParser.Tokens.T__5.rawValue,CParser.Tokens.T__6.rawValue,CParser.Tokens.T__7.rawValue,CParser.Tokens.T__8.rawValue,CParser.Tokens.T__9.rawValue,CParser.Tokens.T__10.rawValue,CParser.Tokens.T__11.rawValue,CParser.Tokens.T__12.rawValue,CParser.Tokens.T__13.rawValue,CParser.Tokens.T__14.rawValue,CParser.Tokens.T__15.rawValue,CParser.Tokens.T__16.rawValue,CParser.Tokens.T__17.rawValue,CParser.Tokens.T__18.rawValue,CParser.Tokens.T__19.rawValue,CParser.Tokens.T__20.rawValue,CParser.Tokens.T__21.rawValue,CParser.Tokens.T__22.rawValue,CParser.Tokens.T__23.rawValue,CParser.Tokens.T__24.rawValue,CParser.Tokens.T__25.rawValue,CParser.Tokens.T__26.rawValue,CParser.Tokens.T__27.rawValue,CParser.Tokens.T__28.rawValue,CParser.Tokens.T__29.rawValue,CParser.Tokens.T__30.rawValue,CParser.Tokens.T__31.rawValue,CParser.Tokens.T__32.rawValue,CParser.Tokens.T__33.rawValue,CParser.Tokens.T__34.rawValue,CParser.Tokens.T__35.rawValue,CParser.Tokens.T__36.rawValue,CParser.Tokens.T__37.rawValue,CParser.Tokens.T__38.rawValue,CParser.Tokens.T__39.rawValue,CParser.Tokens.T__40.rawValue,CParser.Tokens.T__41.rawValue,CParser.Tokens.T__42.rawValue,CParser.Tokens.T__43.rawValue,CParser.Tokens.T__44.rawValue,CParser.Tokens.T__45.rawValue,CParser.Tokens.T__46.rawValue,CParser.Tokens.T__47.rawValue,CParser.Tokens.T__48.rawValue,CParser.Tokens.T__49.rawValue,CParser.Tokens.T__50.rawValue,CParser.Tokens.T__51.rawValue,CParser.Tokens.T__52.rawValue,CParser.Tokens.T__53.rawValue,CParser.Tokens.T__54.rawValue,CParser.Tokens.T__55.rawValue,CParser.Tokens.T__56.rawValue,CParser.Tokens.T__57.rawValue,CParser.Tokens.T__58.rawValue,CParser.Tokens.T__59.rawValue,CParser.Tokens.T__60.rawValue,CParser.Tokens.T__61.rawValue,CParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, CParser.Tokens.T__63.rawValue,CParser.Tokens.T__64.rawValue,CParser.Tokens.T__65.rawValue,CParser.Tokens.T__66.rawValue,CParser.Tokens.T__67.rawValue,CParser.Tokens.T__68.rawValue,CParser.Tokens.T__69.rawValue,CParser.Tokens.T__70.rawValue,CParser.Tokens.T__71.rawValue,CParser.Tokens.T__72.rawValue,CParser.Tokens.T__73.rawValue,CParser.Tokens.T__74.rawValue,CParser.Tokens.T__75.rawValue,CParser.Tokens.T__76.rawValue,CParser.Tokens.T__77.rawValue,CParser.Tokens.T__78.rawValue,CParser.Tokens.T__79.rawValue,CParser.Tokens.T__80.rawValue,CParser.Tokens.T__82.rawValue,CParser.Tokens.T__84.rawValue,CParser.Tokens.Identifier.rawValue,CParser.Tokens.Literal.rawValue,CParser.Tokens.Preprocessor.rawValue,CParser.Tokens.Whitespace.rawValue,CParser.Tokens.Newline.rawValue,CParser.Tokens.Comment.rawValue,CParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(167)
		 			try balanced()


		 			setState(172)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(173)
		 		try match(CParser.Tokens.T__81.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(174)
		 		_la = try _input.LA(1)
		 		if (_la <= 0 || (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, CParser.Tokens.T__81.rawValue,CParser.Tokens.T__83.rawValue,CParser.Tokens.T__85.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 82)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = CParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}