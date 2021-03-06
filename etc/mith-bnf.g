<START>        ::= <prog>
<prog>         ::= {{<classDecl>}} {{<funcDef>}} 'main' <funcBody>
<classDecl>    ::= 'class' 'id' [['inherits' 'id' {{',' 'id'}}]] '{' {{<visibility> <memberDecl>}} '}' ';'
<visibility>   ::= 'public' | 'private'
<memberDecl>   ::= <funcDecl> | <varDecl>  
<funcDecl>     ::= 'id' '(' <fParams> ')' ':' <type> ';' | 'id' '(' <fParams> ')' ':' 'void' ';' 
<funcHead>     ::= [['id' 'sr']] 'id' '(' <fParams> ')' ':' <type> | [['id' 'sr']] 'id' '(' <fParams> ')' ':' 'void'
<funcDef>      ::= <funcHead> <funcBody>
<funcBody>     ::= [[ 'local' {{<varDecl>}} ]] 'do' {{<statement>}} 'end'
<varDecl>      ::= <type> 'id' {{<arraySize>}} ';'
<statement>    ::= <assignStat> ';'
              | 'if'     '(' <relExpr> ')' 'then' <statBlock> 'else' <statBlock> ';'
              | 'while'  '(' <relExpr> ')' <statBlock> ';'
              | 'read'   '(' <variable> ')' ';'
              | 'write'  '(' <expr> ')' ';'
              | 'return' '(' <expr> ')' ';'
              | <functionCall> ';'
<assignStat>   ::= <variable> <assignOp> <expr>
<statBlock>    ::= 'do' {{<statement>}} 'end' | <statement> | EPSILON  
<expr>         ::= <arithExpr> | <relExpr>
<relExpr>      ::= <arithExpr> <relOp> <arithExpr>
<arithExpr>    ::= <arithExpr> <addOp> <term> | <term> 
<sign>         ::= '+' | '-'
<term>         ::= <term> <multOp> <factor> | <factor>
<factor>       ::= <variable>
              | <functionCall>
              | 'intNum' | 'floatNum'
              | '(' <arithExpr> ')'
              | 'not' <factor>
              | <sign> <factor>
<variable>     ::= {{<idnest>}} 'id' {{<indice>}}
<functionCall> ::= {{<idnest>}} 'id' '(' <aParams> ')'
<idnest>       ::= 'id' {{<indice>}} '.'
              | 'id' '(' <aParams> ')' '.'
<indice>       ::= '[' <arithExpr> ']'
<arraySize>    ::= '[' 'intNum' ']'  
<type>         ::= 'integer' | 'float' | 'id'
<fParams>      ::= <type> 'id' {{[]}} {{<fParamsTail>}} | EPSILON  
<aParams>      ::= <expr> {{<aParamsTail>}} | EPSILON 
<fParamsTail>  ::= ',' <type> 'id' {{[]}}
<aParamsTail>  ::= ',' <expr>
<assignOp>     ::= '='
<relOp>        ::= 'eq' | 'neq' | 'lt' | 'gt' | 'leq' | 'geq' 
<addOp>        ::= '+' | '-' | 'or' 
<multOp>       ::= '*' | '/' | 'and'