%{

#include"symbol_info.h"

#define YYSTYPE symbol_info*

int yyparse(void);
int yylex(void);
void yyerror(char *);
extern FILE *yyin;

ofstream outlog;
int lines;

%}

%token IF ELSE FOR WHILE DO BREAK CONTINUE RETURN INT FLOAT CHAR VOID DOUBLE SWITCH CASE DEFAULT PRINTLN
%token ADDOP MULOP INCOP DECOP RELOP LOGICOP NOT ASSIGNOP LPAREN RPAREN LCURL RCURL LTHIRD RTHIRD SEMICOLON COMMA
%token ID CONST_INT CONST_FLOAT

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%

start : program
{
	outlog << "At line no: " << lines << " start : program " << endl << endl;
}
;

program : program unit
{
	outlog << "At line no: " << lines << " program : program unit " << endl << endl;
	outlog << $1->getname() + "\n" + $2->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + "\n" + $2->getname(), "program");
}
| unit
{

}
;

unit : func_definition
{

}
| var_declaration
{

}
;

func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement
{
	outlog << "At line no: " << lines << " func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement " << endl << endl;
	outlog << $1->getname() + " " + $2->getname() + "()\n" + $5->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + " " + $2->getname() + "()\n" + $5->getname(), "func_def");
}
| type_specifier ID LPAREN RPAREN compound_statement
{
	outlog << "At line no: " << lines << " func_definition : type_specifier ID LPAREN RPAREN compound_statement " << endl << endl;
	outlog << $1->getname() + " " + $2->getname() + "()\n" + $5->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + " " + $2->getname() + "()\n" + $5->getname(), "func_def");
}
;

parameter_list : parameter_list COMMA type_specifier ID
{
	outlog << "At line no: " << lines << " parameter_list : parameter_list COMMA type_specifier ID " << endl << endl;
	outlog << $1->getname() + ", " + $3->getname() + " " + $4->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + ", " + $3->getname() + " " + $4->getname(), "param_list");
}
| parameter_list COMMA type_specifier
{
	outlog << "At line no: " << lines << " parameter_list : parameter_list COMMA type_specifier " << endl << endl;
	outlog << $1->getname() + ", " + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + ", " + $3->getname(), "param_list");
}
| type_specifier ID
{
	outlog << "At line no: " << lines << " parameter_list : type_specifier ID " << endl << endl;
	outlog << $1->getname() + " " + $2->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + " " + $2->getname(), "param_list");
}
| type_specifier
{

}
;

compound_statement : LCURL statements RCURL
{
	outlog << "At line no: " << lines << " compound_statement : LCURL statements RCURL " << endl << endl;
	outlog << "{\n" + $2->getname() + "\n}" << endl << endl;

	$$ = new symbol_info("{\n" + $2->getname() + "\n}", "comp_stmnt");
}
| LCURL RCURL
{
	outlog << "At line no: " << lines << " compound_statement : LCURL RCURL " << endl << endl;
	outlog << "{}" << endl << endl;

	$$ = new symbol_info("{}", "comp_stmnt");
}
| LCURL statements RCURL ELSE compound_statement %prec LOWER_THAN_ELSE
{
	outlog << "At line no: " << lines << " compound_statement : LCURL statements RCURL ELSE compound_statement " << endl << endl;
	outlog << "{\n" + $2->getname() + "\n} else " << "{\n" + $5->getname() + "\n}" << endl << endl;

	$$ = new symbol_info("{\n" + $2->getname() + "\n} else " + "{\n" + $5->getname() + "\n}", "comp_stmnt");
}
;

var_declaration : type_specifier declaration_list SEMICOLON
{
	outlog << "At line no: " << lines << " var_declaration : type_specifier declaration_list SEMICOLON " << endl << endl;
	outlog << $1->getname() + " " + $2->getname() + ";" << endl << endl;

	$$ = new symbol_info($1->getname() + " " + $2->getname() + ";", "var_declaration");
}
;

type_specifier : INT
{
	outlog << "At line no: " << lines << " type_specifier : INT " << endl << endl;
	outlog << "int" << endl << endl;

	$$ = new symbol_info("int", "type_spec");
}
| FLOAT
{
	outlog << "At line no: " << lines << " type_specifier : FLOAT " << endl << endl;
	outlog << "float" << endl << endl;

	$$ = new symbol_info("float", "type_spec");
}
| VOID
{
	outlog << "At line no: " << lines << " type_specifier : VOID " << endl << endl;
	outlog << "void" << endl << endl;

	$$ = new symbol_info("void", "type_spec");
}
;

