import Antlr4
let file = "/Users/andy/example.c"
let input = try ANTLRFileStream(file)
let lexer = CLexer(input)


    class ScanListener: ParseTreeListener {
        let parser: Parser
        let vocabulary: Vocabulary
        init(_ parser:Parser) {
            self.parser = parser
            self.vocabulary = parser.getVocabulary()
        }
        func visitTerminal(_ node: TerminalNode) {
            let token = node.getSymbol()!
            let tokenType: Int = token.getType()
            let display: String = vocabulary.getSymbolicName(tokenType) ?? vocabulary.getLiteralName(tokenType) ?? vocabulary.getDisplayName(tokenType) //  "unknown"
            //print("Terminal", display, token, parser.getState(), parser.getExpectedTokensWithinCurrentRule())
            let atn = parser.getInterpreter().atn
            let pstate = parser.getState()
            let states = atn.states[pstate]!
        }
        
        func visitErrorNode(_ node: ErrorNode) {
            let token = node.getSymbol()!
            let tokenType: Int = token.getType()
            let display: String = vocabulary.getSymbolicName(tokenType) ?? vocabulary.getLiteralName(tokenType) ?? vocabulary.getDisplayName(tokenType) //  "unknown"
            print("Error", display, token.getText(), parser.getState(), parser.getExpectedTokensWithinCurrentRule())
        }
        
        func enterEveryRule(_ ctx: ParserRuleContext) throws {
            // TODO not called by ParseInterpreter - is that an ANTLR bug?
            //print("Enter", ctx.toInfoString(parser))
        }
        
        func exitEveryRule(_ ctx: ParserRuleContext) throws {
            let ruleNames = parser.getRuleNames()
            let ruleIndex = ctx.getRuleIndex()
            if ruleNames[ruleIndex] == "defined" {
                if let start: Token = ctx.getStart(),
                   let stream = start.getInputStream(),
                   let stopIndex: Int = ctx.getStop()?.getStopIndex() {
                    let text: String? = try? stream.getText(Interval.of(start.getStartIndex(), stopIndex))
                    print("Exit", ruleNames[ruleIndex], (text) ?? ctx.getText())
                } else {
                    print("Exit", ctx.toInfoString(parser), ctx.getText())
                }
            } else {
                //print("Exit", ctx.toInfoString(parser))
            }
        }
    }

let parser = try CParser(CommonTokenStream(lexer))
//parser.setTrace(true)
parser.addParseListener(ScanListener(parser))
let context = try parser.definitionScan()
//print(context.toStringTree(parser))

let lexerData = try! InterpreterDataReader("/Users/andy/Software/Xcode/AEdit/AEdit/Syntax/Grammars/C/CLexer.interp")
let parserData = try! InterpreterDataReader("/Users/andy/Software/Xcode/AEdit/AEdit/Syntax/Grammars/C/C.interp")
input.reset()
let lexInt = try! lexerData.createLexer(input:input)
let parseInt = try! parserData.createParser(input:CommonTokenStream(lexInt))
parseInt.addParseListener(ScanListener(parseInt))
let ruleIndex = parseInt.getRuleIndex("definitionScan")
_ = try! parseInt.parse(ruleIndex)

