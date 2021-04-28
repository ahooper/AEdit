// Generated from /Users/andy/Software/Xcode/AEdit/AEdit/Syntax/Grammars/Swift/Swift.antlr4 by ANTLR 4.9.1
import Antlr4

open class SwiftParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = SwiftParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(SwiftParser._ATN.getDecisionState(i)!, i))
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
                 T__62 = 63, T__63 = 64, T__64 = 65, T__65 = 66, Identifier = 67, 
                 Literal = 68, Operator = 69, Whitespace = 70, Newline = 71, 
                 Comment = 72, OTHER = 73
	}

	public
	static let RULE_highlightScan = 0, RULE_keyword = 1, RULE_typename = 2, 
            RULE_operator_ = 3, RULE_identifier = 4, RULE_literal = 5, RULE_comment = 6, 
            RULE_definitionScan = 7, RULE_definition = 8, RULE_defined = 9, 
            RULE_balanced = 10

	public
	static let ruleNames: [String] = [
		"highlightScan", "keyword", "typename", "operator_", "identifier", "literal", 
		"comment", "definitionScan", "definition", "defined", "balanced"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'for'", "'case'", "'while'", "'in'", "'let'", "'var'", "'repeat'", 
		"'if'", "'else'", "'guard'", "'switch'", "'default'", "'where'", "'break'", 
		"'continue'", "'throw'", "'return'", "'defer'", "'do'", "'catch'", "'typealias'", 
		"'struct'", "'class'", "'enum'", "'protocol'", "'import'", "'func'", "'extension'", 
		"'convenience'", "'dynamic'", "'final'", "'infix'", "'lazy'", "'optional'", 
		"'override'", "'postfix'", "'prefix'", "'required'", "'static'", "'unowned'", 
		"'('", "'safe'", "')'", "'unsafe'", "'weak'", "'private'", "'set'", "'fileprivate'", 
		"'internal'", "'public'", "'open'", "'mutating'", "'nonmutating'", "'@IBOutlet'", 
		"'@IBAction'", "';'", "','", "'.'", "':'", "'::'", "'@'", "'...'", "'{'", 
		"'}'", "'['", "']'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "Identifier", "Literal", 
		"Operator", "Whitespace", "Newline", "Comment", "OTHER"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Swift.antlr4" }

	override open
	func getRuleNames() -> [String] { return SwiftParser.ruleNames }

	override open
	func getSerializedATN() -> String { return SwiftParser._serializedATN }

	override open
	func getATN() -> ATN { return SwiftParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return SwiftParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,SwiftParser._ATN,SwiftParser._decisionToDFA, SwiftParser._sharedContextCache)
	}


	public class HighlightScanContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(SwiftParser.Tokens.EOF.rawValue, 0)
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
			func comment() -> [CommentContext] {
				return getRuleContexts(CommentContext.self)
			}
			open
			func comment(_ i: Int) -> CommentContext? {
				return getRuleContext(CommentContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_highlightScan
		}
	}
	@discardableResult
	 open func highlightScan() throws -> HighlightScanContext {
		var _localctx: HighlightScanContext = HighlightScanContext(_ctx, getState())
		try enterRule(_localctx, 0, SwiftParser.RULE_highlightScan)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(30)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__42.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, SwiftParser.Tokens.T__63.rawValue,SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.T__65.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 64)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(28)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,0, _ctx)) {
		 		case 1:
		 			setState(22)
		 			try keyword()

		 			break
		 		case 2:
		 			setState(23)
		 			try typename()

		 			break
		 		case 3:
		 			setState(24)
		 			try identifier()

		 			break
		 		case 4:
		 			setState(25)
		 			try literal()

		 			break
		 		case 5:
		 			setState(26)
		 			try comment()

		 			break
		 		case 6:
		 			setState(27)
		 			try matchWildcard();

		 			break
		 		default: break
		 		}

		 		setState(32)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(33)
		 	try match(SwiftParser.Tokens.EOF.rawValue)

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
			return SwiftParser.RULE_keyword
		}
	}
	@discardableResult
	 open func keyword() throws -> KeywordContext {
		var _localctx: KeywordContext = KeywordContext(_ctx, getState())
		try enterRule(_localctx, 2, SwiftParser.RULE_keyword)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(35)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue]
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
			return SwiftParser.RULE_typename
		}
	}
	@discardableResult
	 open func typename() throws -> TypenameContext {
		var _localctx: TypenameContext = TypenameContext(_ctx, getState())
		try enterRule(_localctx, 4, SwiftParser.RULE_typename)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(87)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,2, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(37)
		 		try match(SwiftParser.Tokens.T__28.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(38)
		 		try match(SwiftParser.Tokens.T__29.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(39)
		 		try match(SwiftParser.Tokens.T__30.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(40)
		 		try match(SwiftParser.Tokens.T__31.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(41)
		 		try match(SwiftParser.Tokens.T__32.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(42)
		 		try match(SwiftParser.Tokens.T__33.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(43)
		 		try match(SwiftParser.Tokens.T__34.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(44)
		 		try match(SwiftParser.Tokens.T__35.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(45)
		 		try match(SwiftParser.Tokens.T__36.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(46)
		 		try match(SwiftParser.Tokens.T__37.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(47)
		 		try match(SwiftParser.Tokens.T__38.rawValue)

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(48)
		 		try match(SwiftParser.Tokens.T__39.rawValue)

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(49)
		 		try match(SwiftParser.Tokens.T__39.rawValue)
		 		setState(50)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(51)
		 		try match(SwiftParser.Tokens.T__41.rawValue)
		 		setState(52)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(53)
		 		try match(SwiftParser.Tokens.T__39.rawValue)
		 		setState(54)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(55)
		 		try match(SwiftParser.Tokens.T__43.rawValue)
		 		setState(56)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 15:
		 		try enterOuterAlt(_localctx, 15)
		 		setState(57)
		 		try match(SwiftParser.Tokens.T__44.rawValue)

		 		break
		 	case 16:
		 		try enterOuterAlt(_localctx, 16)
		 		setState(58)
		 		try match(SwiftParser.Tokens.T__45.rawValue)

		 		break
		 	case 17:
		 		try enterOuterAlt(_localctx, 17)
		 		setState(59)
		 		try match(SwiftParser.Tokens.T__45.rawValue)
		 		setState(60)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(61)
		 		try match(SwiftParser.Tokens.T__46.rawValue)
		 		setState(62)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 18:
		 		try enterOuterAlt(_localctx, 18)
		 		setState(63)
		 		try match(SwiftParser.Tokens.T__47.rawValue)

		 		break
		 	case 19:
		 		try enterOuterAlt(_localctx, 19)
		 		setState(64)
		 		try match(SwiftParser.Tokens.T__47.rawValue)
		 		setState(65)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(66)
		 		try match(SwiftParser.Tokens.T__46.rawValue)
		 		setState(67)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 20:
		 		try enterOuterAlt(_localctx, 20)
		 		setState(68)
		 		try match(SwiftParser.Tokens.T__48.rawValue)

		 		break
		 	case 21:
		 		try enterOuterAlt(_localctx, 21)
		 		setState(69)
		 		try match(SwiftParser.Tokens.T__48.rawValue)
		 		setState(70)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(71)
		 		try match(SwiftParser.Tokens.T__46.rawValue)
		 		setState(72)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 22:
		 		try enterOuterAlt(_localctx, 22)
		 		setState(73)
		 		try match(SwiftParser.Tokens.T__49.rawValue)

		 		break
		 	case 23:
		 		try enterOuterAlt(_localctx, 23)
		 		setState(74)
		 		try match(SwiftParser.Tokens.T__49.rawValue)
		 		setState(75)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(76)
		 		try match(SwiftParser.Tokens.T__46.rawValue)
		 		setState(77)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 24:
		 		try enterOuterAlt(_localctx, 24)
		 		setState(78)
		 		try match(SwiftParser.Tokens.T__50.rawValue)

		 		break
		 	case 25:
		 		try enterOuterAlt(_localctx, 25)
		 		setState(79)
		 		try match(SwiftParser.Tokens.T__50.rawValue)
		 		setState(80)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(81)
		 		try match(SwiftParser.Tokens.T__46.rawValue)
		 		setState(82)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 26:
		 		try enterOuterAlt(_localctx, 26)
		 		setState(83)
		 		try match(SwiftParser.Tokens.T__51.rawValue)

		 		break
		 	case 27:
		 		try enterOuterAlt(_localctx, 27)
		 		setState(84)
		 		try match(SwiftParser.Tokens.T__52.rawValue)

		 		break
		 	case 28:
		 		try enterOuterAlt(_localctx, 28)
		 		setState(85)
		 		try match(SwiftParser.Tokens.T__53.rawValue)

		 		break
		 	case 29:
		 		try enterOuterAlt(_localctx, 29)
		 		setState(86)
		 		try match(SwiftParser.Tokens.T__54.rawValue)

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

	public class Operator_Context: ParserRuleContext {
			open
			func Operator() -> TerminalNode? {
				return getToken(SwiftParser.Tokens.Operator.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_operator_
		}
	}
	@discardableResult
	 open func operator_() throws -> Operator_Context {
		var _localctx: Operator_Context = Operator_Context(_ctx, getState())
		try enterRule(_localctx, 6, SwiftParser.RULE_operator_)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(89)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.Operator.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 56)
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
				return getToken(SwiftParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_identifier
		}
	}
	@discardableResult
	 open func identifier() throws -> IdentifierContext {
		var _localctx: IdentifierContext = IdentifierContext(_ctx, getState())
		try enterRule(_localctx, 8, SwiftParser.RULE_identifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(91)
		 	try match(SwiftParser.Tokens.Identifier.rawValue)

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
				return getToken(SwiftParser.Tokens.Literal.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_literal
		}
	}
	@discardableResult
	 open func literal() throws -> LiteralContext {
		var _localctx: LiteralContext = LiteralContext(_ctx, getState())
		try enterRule(_localctx, 10, SwiftParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(93)
		 	try match(SwiftParser.Tokens.Literal.rawValue)

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
				return getToken(SwiftParser.Tokens.Comment.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_comment
		}
	}
	@discardableResult
	 open func comment() throws -> CommentContext {
		var _localctx: CommentContext = CommentContext(_ctx, getState())
		try enterRule(_localctx, 12, SwiftParser.RULE_comment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(95)
		 	try match(SwiftParser.Tokens.Comment.rawValue)

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
				return getToken(SwiftParser.Tokens.EOF.rawValue, 0)
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
			return SwiftParser.RULE_definitionScan
		}
	}
	@discardableResult
	 open func definitionScan() throws -> DefinitionScanContext {
		var _localctx: DefinitionScanContext = DefinitionScanContext(_ctx, getState())
		try enterRule(_localctx, 14, SwiftParser.RULE_definitionScan)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(101)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 65)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(99)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 		case 1:
		 			setState(97)
		 			try definition()

		 			break
		 		case 2:
		 			setState(98)
		 			try balanced()

		 			break
		 		default: break
		 		}

		 		setState(103)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(104)
		 	try match(SwiftParser.Tokens.EOF.rawValue)

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
			func defined() -> DefinedContext? {
				return getRuleContext(DefinedContext.self, 0)
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
			open
			func Newline() -> TerminalNode? {
				return getToken(SwiftParser.Tokens.Newline.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_definition
		}
	}
	@discardableResult
	 open func definition() throws -> DefinitionContext {
		var _localctx: DefinitionContext = DefinitionContext(_ctx, getState())
		try enterRule(_localctx, 16, SwiftParser.RULE_definition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(198)
		 	try _errHandler.sync(self)
		 	switch (SwiftParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__22:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(106)
		 		try match(SwiftParser.Tokens.T__22.rawValue)
		 		setState(107)
		 		try defined()
		 		setState(114)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SwiftParser.Tokens.T__58.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(108)
		 			try match(SwiftParser.Tokens.T__58.rawValue)
		 			setState(110); 
		 			try _errHandler.sync(self)
		 			_alt = 1;
		 			repeat {
		 				switch (_alt) {
		 				case 1:
		 					setState(109)
		 					try balanced()


		 					break
		 				default:
		 					throw ANTLRException.recognition(e: NoViableAltException(self))
		 				}
		 				setState(112); 
		 				try _errHandler.sync(self)
		 				_alt = try getInterpreter().adaptivePredict(_input,5,_ctx)
		 			} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 		}

		 		setState(116)
		 		try match(SwiftParser.Tokens.T__62.rawValue)
		 		setState(121)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(119)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,7, _ctx)) {
		 			case 1:
		 				setState(117)
		 				try definition()

		 				break
		 			case 2:
		 				setState(118)
		 				try balanced()

		 				break
		 			default: break
		 			}

		 			setState(123)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(124)
		 		try match(SwiftParser.Tokens.T__63.rawValue)

		 		break

		 	case .T__21:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(126)
		 		try match(SwiftParser.Tokens.T__21.rawValue)
		 		setState(127)
		 		try defined()
		 		setState(134)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,10,_ctx)) {
		 		case 1:
		 			setState(128)
		 			try match(SwiftParser.Tokens.T__58.rawValue)
		 			setState(130); 
		 			try _errHandler.sync(self)
		 			_alt = 1;
		 			repeat {
		 				switch (_alt) {
		 				case 1:
		 					setState(129)
		 					try balanced()


		 					break
		 				default:
		 					throw ANTLRException.recognition(e: NoViableAltException(self))
		 				}
		 				setState(132); 
		 				try _errHandler.sync(self)
		 				_alt = try getInterpreter().adaptivePredict(_input,9,_ctx)
		 			} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 			break
		 		default: break
		 		}
		 		setState(136)
		 		try balanced()

		 		break

		 	case .T__23:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(138)
		 		try match(SwiftParser.Tokens.T__23.rawValue)
		 		setState(139)
		 		try defined()
		 		setState(140)
		 		try balanced()

		 		break

		 	case .T__26:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(142)
		 		try match(SwiftParser.Tokens.T__26.rawValue)
		 		setState(143)
		 		try defined()
		 		setState(144)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(148)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(145)
		 			try balanced()


		 			setState(150)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(151)
		 		try match(SwiftParser.Tokens.T__42.rawValue)
		 		setState(153)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SwiftParser.Tokens.Newline.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(152)
		 			try match(SwiftParser.Tokens.Newline.rawValue)

		 		}

		 		setState(155)
		 		try match(SwiftParser.Tokens.T__62.rawValue)
		 		setState(159)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(156)
		 			try balanced()


		 			setState(161)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(162)
		 		try match(SwiftParser.Tokens.T__63.rawValue)

		 		break

		 	case .T__24:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(164)
		 		try match(SwiftParser.Tokens.T__24.rawValue)
		 		setState(165)
		 		try defined()
		 		setState(172)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,15,_ctx)) {
		 		case 1:
		 			setState(166)
		 			try match(SwiftParser.Tokens.T__58.rawValue)
		 			setState(168); 
		 			try _errHandler.sync(self)
		 			_alt = 1;
		 			repeat {
		 				switch (_alt) {
		 				case 1:
		 					setState(167)
		 					try balanced()


		 					break
		 				default:
		 					throw ANTLRException.recognition(e: NoViableAltException(self))
		 				}
		 				setState(170); 
		 				try _errHandler.sync(self)
		 				_alt = try getInterpreter().adaptivePredict(_input,14,_ctx)
		 			} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 			break
		 		default: break
		 		}
		 		setState(174)
		 		try balanced()

		 		break

		 	case .T__27:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(176)
		 		try match(SwiftParser.Tokens.T__27.rawValue)
		 		setState(177)
		 		try defined()
		 		setState(184)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == SwiftParser.Tokens.T__58.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(178)
		 			try match(SwiftParser.Tokens.T__58.rawValue)
		 			setState(180); 
		 			try _errHandler.sync(self)
		 			_alt = 1;
		 			repeat {
		 				switch (_alt) {
		 				case 1:
		 					setState(179)
		 					try balanced()


		 					break
		 				default:
		 					throw ANTLRException.recognition(e: NoViableAltException(self))
		 				}
		 				setState(182); 
		 				try _errHandler.sync(self)
		 				_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
		 			} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 		}

		 		setState(186)
		 		try match(SwiftParser.Tokens.T__62.rawValue)
		 		setState(191)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(189)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,18, _ctx)) {
		 			case 1:
		 				setState(187)
		 				try definition()

		 				break
		 			case 2:
		 				setState(188)
		 				try balanced()

		 				break
		 			default: break
		 			}

		 			setState(193)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(194)
		 		try match(SwiftParser.Tokens.T__63.rawValue)

		 		break

		 	case .T__20:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(196)
		 		try match(SwiftParser.Tokens.T__20.rawValue)
		 		setState(197)
		 		try defined()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
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
				return getToken(SwiftParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return SwiftParser.RULE_defined
		}
	}
	@discardableResult
	 open func defined() throws -> DefinedContext {
		var _localctx: DefinedContext = DefinedContext(_ctx, getState())
		try enterRule(_localctx, 18, SwiftParser.RULE_defined)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(200)
		 	try match(SwiftParser.Tokens.Identifier.rawValue)

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
			return SwiftParser.RULE_balanced
		}
	}
	@discardableResult
	 open func balanced() throws -> BalancedContext {
		var _localctx: BalancedContext = BalancedContext(_ctx, getState())
		try enterRule(_localctx, 20, SwiftParser.RULE_balanced)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(227)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,24, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(202)
		 		try match(SwiftParser.Tokens.T__40.rawValue)
		 		setState(206)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(203)
		 			try balanced()


		 			setState(208)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(209)
		 		try match(SwiftParser.Tokens.T__42.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(210)
		 		try match(SwiftParser.Tokens.T__64.rawValue)
		 		setState(214)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(211)
		 			try balanced()


		 			setState(216)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(217)
		 		try match(SwiftParser.Tokens.T__65.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(218)
		 		try match(SwiftParser.Tokens.T__62.rawValue)
		 		setState(222)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__0.rawValue,SwiftParser.Tokens.T__1.rawValue,SwiftParser.Tokens.T__2.rawValue,SwiftParser.Tokens.T__3.rawValue,SwiftParser.Tokens.T__4.rawValue,SwiftParser.Tokens.T__5.rawValue,SwiftParser.Tokens.T__6.rawValue,SwiftParser.Tokens.T__7.rawValue,SwiftParser.Tokens.T__8.rawValue,SwiftParser.Tokens.T__9.rawValue,SwiftParser.Tokens.T__10.rawValue,SwiftParser.Tokens.T__11.rawValue,SwiftParser.Tokens.T__12.rawValue,SwiftParser.Tokens.T__13.rawValue,SwiftParser.Tokens.T__14.rawValue,SwiftParser.Tokens.T__15.rawValue,SwiftParser.Tokens.T__16.rawValue,SwiftParser.Tokens.T__17.rawValue,SwiftParser.Tokens.T__18.rawValue,SwiftParser.Tokens.T__19.rawValue,SwiftParser.Tokens.T__20.rawValue,SwiftParser.Tokens.T__21.rawValue,SwiftParser.Tokens.T__22.rawValue,SwiftParser.Tokens.T__23.rawValue,SwiftParser.Tokens.T__24.rawValue,SwiftParser.Tokens.T__25.rawValue,SwiftParser.Tokens.T__26.rawValue,SwiftParser.Tokens.T__27.rawValue,SwiftParser.Tokens.T__28.rawValue,SwiftParser.Tokens.T__29.rawValue,SwiftParser.Tokens.T__30.rawValue,SwiftParser.Tokens.T__31.rawValue,SwiftParser.Tokens.T__32.rawValue,SwiftParser.Tokens.T__33.rawValue,SwiftParser.Tokens.T__34.rawValue,SwiftParser.Tokens.T__35.rawValue,SwiftParser.Tokens.T__36.rawValue,SwiftParser.Tokens.T__37.rawValue,SwiftParser.Tokens.T__38.rawValue,SwiftParser.Tokens.T__39.rawValue,SwiftParser.Tokens.T__40.rawValue,SwiftParser.Tokens.T__41.rawValue,SwiftParser.Tokens.T__43.rawValue,SwiftParser.Tokens.T__44.rawValue,SwiftParser.Tokens.T__45.rawValue,SwiftParser.Tokens.T__46.rawValue,SwiftParser.Tokens.T__47.rawValue,SwiftParser.Tokens.T__48.rawValue,SwiftParser.Tokens.T__49.rawValue,SwiftParser.Tokens.T__50.rawValue,SwiftParser.Tokens.T__51.rawValue,SwiftParser.Tokens.T__52.rawValue,SwiftParser.Tokens.T__53.rawValue,SwiftParser.Tokens.T__54.rawValue,SwiftParser.Tokens.T__55.rawValue,SwiftParser.Tokens.T__56.rawValue,SwiftParser.Tokens.T__57.rawValue,SwiftParser.Tokens.T__58.rawValue,SwiftParser.Tokens.T__59.rawValue,SwiftParser.Tokens.T__60.rawValue,SwiftParser.Tokens.T__61.rawValue,SwiftParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, SwiftParser.Tokens.T__64.rawValue,SwiftParser.Tokens.Identifier.rawValue,SwiftParser.Tokens.Literal.rawValue,SwiftParser.Tokens.Operator.rawValue,SwiftParser.Tokens.Whitespace.rawValue,SwiftParser.Tokens.Newline.rawValue,SwiftParser.Tokens.Comment.rawValue,SwiftParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 65)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(219)
		 			try balanced()


		 			setState(224)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(225)
		 		try match(SwiftParser.Tokens.T__63.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(226)
		 		_la = try _input.LA(1)
		 		if (_la <= 0 || (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, SwiftParser.Tokens.T__42.rawValue,SwiftParser.Tokens.T__63.rawValue,SwiftParser.Tokens.T__65.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 43)
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
	static let _serializedATN = SwiftParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}