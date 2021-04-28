%.interp:	%.antlr4	
	antlr4 -no-listener -Dlanguage=Swift $<

GRAMMARS := ${wildcard */*.antlr4}

all:	$(GRAMMARS:%.antlr4=%.interp)