declaration_list : declaration_list COMMA ID
{
	outlog << "At line no: " << lines << " declaration_list : declaration_list COMMA ID " << endl << endl;
	outlog << $1->getname() + ", " + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + ", " + $3->getname(), "decl_list");
}
| declaration_list COMMA ID LTHIRD CONST_INT RTHIRD
{
	outlog << "At line no: " << lines << " declaration_list : declaration_list COMMA ID LTHIRD CONST_INT RTHIRD " << endl << endl;
	outlog << $1->getname() + ", " + $3->getname() + "[" + $5->getname() + "]" << endl << endl;

	$$ = new symbol_info($1->getname() + ", " + $3->getname() + "[" + $5->getname() + "]", "decl_list");
}
| ID
{
	outlog << "At line no: " << lines << " declaration_list : ID " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "decl_list");
}
| ID LTHIRD CONST_INT RTHIRD
{
	outlog << "At line no: " << lines << " declaration_list : ID LTHIRD CONST_INT RTHIRD " << endl << endl;
	outlog << $1->getname() + "[" + $3->getname() + "]" << endl << endl;

	$$ = new symbol_info($1->getname() + "[" + $3->getname() + "]", "decl_list");
}
;

statements : statement
{

}
| statements statement
{

}
;

statement : var_declaration
{
	outlog << "At line no: " << lines << " statement : var_declaration " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "statement");
}
| expression_statement
{
	outlog << "At line no: " << lines << " statement : expression_statement " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "statement");
}
| compound_statement
{
	outlog << "At line no: " << lines << " statement : compound_statement " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "statement");
}
| FOR LPAREN expression_statement expression_statement expression RPAREN statement
{
	outlog << "At line no: " << lines << " statement : FOR LPAREN expression_statement expression_statement expression RPAREN statement " << endl << endl;
	outlog << "for(" + $3->getname() + $4->getname() + $5->getname() + ")" << endl << $7->getname() << endl << endl;

	$$ = new symbol_info("for(" + $3->getname() + $4->getname() + $5->getname() + ")\n" + $7->getname(), "statement");
}
| IF LPAREN expression RPAREN statement %prec LOWER_THAN_ELSE
{
	outlog << "At line no: " << lines << " statement : IF LPAREN expression RPAREN statement " << endl << endl;
	outlog << "if(" + $3->getname() + ")" << endl << $5->getname() << endl << endl;

	$$ = new symbol_info("if(" + $3->getname() + ")\n" + $5->getname(), "statement");
}
| IF LPAREN expression RPAREN statement ELSE statement
{
	outlog << "At line no: " << lines << " statement : IF LPAREN expression RPAREN statement ELSE statement " << endl << endl;
	outlog << "if(" + $3->getname() + ")" << endl << $5->getname() + "else\n" + $7->getname() << endl << endl;

	$$ = new symbol_info("if(" + $3->getname() + ")\n" + $5->getname() + "else\n" + $7->getname(), "statement");
}
| WHILE LPAREN expression RPAREN statement
{
	outlog << "At line no: " << lines << " statement : WHILE LPAREN expression RPAREN statement " << endl << endl;
	outlog << "while(" + $3->getname() + ")" << endl << $5->getname() << endl << endl;

	$$ = new symbol_info("while(" + $3->getname() + ")\n" + $5->getname(), "statement");
}
| PRINTLN LPAREN ID RPAREN SEMICOLON
{
	outlog << "At line no: " << lines << " statement : PRINTLN LPAREN ID RPAREN SEMICOLON " << endl << endl;
	outlog << "printf(" + $3->getname() + ");" << endl << endl;

	$$ = new symbol_info("printf(" + $3->getname() + ");", "statement");
}
| RETURN expression SEMICOLON
{
	outlog << "At line no: " << lines << " statement : RETURN expression SEMICOLON " << endl << endl;
	outlog << "return " + $2->getname() + ";" << endl << endl;

	$$ = new symbol_info("return " + $2->getname() + ";", "statement");
}
;

expression_statement : SEMICOLON
{
	outlog << "At line no: " << lines << " expression_statement : SEMICOLON " << endl << endl;
	outlog << ";" << endl << endl;

	$$ = new symbol_info(";", "exp_stmnt");
}
| expression SEMICOLON
{
	outlog << "At line no: " << lines << " expression_statement : expression SEMICOLON " << endl << endl;
	outlog << $1->getname() + ";" << endl << endl;

	$$ = new symbol_info($1->getname() + ";", "exp_stmnt");
}
;

expression : logic_expression
{
	$$ = $1;
}
| variable ASSIGNOP logic_expression
{
	outlog << "At line no: " << lines << " expression : variable ASSIGNOP logic_expression " << endl << endl;
	outlog << $1->getname() + "=" + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + "=" + $3->getname(), "expression");
}
;

