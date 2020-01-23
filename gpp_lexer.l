%{
    #include "y.tab.h"
    #include <stdlib.h>
    void yyerror(char *);
%}

%%

0|[1-9][0-9]*      {
                yylval.intValue = atoi(yytext);
                return INTEGER;
            }

\n        { return *yytext; }
\+        { return OP_PLUS; }
\(        { return OP_OP;   }
\)        { return OP_CP;   }
\*        { return OP_MULT; }
\/        { return OP_DIV;  }
\'        { return OP_QUO;  }
-         { return OP_MINUS; }
"true"    {yylval.intValue = 1; return BOOLEAN;}
"false"    {yylval.intValue = 0; return BOOLEAN;}
"equal"     { return KW_EQUAL; }
"and"     { return KW_AND; }
"or"     { return KW_OR; }
"not"     { return KW_NOT; }
"defvar"   {return KW_DEFVAR;}
"set"      {return KW_SET;}
"nil"     {return KW_NULL;}
"concat"     {return KW_CONCAT;}
"append"   {return KW_APPEND;}
"deffun"   {return KW_DEFFUN;}
"if"	   {return KW_IF;}
"while"	   {return KW_WHILE;}
"for"      {return KW_FOR;}
"list"     {return KW_LIST;}
"exit"     {return KW_EXIT;}
[a-zA-Z][a-zA-Z0-9]* {yylval.stringValue = strdup(yytext); return IDENTIFIER;}  
[ \t]       ;       /* skip whitespace */
.           {yyerror("Unknown character");}

%%

int yywrap(void) {
    return 1;
}
