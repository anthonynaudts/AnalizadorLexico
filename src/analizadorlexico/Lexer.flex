package analizadorlexico;
import static analizadorlexico.Tokens.*;

%%

%class Lexer
%type Tokens
L=[a-zA-Z_][a-zA-Z0-9_]*
D=[0-9]+
NEGATIVO="-"?{D}
DECIMAL="-"?{D}"."{D}
espacio=[ \t\r\n]+

%{
    public String lexeme;
    public String errorDescripcion;
%}

%%


{L} {lexeme=yytext(); return Identificador;}
{DECIMAL} {lexeme=yytext(); return NumeroDecimal;}
{NEGATIVO} {lexeme=yytext(); return NumeroEntero;}
{D} {lexeme=yytext(); return NumeroEntero;}

[0-9][a-zA-Z0-9_]* { 
    lexeme = yytext();
    errorDescripcion = "Error: un identificador no puede comenzar con un número.";
    return ERROR; 
}

"if" {lexeme=yytext(); return If;}
"else" {lexeme=yytext(); return Else;}
"int" {lexeme=yytext(); return Int;}
"while" {lexeme=yytext(); return While;}

"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"==" {return IgualIgual;}
"<" {return Menor;}
">" {return Mayor;}
"<=" {return MenorIgual;}
">=" {return MayorIgual;}
"!=" {return Distinto;}


"(" {return ParenAbierto;}
")" {return ParenCerrado;}
"{" {return LlaveAbierta;}
"}" {return LlaveCerrada;}
";" {return PuntoYComa;}
"," {return Coma;}


{espacio} {/* Ignore */}
"//".* {/* Ignore */}
"/*"([^*]|\*+[^*/])*\*+"/" {/* Ignore */}



. {
    lexeme = yytext();
    errorDescripcion = "Error: carácter no reconocido: " + lexeme;
    return ERROR;
}