logic_expression : rel_expression
{
	$$ = $1;
}
| logic_expression LOGICOP rel_expression
{
	outlog << "At line no: " << lines << " logic_expression : logic_expression LOGICOP rel_expression " << endl << endl;
	outlog << $1->getname() + $2->getname() + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname() + $3->getname(), "logic_expression");
}
;

rel_expression : simple_expression
{
	$$ = $1;
}
| simple_expression RELOP simple_expression
{
	outlog << "At line no: " << lines << " rel_expression : simple_expression RELOP simple_expression " << endl << endl;
	outlog << $1->getname() + $2->getname() + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname() + $3->getname(), "rel_expression");
}
;

simple_expression : term
{
	$$ = $1;
}
| simple_expression ADDOP term
{
	outlog << "At line no: " << lines << " simple_expression : simple_expression ADDOP term " << endl << endl;
	outlog << $1->getname() + $2->getname() + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname() + $3->getname(), "simple_expression");
}
;

term : unary_expression
{
	$$ = $1;
}
| term MULOP unary_expression
{
	outlog << "At line no: " << lines << " term : term MULOP unary_expression " << endl << endl;
	outlog << $1->getname() + $2->getname() + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname() + $3->getname(), "term");
}
;

unary_expression : ADDOP unary_expression
{
	outlog << "At line no: " << lines << " unary_expression : ADDOP unary_expression " << endl << endl;
	outlog << $1->getname() + $2->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname(), "unary_expression");
}
| NOT unary_expression
{
	outlog << "At line no: " << lines << " unary_expression : NOT unary_expression " << endl << endl;
	outlog << $1->getname() + $2->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname(), "unary_expression");
}
| factor
{
	$$ = $1;
}
;

factor : variable
{
	$$ = $1;
}
| ID LPAREN argument_list RPAREN
{
	outlog << "At line no: " << lines << " factor : ID LPAREN argument_list RPAREN " << endl << endl;
	outlog << $1->getname() + "(" + $3->getname() + ")" << endl << endl;

	$$ = new symbol_info($1->getname() + "(" + $3->getname() + ")", "factor");
}
| LPAREN expression RPAREN
{
	outlog << "At line no: " << lines << " factor : LPAREN expression RPAREN " << endl << endl;
	outlog << "(" + $2->getname() + ")" << endl << endl;

	$$ = new symbol_info("(" + $2->getname() + ")", "factor");
}
| CONST_INT
{
	outlog << "At line no: " << lines << " factor : CONST_INT " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "factor");
}
| CONST_FLOAT
{
	outlog << "At line no: " << lines << " factor : CONST_FLOAT " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "factor");
}
| variable INCOP
{
	outlog << "At line no: " << lines << " factor : variable INCOP " << endl << endl;
	outlog << $1->getname() + $2->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname(), "factor");
}
| variable DECOP
{
	outlog << "At line no: " << lines << " factor : variable DECOP " << endl << endl;
	outlog << $1->getname() + $2->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + $2->getname(), "factor");
}
;

argument_list : arguments
{
	$$ = $1;
}
|
{

}
;

arguments : arguments COMMA logic_expression
{
	outlog << "At line no: " << lines << " arguments : arguments COMMA logic_expression " << endl << endl;
	outlog << $1->getname() + ", " + $3->getname() << endl << endl;

	$$ = new symbol_info($1->getname() + ", " + $3->getname(), "arguments");
}
| logic_expression
{
	$$ = $1;
}
;
variable : ID
{
	outlog << "At line no: " << lines << " variable : ID " << endl << endl;
	outlog << $1->getname() << endl << endl;

	$$ = new symbol_info($1->getname(), "variable");
}
| ID LTHIRD expression RTHIRD
{
	outlog << "At line no: " << lines << " variable : ID LTHIRD expression RTHIRD " << endl << endl;
	outlog << $1->getname() + "[" + $3->getname() + "]" << endl << endl;

	$$ = new symbol_info($1->getname() + "[" + $3->getname() + "]", "variable");
}
;

%%
void yyerror(char* msg) {
	// Handle the error message, e.g., print it or log it.
	fprintf(stderr, "Parser Error: %s\n", msg);
}


int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		// check if filename given
		return 1;
	}
	yyin = fopen(argv[1], "r");
	outlog.open("my_log.txt", ios::trunc);

	if (yyin == NULL)
	{
		cout << "Couldn't open file" << endl;
		return 1;
	}

	yyparse();

	//print number of lines
	cout << "Parsing completed successfully!" << endl;

	outlog.close();

	fclose(yyin);

	return 0;
}

