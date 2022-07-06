%{
    #include<stdio.h>

    /*KEYWORD*/
    #define PROGRAM     1
    #define VAR         2
    #define INTEGER     3
    #define REAL        4
    #define CHAR        5
    #define BEGINN      6
    #define END         7

    /* OPERATION and DELIMITERS */
    #define COMMA       11
    #define COLON       12
    #define SEMI        13
    #define ASSGIN      14
    #define MUL         15
    #define DIV         16
    #define ADD         17
    #define DEC         18
    #define PT          19  
    #define LB          20
    #define RB          21  

    #define ID          31
    #define NUMBER      32  

%}

delim       [ \t\n]
ws          {delim}+
letter      [a-zA-Z_]
digit       [0-9]
id          {letter}({letter}|{digit})*
number      [+-]?{digit}+(\.{digit}+)?([Ee][+-]?{digit}+)?


%%

{ws}          {;}
program     {printf("%d     PROGRAM     %s\n", PROGRAM, yytext); return PROGRAM;}
var         {printf("%d     VAR         %s\n", VAR, yytext); return VAR;}
integer     {printf("%d     INTEGER     %s\n", INTEGER, yytext); return INTEGER;}
real        {printf("%d     REAL        %s\n", REAL, yytext); return REAL;}
char        {printf("%d     CHAR        %s\n", CHAR, yytext); return CHAR;}
begin       {printf("%d     BEGIN       %s\n", BEGINN, yytext); return BEGINN;}
end         {printf("%d     END         %s\n", END, yytext); return END;}

","         {printf("%d    COMMA       %s\n", COMMA, yytext); return COMMA;}
":"         {printf("%d    COLON       %s\n", COLON, yytext); return COLON;}
";"         {printf("%d    SEMI        %s\n", SEMI, yytext); return SEMI;}
":="        {printf("%d    ASSGIN      %s\n", ASSGIN, yytext); return ASSGIN;}
"*"         {printf("%d    MUL         %s\n", MUL, yytext); return MUL;}
"/"         {printf("%d    DIV         %s\n", DIV, yytext); return DIV;}
"+"         {printf("%d    ADD         %s\n", ADD, yytext); return ADD;}
"-"         {printf("%d    DEC         %s\n", DEC, yytext); return DEC;}
"."         {printf("%d    PT          %s\n", PT, yytext); return PT;}
"("         {printf("%d    LB          %s\n", LB, yytext); return LB;}
")"         {printf("%d    RB          %s\n", RB, yytext); return RB;}

{id}        {printf("%d    ID          %s\n", ID, yytext); return ID;}
{number}    {printf("%d    NUMBER      %s\n", NUMBER, yytext); return NUMBER;}

<<EOF>>     {printf("END OF FILE.\n"); return -1;}

%%
FILE *yyout1, *yyout2, *yyout3;

int yywrap (){
    return 1;
}

void textout(int r){
    switch(r){
        case PROGRAM:       fprintf(yyout, "%d  , %s \n", PROGRAM, yytext);  
                            fprintf(yyout1, "%d  , %s \n", PROGRAM, yytext);  break;

        case VAR:           fprintf(yyout, "%d  , %s \n", VAR, yytext);  
                            fprintf(yyout1, "%d  , %s \n", VAR, yytext); break;

        case INTEGER:       fprintf(yyout, "%d  , %s \n", INTEGER, yytext);  
                            fprintf(yyout1, "%d  , %s \n", INTEGER, yytext); break;

        case REAL:          fprintf(yyout, "%d  , %s \n", REAL, yytext);  
                            fprintf(yyout1, "%d  , %s \n", REAL, yytext); break;

        case CHAR:          fprintf(yyout, "%d  , %s \n", CHAR, yytext); 
                            fprintf(yyout1, "%d  , %s \n", CHAR, yytext); break;

        case BEGINN:        fprintf(yyout, "%d  , %s \n", BEGINN, yytext);  
                            fprintf(yyout1, "%d  , %s \n", BEGINN, yytext); break;

        case END:           fprintf(yyout, "%d  , %s \n", END, yytext);  
                            fprintf(yyout1, "%d  , %s \n", END, yytext); break;


        case COMMA:         fprintf(yyout, "%d , %s \n", COMMA, yytext);  
                            fprintf(yyout1, "%d , %s \n", COMMA, yytext); break;

        case COLON:         fprintf(yyout, "%d , %s \n", COLON, yytext);  
                            fprintf(yyout1, "%d , %s \n", COLON, yytext); break;

        case SEMI:          fprintf(yyout, "%d , %s \n", SEMI, yytext);  
                            fprintf(yyout1, "%d , %s \n", SEMI, yytext);  break;

        case ASSGIN:        fprintf(yyout, "%d , %s \n", ASSGIN, yytext);  
                            fprintf(yyout1, "%d , %s \n", ASSGIN, yytext);  break;

        case MUL:           fprintf(yyout, "%d , %s \n", MUL, yytext);
                            fprintf(yyout1, "%d , %s \n", MUL, yytext);  break;

        case DIV:           fprintf(yyout, "%d , %s \n", DIV, yytext);  
                            fprintf(yyout1, "%d , %s \n", DIV, yytext);  break;

        case ADD:           fprintf(yyout, "%d , %s \n", ADD, yytext); 
                            fprintf(yyout1, "%d , %s \n", ADD, yytext);  break;

        case DEC:           fprintf(yyout, "%d , %s \n", DEC, yytext);
                            fprintf(yyout1, "%d , %s \n", DEC, yytext);  break;

        case PT:            fprintf(yyout, "%d , %s \n", PT, yytext);
                            fprintf(yyout1, "%d , %s \n", PT, yytext);  break;

        case LB:            fprintf(yyout, "%d , %s \n", LB, yytext);
                            fprintf(yyout1, "%d , %s \n", LB, yytext);  break;

        case RB:            fprintf(yyout, "%d , %s \n", RB, yytext); 
                            fprintf(yyout1, "%d , %s \n", RB, yytext);  break;

        case ID:            fprintf(yyout, "%d , %s \n", ID, yytext);
                            fprintf(yyout2, "%s \n", yytext);  break;

        case NUMBER:        fprintf(yyout, "%d , %s \n", NUMBER, yytext);
                            fprintf(yyout3, "%s \n", yytext);  break;

        default: break;
    }
    





    return;
}


int main (int argc, char ** argv){
    
    printf("TOKEN KEYWORD     TOKEN VALUE\n");
    int c;
	if (argc>=2){
	    if ((yyin = fopen(argv[1], "r")) == NULL){
	    printf("Can't open file %s\n", argv[1]);
	    return 1;
        }
        if (argc >= 3){
            yyout = fopen(argv[2], "w");
        }
        if (argc >= 4){
            yyout1 = fopen(argv[3], "w");  //KP table
        }
        if(argc >= 5){
            yyout2 = fopen(argv[4], "w");  //symbol table
        }
        if (argc >= 5){
            yyout3 = fopen(argv[5], "w");  //constant table
        }
	}

	while (1){
        c = yylex();
        textout(c);
        if(c == -1)
            break;
	}

    fprintf(yyout, "0  , #");

	if(argc>=2){
	    fclose(yyin);
	    if (argc>=3) fclose(yyout);
        if (argc>=4) fclose(yyout1);
        if (argc>=5) fclose(yyout2);
        if (argc>=6) fclose(yyout3);
	}
	return 0;

}