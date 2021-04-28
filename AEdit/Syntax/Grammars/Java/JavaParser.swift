// Generated from /Users/andy/Software/Xcode/AEdit/AEdit/Syntax/Grammars/Java/Java.antlr4 by ANTLR 4.9.1
import Antlr4

open class JavaParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = JavaParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(JavaParser._ATN.getDecisionState(i)!, i))
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
                 T__82 = 83, T__83 = 84, T__84 = 85, T__85 = 86, T__86 = 87, 
                 T__87 = 88, T__88 = 89, T__89 = 90, T__90 = 91, T__91 = 92, 
                 T__92 = 93, T__93 = 94, T__94 = 95, T__95 = 96, T__96 = 97, 
                 T__97 = 98, T__98 = 99, Identifier = 100, Literal = 101, 
                 Whitespace = 102, Newline = 103, Comment = 104, OTHER = 105
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
		nil, "'assert'", "'break'", "'case'", "'catch'", "'continue'", "'default'", 
		"'do'", "'else'", "'finally'", "'for'", "'if'", "'goto'", "'instanceof'", 
		"'new'", "'return'", "'super'", "'switch'", "'this'", "'throw'", "'try'", 
		"'while'", "'boolean'", "'byte'", "'char'", "'double'", "'float'", "'int'", 
		"'long'", "'short'", "'void'", "'abstract'", "'class'", "'const'", "'enum'", 
		"'extends'", "'final'", "'implements'", "'import'", "'interface'", "'native'", 
		"'package'", "'private'", "'protected'", "'public'", "'static'", "'strictfp'", 
		"'synchronized'", "'throws'", "'transient'", "'volatile'", "';'", "','", 
		"'.'", "':'", "'='", "'<'", "'!'", "'~'", "'?'", "'=='", "'<='", "'>='", 
		"'!='", "'&&'", "'||'", "'++'", "'--'", "'+'", "'-'", "'*'", "'/'", "'&'", 
		"'|'", "'^'", "'%'", "'+='", "'-='", "'*='", "'/='", "'&='", "'|='", "'^='", 
		"'%='", "'<<='", "'>>='", "'>>>='", "'->'", "'::'", "'@'", "'...'", "'struct'", 
		"'union'", "'('", "')'", "'{'", "'}'", "'typedef'", "'['", "']'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, "Identifier", "Literal", "Whitespace", "Newline", "Comment", 
		"OTHER"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Java.antlr4" }

	override open
	func getRuleNames() -> [String] { return JavaParser.ruleNames }

	override open
	func getSerializedATN() -> String { return JavaParser._serializedATN }

	override open
	func getATN() -> ATN { return JavaParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return JavaParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,JavaParser._ATN,JavaParser._decisionToDFA, JavaParser._sharedContextCache)
	}


	public class HighlightScanContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(JavaParser.Tokens.EOF.rawValue, 0)
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
			return JavaParser.RULE_highlightScan
		}
	}
	@discardableResult
	 open func highlightScan() throws -> HighlightScanContext {
		var _localctx: HighlightScanContext = HighlightScanContext(_ctx, getState())
		try enterRule(_localctx, 0, JavaParser.RULE_highlightScan)
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
		 	   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__93.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__95.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.T__98.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
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
		 	try match(JavaParser.Tokens.EOF.rawValue)

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
			return JavaParser.RULE_keyword
		}
	}
	@discardableResult
	 open func keyword() throws -> KeywordContext {
		var _localctx: KeywordContext = KeywordContext(_ctx, getState())
		try enterRule(_localctx, 2, JavaParser.RULE_keyword)
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
		 	   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue]
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
			return JavaParser.RULE_typename
		}
	}
	@discardableResult
	 open func typename() throws -> TypenameContext {
		var _localctx: TypenameContext = TypenameContext(_ctx, getState())
		try enterRule(_localctx, 4, JavaParser.RULE_typename)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(37)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue]
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
			return JavaParser.RULE_operator_
		}
	}
	@discardableResult
	 open func operator_() throws -> Operator_Context {
		var _localctx: Operator_Context = Operator_Context(_ctx, getState())
		try enterRule(_localctx, 6, JavaParser.RULE_operator_)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(80)
		 	try _errHandler.sync(self)
		 	switch (JavaParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__50:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(39)
		 		try match(JavaParser.Tokens.T__50.rawValue)

		 		break

		 	case .T__51:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(40)
		 		try match(JavaParser.Tokens.T__51.rawValue)

		 		break

		 	case .T__52:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(41)
		 		try match(JavaParser.Tokens.T__52.rawValue)

		 		break

		 	case .T__53:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(42)
		 		try match(JavaParser.Tokens.T__53.rawValue)

		 		break

		 	case .T__54:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(43)
		 		try match(JavaParser.Tokens.T__54.rawValue)

		 		break

		 	case .EOF:
		 		try enterOuterAlt(_localctx, 6)

		 		break

		 	case .T__55:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(45)
		 		try match(JavaParser.Tokens.T__55.rawValue)

		 		break

		 	case .T__56:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(46)
		 		try match(JavaParser.Tokens.T__56.rawValue)

		 		break

		 	case .T__57:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(47)
		 		try match(JavaParser.Tokens.T__57.rawValue)

		 		break

		 	case .T__58:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(48)
		 		try match(JavaParser.Tokens.T__58.rawValue)

		 		break

		 	case .T__59:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(49)
		 		try match(JavaParser.Tokens.T__59.rawValue)

		 		break

		 	case .T__60:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(50)
		 		try match(JavaParser.Tokens.T__60.rawValue)

		 		break

		 	case .T__61:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(51)
		 		try match(JavaParser.Tokens.T__61.rawValue)

		 		break

		 	case .T__62:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(52)
		 		try match(JavaParser.Tokens.T__62.rawValue)

		 		break

		 	case .T__63:
		 		try enterOuterAlt(_localctx, 15)
		 		setState(53)
		 		try match(JavaParser.Tokens.T__63.rawValue)

		 		break

		 	case .T__64:
		 		try enterOuterAlt(_localctx, 16)
		 		setState(54)
		 		try match(JavaParser.Tokens.T__64.rawValue)

		 		break

		 	case .T__65:
		 		try enterOuterAlt(_localctx, 17)
		 		setState(55)
		 		try match(JavaParser.Tokens.T__65.rawValue)

		 		break

		 	case .T__66:
		 		try enterOuterAlt(_localctx, 18)
		 		setState(56)
		 		try match(JavaParser.Tokens.T__66.rawValue)

		 		break

		 	case .T__67:
		 		try enterOuterAlt(_localctx, 19)
		 		setState(57)
		 		try match(JavaParser.Tokens.T__67.rawValue)

		 		break

		 	case .T__68:
		 		try enterOuterAlt(_localctx, 20)
		 		setState(58)
		 		try match(JavaParser.Tokens.T__68.rawValue)

		 		break

		 	case .T__69:
		 		try enterOuterAlt(_localctx, 21)
		 		setState(59)
		 		try match(JavaParser.Tokens.T__69.rawValue)

		 		break

		 	case .T__70:
		 		try enterOuterAlt(_localctx, 22)
		 		setState(60)
		 		try match(JavaParser.Tokens.T__70.rawValue)

		 		break

		 	case .T__71:
		 		try enterOuterAlt(_localctx, 23)
		 		setState(61)
		 		try match(JavaParser.Tokens.T__71.rawValue)

		 		break

		 	case .T__72:
		 		try enterOuterAlt(_localctx, 24)
		 		setState(62)
		 		try match(JavaParser.Tokens.T__72.rawValue)

		 		break

		 	case .T__73:
		 		try enterOuterAlt(_localctx, 25)
		 		setState(63)
		 		try match(JavaParser.Tokens.T__73.rawValue)

		 		break

		 	case .T__74:
		 		try enterOuterAlt(_localctx, 26)
		 		setState(64)
		 		try match(JavaParser.Tokens.T__74.rawValue)

		 		break

		 	case .T__75:
		 		try enterOuterAlt(_localctx, 27)
		 		setState(65)
		 		try match(JavaParser.Tokens.T__75.rawValue)

		 		break

		 	case .T__76:
		 		try enterOuterAlt(_localctx, 28)
		 		setState(66)
		 		try match(JavaParser.Tokens.T__76.rawValue)

		 		break

		 	case .T__77:
		 		try enterOuterAlt(_localctx, 29)
		 		setState(67)
		 		try match(JavaParser.Tokens.T__77.rawValue)

		 		break

		 	case .T__78:
		 		try enterOuterAlt(_localctx, 30)
		 		setState(68)
		 		try match(JavaParser.Tokens.T__78.rawValue)

		 		break

		 	case .T__79:
		 		try enterOuterAlt(_localctx, 31)
		 		setState(69)
		 		try match(JavaParser.Tokens.T__79.rawValue)

		 		break

		 	case .T__80:
		 		try enterOuterAlt(_localctx, 32)
		 		setState(70)
		 		try match(JavaParser.Tokens.T__80.rawValue)

		 		break

		 	case .T__81:
		 		try enterOuterAlt(_localctx, 33)
		 		setState(71)
		 		try match(JavaParser.Tokens.T__81.rawValue)

		 		break

		 	case .T__82:
		 		try enterOuterAlt(_localctx, 34)
		 		setState(72)
		 		try match(JavaParser.Tokens.T__82.rawValue)

		 		break

		 	case .T__83:
		 		try enterOuterAlt(_localctx, 35)
		 		setState(73)
		 		try match(JavaParser.Tokens.T__83.rawValue)

		 		break

		 	case .T__84:
		 		try enterOuterAlt(_localctx, 36)
		 		setState(74)
		 		try match(JavaParser.Tokens.T__84.rawValue)

		 		break

		 	case .T__85:
		 		try enterOuterAlt(_localctx, 37)
		 		setState(75)
		 		try match(JavaParser.Tokens.T__85.rawValue)

		 		break

		 	case .T__86:
		 		try enterOuterAlt(_localctx, 38)
		 		setState(76)
		 		try match(JavaParser.Tokens.T__86.rawValue)

		 		break

		 	case .T__87:
		 		try enterOuterAlt(_localctx, 39)
		 		setState(77)
		 		try match(JavaParser.Tokens.T__87.rawValue)

		 		break

		 	case .T__88:
		 		try enterOuterAlt(_localctx, 40)
		 		setState(78)
		 		try match(JavaParser.Tokens.T__88.rawValue)

		 		break

		 	case .T__89:
		 		try enterOuterAlt(_localctx, 41)
		 		setState(79)
		 		try match(JavaParser.Tokens.T__89.rawValue)

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

	public class IdentifierContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(JavaParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return JavaParser.RULE_identifier
		}
	}
	@discardableResult
	 open func identifier() throws -> IdentifierContext {
		var _localctx: IdentifierContext = IdentifierContext(_ctx, getState())
		try enterRule(_localctx, 8, JavaParser.RULE_identifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(82)
		 	try match(JavaParser.Tokens.Identifier.rawValue)

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
				return getToken(JavaParser.Tokens.Literal.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return JavaParser.RULE_literal
		}
	}
	@discardableResult
	 open func literal() throws -> LiteralContext {
		var _localctx: LiteralContext = LiteralContext(_ctx, getState())
		try enterRule(_localctx, 10, JavaParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(84)
		 	try match(JavaParser.Tokens.Literal.rawValue)

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
				return getToken(JavaParser.Tokens.Comment.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return JavaParser.RULE_comment
		}
	}
	@discardableResult
	 open func comment() throws -> CommentContext {
		var _localctx: CommentContext = CommentContext(_ctx, getState())
		try enterRule(_localctx, 12, JavaParser.RULE_comment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(86)
		 	try match(JavaParser.Tokens.Comment.rawValue)

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
				return getToken(JavaParser.Tokens.EOF.rawValue, 0)
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
			return JavaParser.RULE_definitionScan
		}
	}
	@discardableResult
	 open func definitionScan() throws -> DefinitionScanContext {
		var _localctx: DefinitionScanContext = DefinitionScanContext(_ctx, getState())
		try enterRule(_localctx, 14, JavaParser.RULE_definitionScan)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(92)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      var testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	          testSet = testSet || {  () -> Bool in
		 	             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 	              return  Utils.testBitLeftShiftArray(testArray, 64)
		 	          }()
		 	      return testSet
		 	 }()) {
		 		setState(90)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 		case 1:
		 			setState(88)
		 			try definition()

		 			break
		 		case 2:
		 			setState(89)
		 			try balanced()

		 			break
		 		default: break
		 		}

		 		setState(94)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(95)
		 	try match(JavaParser.Tokens.EOF.rawValue)

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
				return getTokens(JavaParser.Tokens.Newline.rawValue)
			}
			open
			func Newline(_ i:Int) -> TerminalNode? {
				return getToken(JavaParser.Tokens.Newline.rawValue, i)
			}
			open
			func defined() -> DefinedContext? {
				return getRuleContext(DefinedContext.self, 0)
			}
			open
			func Identifier() -> [TerminalNode] {
				return getTokens(JavaParser.Tokens.Identifier.rawValue)
			}
			open
			func Identifier(_ i:Int) -> TerminalNode? {
				return getToken(JavaParser.Tokens.Identifier.rawValue, i)
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
			return JavaParser.RULE_definition
		}
	}
	@discardableResult
	 open func definition() throws -> DefinitionContext {
		var _localctx: DefinitionContext = DefinitionContext(_ctx, getState())
		try enterRule(_localctx, 16, JavaParser.RULE_definition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(160)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,13, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(97)
		 		try match(JavaParser.Tokens.Newline.rawValue)
		 		setState(103); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(103)
		 				try _errHandler.sync(self)
		 				switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 				case 1:
		 					setState(98)
		 					try match(JavaParser.Tokens.Identifier.rawValue)

		 					break
		 				case 2:
		 					setState(99)
		 					try typename()

		 					break
		 				case 3:
		 					setState(100)
		 					try match(JavaParser.Tokens.T__33.rawValue)

		 					break
		 				case 4:
		 					setState(101)
		 					try match(JavaParser.Tokens.T__90.rawValue)

		 					break
		 				case 5:
		 					setState(102)
		 					try match(JavaParser.Tokens.T__91.rawValue)

		 					break
		 				default: break
		 				}

		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(105); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)
		 		setState(110)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == JavaParser.Tokens.T__69.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(107)
		 			try match(JavaParser.Tokens.T__69.rawValue)


		 			setState(112)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(114)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == JavaParser.Tokens.Newline.rawValue
		 		      return testSet
		 		 }()) {
		 			setState(113)
		 			try match(JavaParser.Tokens.Newline.rawValue)

		 		}

		 		setState(116)
		 		try defined()
		 		setState(117)
		 		try match(JavaParser.Tokens.T__92.rawValue)
		 		setState(121)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(118)
		 			try balanced()


		 			setState(123)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(124)
		 		try match(JavaParser.Tokens.T__93.rawValue)
		 		setState(125)
		 		try match(JavaParser.Tokens.T__94.rawValue)
		 		setState(129)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(126)
		 			try balanced()


		 			setState(131)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(132)
		 		try match(JavaParser.Tokens.T__95.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(134)
		 		try match(JavaParser.Tokens.Newline.rawValue)
		 		setState(135)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 34)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(136)
		 		try defined()
		 		setState(137)
		 		try match(JavaParser.Tokens.T__94.rawValue)
		 		setState(141)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(138)
		 			try balanced()


		 			setState(143)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(144)
		 		try match(JavaParser.Tokens.T__95.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(146)
		 		try match(JavaParser.Tokens.Newline.rawValue)
		 		setState(147)
		 		try match(JavaParser.Tokens.T__96.rawValue)
		 		setState(148)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 34)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(149)
		 		try match(JavaParser.Tokens.T__94.rawValue)
		 		setState(153)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(150)
		 			try balanced()


		 			setState(155)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(156)
		 		try match(JavaParser.Tokens.T__95.rawValue)
		 		setState(157)
		 		try defined()
		 		setState(158)
		 		try match(JavaParser.Tokens.T__50.rawValue)

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
				return getToken(JavaParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return JavaParser.RULE_defined
		}
	}
	@discardableResult
	 open func defined() throws -> DefinedContext {
		var _localctx: DefinedContext = DefinedContext(_ctx, getState())
		try enterRule(_localctx, 18, JavaParser.RULE_defined)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(162)
		 	try match(JavaParser.Tokens.Identifier.rawValue)

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
			return JavaParser.RULE_balanced
		}
	}
	@discardableResult
	 open func balanced() throws -> BalancedContext {
		var _localctx: BalancedContext = BalancedContext(_ctx, getState())
		try enterRule(_localctx, 20, JavaParser.RULE_balanced)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(189)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,17, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(164)
		 		try match(JavaParser.Tokens.T__92.rawValue)
		 		setState(168)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(165)
		 			try balanced()


		 			setState(170)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(171)
		 		try match(JavaParser.Tokens.T__93.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(172)
		 		try match(JavaParser.Tokens.T__97.rawValue)
		 		setState(176)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(173)
		 			try balanced()


		 			setState(178)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(179)
		 		try match(JavaParser.Tokens.T__98.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(180)
		 		try match(JavaParser.Tokens.T__94.rawValue)
		 		setState(184)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (//closure
		 		 { () -> Bool in
		 		      var testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__0.rawValue,JavaParser.Tokens.T__1.rawValue,JavaParser.Tokens.T__2.rawValue,JavaParser.Tokens.T__3.rawValue,JavaParser.Tokens.T__4.rawValue,JavaParser.Tokens.T__5.rawValue,JavaParser.Tokens.T__6.rawValue,JavaParser.Tokens.T__7.rawValue,JavaParser.Tokens.T__8.rawValue,JavaParser.Tokens.T__9.rawValue,JavaParser.Tokens.T__10.rawValue,JavaParser.Tokens.T__11.rawValue,JavaParser.Tokens.T__12.rawValue,JavaParser.Tokens.T__13.rawValue,JavaParser.Tokens.T__14.rawValue,JavaParser.Tokens.T__15.rawValue,JavaParser.Tokens.T__16.rawValue,JavaParser.Tokens.T__17.rawValue,JavaParser.Tokens.T__18.rawValue,JavaParser.Tokens.T__19.rawValue,JavaParser.Tokens.T__20.rawValue,JavaParser.Tokens.T__21.rawValue,JavaParser.Tokens.T__22.rawValue,JavaParser.Tokens.T__23.rawValue,JavaParser.Tokens.T__24.rawValue,JavaParser.Tokens.T__25.rawValue,JavaParser.Tokens.T__26.rawValue,JavaParser.Tokens.T__27.rawValue,JavaParser.Tokens.T__28.rawValue,JavaParser.Tokens.T__29.rawValue,JavaParser.Tokens.T__30.rawValue,JavaParser.Tokens.T__31.rawValue,JavaParser.Tokens.T__32.rawValue,JavaParser.Tokens.T__33.rawValue,JavaParser.Tokens.T__34.rawValue,JavaParser.Tokens.T__35.rawValue,JavaParser.Tokens.T__36.rawValue,JavaParser.Tokens.T__37.rawValue,JavaParser.Tokens.T__38.rawValue,JavaParser.Tokens.T__39.rawValue,JavaParser.Tokens.T__40.rawValue,JavaParser.Tokens.T__41.rawValue,JavaParser.Tokens.T__42.rawValue,JavaParser.Tokens.T__43.rawValue,JavaParser.Tokens.T__44.rawValue,JavaParser.Tokens.T__45.rawValue,JavaParser.Tokens.T__46.rawValue,JavaParser.Tokens.T__47.rawValue,JavaParser.Tokens.T__48.rawValue,JavaParser.Tokens.T__49.rawValue,JavaParser.Tokens.T__50.rawValue,JavaParser.Tokens.T__51.rawValue,JavaParser.Tokens.T__52.rawValue,JavaParser.Tokens.T__53.rawValue,JavaParser.Tokens.T__54.rawValue,JavaParser.Tokens.T__55.rawValue,JavaParser.Tokens.T__56.rawValue,JavaParser.Tokens.T__57.rawValue,JavaParser.Tokens.T__58.rawValue,JavaParser.Tokens.T__59.rawValue,JavaParser.Tokens.T__60.rawValue,JavaParser.Tokens.T__61.rawValue,JavaParser.Tokens.T__62.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		          testSet = testSet || {  () -> Bool in
		 		             let testArray: [Int] = [_la, JavaParser.Tokens.T__63.rawValue,JavaParser.Tokens.T__64.rawValue,JavaParser.Tokens.T__65.rawValue,JavaParser.Tokens.T__66.rawValue,JavaParser.Tokens.T__67.rawValue,JavaParser.Tokens.T__68.rawValue,JavaParser.Tokens.T__69.rawValue,JavaParser.Tokens.T__70.rawValue,JavaParser.Tokens.T__71.rawValue,JavaParser.Tokens.T__72.rawValue,JavaParser.Tokens.T__73.rawValue,JavaParser.Tokens.T__74.rawValue,JavaParser.Tokens.T__75.rawValue,JavaParser.Tokens.T__76.rawValue,JavaParser.Tokens.T__77.rawValue,JavaParser.Tokens.T__78.rawValue,JavaParser.Tokens.T__79.rawValue,JavaParser.Tokens.T__80.rawValue,JavaParser.Tokens.T__81.rawValue,JavaParser.Tokens.T__82.rawValue,JavaParser.Tokens.T__83.rawValue,JavaParser.Tokens.T__84.rawValue,JavaParser.Tokens.T__85.rawValue,JavaParser.Tokens.T__86.rawValue,JavaParser.Tokens.T__87.rawValue,JavaParser.Tokens.T__88.rawValue,JavaParser.Tokens.T__89.rawValue,JavaParser.Tokens.T__90.rawValue,JavaParser.Tokens.T__91.rawValue,JavaParser.Tokens.T__92.rawValue,JavaParser.Tokens.T__94.rawValue,JavaParser.Tokens.T__96.rawValue,JavaParser.Tokens.T__97.rawValue,JavaParser.Tokens.Identifier.rawValue,JavaParser.Tokens.Literal.rawValue,JavaParser.Tokens.Whitespace.rawValue,JavaParser.Tokens.Newline.rawValue,JavaParser.Tokens.Comment.rawValue,JavaParser.Tokens.OTHER.rawValue]
		 		              return  Utils.testBitLeftShiftArray(testArray, 64)
		 		          }()
		 		      return testSet
		 		 }()) {
		 			setState(181)
		 			try balanced()


		 			setState(186)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(187)
		 		try match(JavaParser.Tokens.T__95.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(188)
		 		_la = try _input.LA(1)
		 		if (_la <= 0 || (//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, JavaParser.Tokens.T__93.rawValue,JavaParser.Tokens.T__95.rawValue,JavaParser.Tokens.T__98.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 94)
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
	static let _serializedATN = JavaParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}