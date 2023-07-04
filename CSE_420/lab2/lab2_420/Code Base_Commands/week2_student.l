%option noyywrap

%{

#include<bits/stdc++.h>
using namespace std;

ofstream yyoutlog; // output filestream for log file

string loglist = ""; // list of tokens along with line numbers

// define necessary C++ variables and functions here (if any)
int scope = 1;
int tabCount = 0;// to keep track of line numbers

%}

/* Regular Definitions */

delim [ \v\r]

/* write regular expressions for whitespace and newline */

ws {delim}+
newline \r?\n
tabs \t
letter [a-zA-Z]
digit [0-9]

/* write regular expressions for id, float, and integers, binaries, octals, hexadecimals, scientific notation */

id [a-zA-Z][a-zA-Z0-9_]* 
integers [0-9]+
floats {digit}*(\.{digit}+)
binaries 0b[01]+
octals 0[0-7]+
hexadecimals 0x[0-9a-fA-F]+
floats_scientific {digit}+(\.{digit}+)?([eE][+-]?{digit}+)?

%%

{ws} { /* ignore whitespace */ }

{newline} {
    /* do necessary bookkeeping */
    scope++;
}

{tabs} {
    // Increment a counter for tab characters
    tabCount++;
    
    // Log a message indicating the presence of a tab character
    loglist = "Scope No " + to_string(scope) + ": Tab character found on line " + to_string(scope) + "\n" + "\n";
    yyoutlog << loglist;
}

if {
    loglist = "Scope No " + to_string(scope) + ": Token <IF> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

try {
    loglist = "Scope No " + to_string(scope) + ": Token <TRY> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

and {
    loglist = "Scope No " + to_string(scope) + ": Token <AND> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
  
}

else {
    loglist = "Scope No " + to_string(scope) + ": Token <ELSE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

except {
    loglist = "Scope No " + to_string(scope) + ": Token <EXCEPT> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

or {
    loglist = "Scope No " + to_string(scope) + ": Token <OR> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
   
}

for {
    loglist = "Scope No " + to_string(scope) + ": Token <FOR> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

True {
    loglist = "Scope No " + to_string(scope) + ": Token <TRUE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

print {
    loglist = "Scope No " + to_string(scope) + ": Token <PRINT> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

range {
    loglist = "Scope No " + to_string(scope) + ": Token <RANGE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
   
}

False {
    loglist = "Scope No " + to_string(scope) + ": Token <FALSE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

in {
    loglist = "Scope No " + to_string(scope) + ": Token <IN> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

break {
    loglist = "Scope No " + to_string(scope) + ": Token <BREAK> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
   
}

def {
    loglist = "Scope No " + to_string(scope) + ": Token <DEF> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

continue {
    loglist = "Scope No " + to_string(scope) + ": Token <CONTINUE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

not {
    loglist = "Scope No " + to_string(scope) + ": Token <NOT> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
   
}

return {
    loglist = "Scope No " + to_string(scope) + ": Token <RETURN> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
   
}

pass {
    loglist = "Scope No " + to_string(scope) + ": Token <PASS> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

catch {
    loglist = "Scope No " + to_string(scope) + ": Token <CATCH> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

finally {
    loglist = "Scope No " + to_string(scope) + ": Token <FINALLY> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

None {
    loglist = "Scope No " + to_string(scope) + ": Token <NONE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
   
}

elif {
    loglist = "Scope No " + to_string(scope) + ": Token <ELIF> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

WHILE {
    loglist = "Scope No " + to_string(scope) + ": Token <WHILE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

while {
    loglist = "Scope No " + to_string(scope) + ": Token <WHILE> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}

do {
    loglist = "Scope No " + to_string(scope) + ": Token <DO> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
    
}


{id} {
    loglist = "Scope No " + to_string(scope) + ": Token <ID> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}


"(" {
    loglist = "Scope No " + to_string(scope) + ": Token <LPAREN> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

")" {
    loglist = "Scope No " + to_string(scope) + ": Token <RPAREN> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

":" {
    loglist = "Scope No " + to_string(scope) + ": Token <COLON> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

"+"|"-" {
    loglist = "Scope No " + to_string(scope) + ": Token <ADDOP> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

"++"|"--" {
    loglist = "Scope No " + to_string(scope) + ": Token <INCOP> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}
"&&"|"||" {
    loglist = "Scope No " + to_string(scope) + ": Token <LOGICOP> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}
"!" {
    loglist = "Scope No " + to_string(scope) + ": Token <NOT> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}
"{" {
    loglist = "Scope No " + to_string(scope) + ": Token <LCURL> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

"}" {
    loglist = "Scope No " + to_string(scope) + ": Token <RCURL> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

"[" {
    loglist = "Scope No " + to_string(scope) + ": Token <LTHIRD> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

"]" {
    loglist = "Scope No " + to_string(scope) + ": Token <RTHIRD> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

"," {
    loglist = "Scope No " + to_string(scope) + ": Token <COMMA> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}




">="|">"|"<="|"<" {
    loglist = "Scope No " + to_string(scope) + ": Token <RELOP> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}
"=" {
    loglist = "Scope No " + to_string(scope) + ": Token <ASSIGNOP> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

{integers} {
    loglist = "Scope No " + to_string(scope) + ": Token <CONST_INT> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

{hexadecimals} {
    loglist = "Scope No " + to_string(scope) + ": Token <CONST_HEX> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

{floats} {
    loglist = "Scope No " + to_string(scope) + ": Token <CONST_FLOAT> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

{floats_scientific} {
    loglist = "Scope No " + to_string(scope) + ": Token <CONST_FLOAT_S> Lexeme " + yytext + " found" + "\n";
    yyoutlog << loglist;
}

%%

int main(int argc, char *argv[]) {

    if (argc != 2) // check if file name is given
    {
        cout << "Please input file name" << endl;
        return 0;
    }

    yyin = fopen(argv[1], "r"); // the file to be read must be assigned to yyin

    yyoutlog.open("my_log.txt", ios::trunc); // remember to rename the log file as mentioned in the spec

    if (yyin == NULL) // file does not exist
    {
        // print error message and exit
    }

    yylex(); // start reading the input file in a loop

    // print total number of lines found in the input file

    yyoutlog.close(); // close the log file

    fclose(yyin); // close the input file
}
