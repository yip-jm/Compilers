%{
    #include<stdio.h>
    /*definitions of manifest constants*/
    /* KEYWORD */
    #define ID          0
    #define cT          1
    #define sT          2
    #define NUMBER      3

    #define MAIN        4
    #define VOID        5
    #define CHAR        6
    #define INT         7
    #define FLOAT       8
    #define DOUBLE      9

    #define SHORT       10
    #define LONG        11
    #define UNSG        12
    #define SG          13

    #define STRUCT      14
    #define UNION       15
    #define ENUM        16
    #define TYPEDEF     17
    #define SIZEOF      18

    #define AUTO        19
    #define STATIC      20
    #define REGISTER    21
    #define EXTERN      22
    #define VOLATILE    23
    #define CONST       24

    #define CONTINUE    25
    #define BREAK       26
    #define GOTO        27
    #define RETURN      28

    #define IF          29
    #define ELSE        30
    #define SWITCH      31
    #define CASE        32
    #define DEFAULT     33 

    #define WHILE       34
    #define DO          35
    #define FOR         36

    /* OPERATION and DELIMITERS */
    #define ADD         37 
    #define DEC         38
    #define MUL         39
    #define DIV         40
    #define MOD         41
    #define INCR        42
    #define DECR        43

    #define EQ          44
    #define NEQ         45
    #define GT          46
    #define LT          47
    #define GE          48
    #define LE          49

    #define LOG_AND     50
    #define LOG_OR      51
    #define LOG_NOT     52 

    #define ASM         53
    #define ADD_ASM     54
    #define DEC_ASM     55
    #define MUL_ASM     56
    #define DIV_ASM     57
    #define MOD_ASM     58
    #define LSF_ASM     59
    #define RSF_ASM     60
    #define BN_AND_ASM  61
    #define BN_OR_ASM   62
    #define BN_XOR_ASM  63

    #define BN_AND      64
    #define BN_OR       65
    #define BN_XOR      66
    #define BN_REVS     67
    #define LSF         68
    #define RSF         69
    #define QM          70

    #define LP          71
    #define RP          72
    #define LBK         73
    #define RBK         74
    #define LBC         75
    #define RBC         76

    #define COMMA       77
    #define SMI         78
    #define COLON       79
    #define SQU         80
    #define DQU         81

    /* OTHER */
    #define PT          82
    #define SCF         83

    #define INT_BIN     84
    #define INT_HEX     85

    #define PNT         86
    #define ARROW       87

    #define COMMENT     96
    #define DF          97
    #define IFILE       98
    #define ERR         99

%}

delim       [ \t\n]
ws          {delim}+
letter      [a-zA-Z_]
digit       [0-9]
id          {letter}({letter}|{digit})*
number      [+-]?{digit}+(\.{digit}+)?([Ee][+-]?{digit}+)?
ifile       (#include)(.)*
df          (#define)(.)*
cT          \'(.)\'
sT          \"(.)*\"
comment     ("//".*)|("/*"([*]*(([^*/])+([/])*)*)*"*/")


int_bin     0[bB][01]+
int_hex     0[xX]([A-Fa-f0-9])+



%%
{ws}        {;}
main        {printf("%d     MAIN      %s\n", MAIN, yytext); return MAIN;}
void        {printf("%d     VOID      %s\n", VOID, yytext); return VOID;}
char        {printf("%d     CHAR      %s\n", CHAR, yytext); return CHAR;}
int         {printf("%d     INT       %s\n", INT, yytext); return INT;}
float       {printf("%d     FLOAT     %s\n", FLOAT, yytext); return FLOAT;}
double      {printf("%d     DOUBLE    %s\n", DOUBLE, yytext); return DOUBLE;}

short       {printf("%d    SHORT     %s\n", SHORT, yytext); return SHORT;}
long        {printf("%d    LONG      %s\n", LONG, yytext); return LONG;}
unsigned    {printf("%d    UNSIGNED  %s\n", UNSG, yytext); return UNSG;} 
signed      {printf("%d    SIGNED    %s\n", SG, yytext); return SG;}

struct      {printf("%d    STRUCT    %s\n", STRUCT, yytext); return STRUCT;}
union       {printf("%d    UNION     %s\n", UNION, yytext); return UNION;}
enum        {printf("%d    ENUM      %s\n", ENUM, yytext); return ENUM;}
typedef     {printf("%d    TYPEDEF   %s\n", TYPEDEF, yytext); return TYPEDEF;}
sizeof      {printf("%d    SIZEOF    %s\n", SIZEOF, yytext); return SIZEOF;}

auto        {printf("%d    AUTO      %s\n", AUTO, yytext); return AUTO;}
static      {printf("%d    STATIC    %s\n", STATIC, yytext); return STATIC;}
register    {printf("%d    REGISTER  %s\n", REGISTER, yytext); return REGISTER;}
extern      {printf("%d    EXTERN    %s\n", EXTERN, yytext); return EXTERN;}
volatile    {printf("%d    VOLATILE  %s\n", VOLATILE, yytext); return VOLATILE;}
const       {printf("%d    CONST     %s\n", CONST, yytext); return CONST;}

continue    {printf("%d    CONTINUE  %s\n", CONTINUE, yytext); return CONTINUE;}
break       {printf("%d    BREAK     %s\n", BREAK, yytext); return BREAK;}
goto        {printf("%d    GOTO      %s\n", GOTO, yytext); return GOTO;}
return      {printf("%d    RETURN    %s\n", RETURN, yytext); return RETURN;}

if          {printf("%d    IF        %s\n", IF, yytext); return IF;}
else        {printf("%d    ELSE      %s\n", ELSE, yytext); return ELSE;}
switch      {printf("%d    SWITCH    %s\n", SWITCH, yytext); return SWITCH;}
case        {printf("%d    CASE      %s\n", CASE, yytext); return CASE;}
default     {printf("%d    DEFAULT   %s\n", DEFAULT, yytext); return DEFAULT;}

while       {printf("%d    WHILE     %s\n", WHILE, yytext); return WHILE;}
do          {printf("%d    DO        %s\n", DO, yytext); return DO;}
for         {printf("%d    FOR       %s\n", FOR, yytext); return FOR;}


"+"         {printf("%d    +         %s\n", ADD, yytext); return ADD;}
"-"         {printf("%d    -         %s\n", DEC, yytext); return DEC;}
"*"         {printf("%d    *         %s\n", MUL, yytext); return MUL;}
"/"         {printf("%d    /         %s\n", DIV, yytext); return DIV;}
"%"         {printf("%d    %%         %s\n", MOD, yytext); return MOD;}
"++"        {printf("%d    ++        %s\n", INCR, yytext); return INCR;}
"--"        {printf("%d    --        %s\n", DECR, yytext); return DECR;}

"=="        {printf("%d    ==        %s\n", EQ, yytext); return EQ;}
"!="        {printf("%d    !=        %s\n", NEQ, yytext); return NEQ;}
">"         {printf("%d    >         %s\n", GT, yytext); return GT;}
"<"         {printf("%d    <         %s\n", LT, yytext); return LT;}
">="        {printf("%d    >=        %s\n", GE, yytext); return GE;}
"<="        {printf("%d    <=        %s\n", LE, yytext); return LE;}

"&&"        {printf("%d    &&        %s\n", LOG_AND, yytext); return LOG_AND;}
"||"        {printf("%d    ||        %s\n", LOG_OR, yytext); return LOG_OR;}
"!"         {printf("%d    !         %s\n", LOG_NOT, yytext); return LOG_NOT;}

"="         {printf("%d    =         %s\n", ASM, yytext); return ASM;}
"+="        {printf("%d    +=        %s\n", ADD_ASM, yytext); return ADD_ASM;}
"-="        {printf("%d    -=        %s\n", DEC_ASM, yytext); return DEC_ASM;}
"*="        {printf("%d    *=        %s\n", MUL_ASM, yytext); return MUL_ASM;}
"/="        {printf("%d    /=        %s\n", DIV_ASM, yytext); return DIV_ASM;}
"%%="       {printf("%d    %%=        %s\n", MOD_ASM, yytext); return MOD_ASM;}
"<<="       {printf("%d    <<=       %s\n", LSF_ASM, yytext); return LSF_ASM;}
">>="       {printf("%d    >>=       %s\n", RSF_ASM, yytext); return RSF_ASM;}
"&="        {printf("%d    &=        %s\n", BN_AND_ASM, yytext); return BN_AND_ASM;}
"|="        {printf("%d    |=        %s\n", BN_OR_ASM, yytext); return BN_OR_ASM;}
"^="        {printf("%d    ^=        %s\n", BN_XOR_ASM, yytext); return BN_XOR_ASM;}

"&"         {printf("%d    &         %s\n", BN_AND, yytext); return BN_AND;}
"|"         {printf("%d    |         %s\n", BN_OR, yytext); return BN_OR;}
"^"         {printf("%d    ^         %s\n", BN_XOR, yytext); return BN_XOR;}
"~"         {printf("%d    ~         %s\n", BN_REVS, yytext); return BN_REVS;}
"<<"        {printf("%d    <<        %s\n", LSF, yytext); return LSF;}
">>"        {printf("%d    >>        %s\n", RSF, yytext); return RSF;}
"?"         {printf("%d    ?         %s\n", QM, yytext); return QM;}

"("         {printf("%d    (         %s\n", LP, yytext); return LP;}
")"         {printf("%d    )         %s\n", RP, yytext); return RP;}
"["         {printf("%d    [         %s\n", LBK, yytext); return LBK;}
"]"         {printf("%d    ]         %s\n", RBK, yytext); return RBK;}
"{"         {printf("%d    {         %s\n", LBC, yytext); return LBC;}
"}"         {printf("%d    }         %s\n", RBC, yytext); return RBC;}

","         {printf("%d    ,         %s\n", COMMA, yytext); return COMMA;}
";"         {printf("%d    ;         %s\n", SMI, yytext); return SMI;}
":"         {printf("%d    :         %s\n", COLON, yytext); return COLON;}
"'"         {printf("%d    '         %s\n", SQU, yytext); return SQU;}
"\""        {printf("%d    \"         %s\n", DQU, yytext); return DQU;}

"->"        {printf("%d    ->        %s\n", ARROW, yytext); return ARROW;}
"."         {printf("%d    .         %s\n", PNT, yytext); return PNT;}

printf      {printf("%d    PRINTF    %s\n", PT, yytext); return PT;}
scanf       {printf("%d    SCANF     %s\n", SCF, yytext); return SCF;}

{id}        {printf("%d     ID        %s\n", ID, yytext); return ID;}
{cT}        {printf("%d     cT        %s\n", cT, yytext); return cT;}
{sT}        {printf("%d     sT        %s\n", sT, yytext); return sT;}
{number}    {printf("%d     NUMBER    %s\n", NUMBER, yytext); return NUMBER;}

{int_bin}   {printf("%d    INT_BIN   %s\n", INT_BIN, yytext); return INT_BIN;}
{int_hex}   {printf("%d    INT_HEX   %s\n", INT_HEX, yytext); return INT_HEX;}

{comment}   {printf("%d    COMMENT   %s\n", COMMENT, yytext); return COMMENT;}
{df}        {printf("%d    DF        %s\n", DF, yytext); return DF;}
{ifile}     {printf("%d    FILE      %s\n", IFILE, yytext); return IFILE;}

.           {printf("%d    ERR       %s\n", ERR, yytext); return ERR;}

<<EOF>>     {printf("END OF FILE.\n"); return -1;}

%%


int yywrap (){
    return 1;
}

void textout(int r){
    switch(r){
        case ID:        fprintf(yyout,"< %d  , %s >\n", ID, yytext);  break;
        case cT:        fprintf(yyout,"< %d  , %s >\n", cT, yytext);  break;
        case sT:        fprintf(yyout,"< %d  , %s >\n", sT, yytext);  break;
        case NUMBER:    fprintf(yyout,"< %d  , %s >\n", NUMBER, yytext);  break;

        case MAIN:      fprintf(yyout,"< %d  , %s >\n", MAIN, yytext);  break;
        case VOID:      fprintf(yyout,"< %d  , %s >\n", VOID, yytext);  break;
        case CHAR:      fprintf(yyout,"< %d  , %s >\n", CHAR, yytext);  break;
        case INT:       fprintf(yyout,"< %d  , %s >\n", INT, yytext);  break;
        case FLOAT:     fprintf(yyout,"< %d  , %s >\n", FLOAT, yytext);  break;
        case DOUBLE:    fprintf(yyout,"< %d  , %s >\n", DOUBLE, yytext);  break;
        
        case SHORT:     fprintf(yyout,"< %d , %s >\n", SHORT, yytext);  break;
        case LONG:      fprintf(yyout,"< %d , %s >\n", LONG, yytext);  break;
        case UNSG:      fprintf(yyout,"< %d , %s >\n", UNSG, yytext);  break;
        case SG:        fprintf(yyout,"< %d , %s >\n", SG, yytext);  break;
        
        case STRUCT:    fprintf(yyout,"< %d , %s >\n", STRUCT, yytext);  break;
        case UNION:     fprintf(yyout,"< %d , %s >\n", UNION, yytext);  break;
        case ENUM:      fprintf(yyout,"< %d , %s >\n", ENUM, yytext);  break;
        case TYPEDEF:   fprintf(yyout,"< %d , %s >\n", TYPEDEF, yytext);  break;
        case SIZEOF:    fprintf(yyout,"< %d , %s >\n", SIZEOF, yytext);  break;

        case AUTO:      fprintf(yyout,"< %d , %s >\n", AUTO, yytext);  break;
        case STATIC:    fprintf(yyout,"< %d , %s >\n", STATIC, yytext);  break;
        case REGISTER:  fprintf(yyout,"< %d , %s >\n", REGISTER, yytext);  break;
        case EXTERN:    fprintf(yyout,"< %d , %s >\n", EXTERN, yytext);  break;
        case VOLATILE:  fprintf(yyout,"< %d , %s >\n", VOLATILE, yytext);  break;
        case CONST:     fprintf(yyout,"< %d , %s >\n", CONST, yytext);  break;

        case CONTINUE:  fprintf(yyout,"< %d , %s >\n", CONTINUE, yytext);  break;
        case BREAK:     fprintf(yyout,"< %d , %s >\n", BREAK, yytext);  break;
        case GOTO:      fprintf(yyout,"< %d , %s >\n", GOTO, yytext);  break;
        case RETURN:    fprintf(yyout,"< %d , %s >\n", RETURN, yytext);  break;

        case IF:        fprintf(yyout,"< %d , %s >\n", IF, yytext);  break;
        case ELSE:      fprintf(yyout,"< %d , %s >\n", ELSE, yytext);  break;
        case SWITCH:    fprintf(yyout,"< %d , %s >\n", SWITCH, yytext);  break;
        case CASE:      fprintf(yyout,"< %d , %s >\n", CASE, yytext);  break;
        case DEFAULT:   fprintf(yyout,"< %d , %s >\n", DEFAULT, yytext);  break;

        case WHILE:     fprintf(yyout,"< %d , %s >\n", WHILE, yytext);  break;
        case DO:        fprintf(yyout,"< %d , %s >\n", DO, yytext);  break;
        case FOR:       fprintf(yyout,"< %d , %s >\n", FOR, yytext);  break;

        case ADD:       fprintf(yyout,"< %d , %s >\n", ADD, yytext);  break;
        case DEC:       fprintf(yyout,"< %d , %s >\n", DEC, yytext);  break;
        case MUL:       fprintf(yyout,"< %d , %s >\n", MUL, yytext);  break;
        case DIV:       fprintf(yyout,"< %d , %s >\n", DIV, yytext);  break;
        case MOD:       fprintf(yyout,"< %d , %s >\n", MOD, yytext);  break;
        case INCR:      fprintf(yyout,"< %d , %s >\n", INCR, yytext);  break;
        case DECR:      fprintf(yyout,"< %d , %s >\n", DECR, yytext);  break;

        case EQ:        fprintf(yyout,"< %d , %s >\n", EQ, yytext);  break;
        case NEQ:       fprintf(yyout,"< %d , %s >\n", NEQ, yytext);  break;
        case GT:        fprintf(yyout,"< %d , %s >\n", GT, yytext);  break;
        case LT:        fprintf(yyout,"< %d , %s >\n", LT, yytext);  break;
        case GE:        fprintf(yyout,"< %d , %s >\n", GE, yytext);  break;
        case LE:        fprintf(yyout,"< %d , %s >\n", LE, yytext);  break;

        case LOG_AND:   fprintf(yyout,"< %d , %s >\n", LOG_AND, yytext);  break;
        case LOG_OR:    fprintf(yyout,"< %d , %s >\n", LOG_OR, yytext);  break;
        case LOG_NOT:   fprintf(yyout,"< %d , %s >\n", LOG_NOT, yytext);  break;

        case ASM:       fprintf(yyout,"< %d , %s >\n", ASM, yytext);  break;
        case ADD_ASM:   fprintf(yyout,"< %d , %s >\n", ADD_ASM, yytext);  break;
        case DEC_ASM:   fprintf(yyout,"< %d , %s >\n", DEC_ASM, yytext);  break;
        case MUL_ASM:   fprintf(yyout,"< %d , %s >\n", MUL_ASM, yytext);  break;
        case DIV_ASM:   fprintf(yyout,"< %d , %s >\n", DIV_ASM, yytext);  break;
        case MOD_ASM:   fprintf(yyout,"< %d , %s >\n", MOD_ASM, yytext);  break;
        case LSF_ASM:   fprintf(yyout,"< %d , %s >\n", LSF_ASM, yytext);  break;
        case RSF_ASM:   fprintf(yyout,"< %d , %s >\n", RSF_ASM, yytext);  break;
        case BN_AND_ASM:fprintf(yyout,"< %d , %s >\n", BN_AND_ASM, yytext);  break;
        case BN_OR_ASM: fprintf(yyout,"< %d , %s >\n", BN_OR_ASM, yytext);  break;
        case BN_XOR_ASM:fprintf(yyout,"< %d , %s >\n", BN_XOR_ASM, yytext);  break;
        
        case BN_AND:    fprintf(yyout,"< %d , %s >\n", BN_AND, yytext);  break;
        case BN_OR:     fprintf(yyout,"< %d , %s >\n", BN_OR, yytext);  break;
        case BN_XOR:    fprintf(yyout,"< %d , %s >\n", BN_XOR, yytext);  break;
        case BN_REVS:   fprintf(yyout,"< %d , %s >\n", BN_REVS, yytext);  break;
        case LSF:       fprintf(yyout,"< %d , %s >\n", LSF, yytext);  break;
        case RSF:       fprintf(yyout,"< %d , %s >\n", RSF, yytext);  break;
        case QM:        fprintf(yyout,"< %d , %s >\n", QM, yytext);  break;

        case LP:        fprintf(yyout,"< %d , %s >\n", LP, yytext);  break;
        case RP:        fprintf(yyout,"< %d , %s >\n", RP, yytext);  break;
        case LBK:       fprintf(yyout,"< %d , %s >\n", LBK, yytext);  break;
        case RBK:       fprintf(yyout,"< %d , %s >\n", RBK, yytext);  break;
        case LBC:       fprintf(yyout,"< %d , %s >\n", LBC, yytext);  break;
        case RBC:       fprintf(yyout,"< %d , %s >\n", RBC, yytext);  break;

        case COMMA:     fprintf(yyout,"< %d , %s >\n", COMMA, yytext);  break;
        case SMI:       fprintf(yyout,"< %d , %s >\n", SMI, yytext);  break;
        case COLON:     fprintf(yyout,"< %d , %s >\n", COLON, yytext);  break;
        case SQU:       fprintf(yyout,"< %d , %s >\n", SQU, yytext);  break;
        case DQU:       fprintf(yyout,"< %d , %s >\n", DQU, yytext);  break;

        case PT:        fprintf(yyout,"< %d , %s >\n", PT, yytext);  break;
        case SCF:       fprintf(yyout,"< %d , %s >\n", SCF, yytext);  break;
        
        case INT_BIN:   fprintf(yyout,"< %d , %s >\n", INT_BIN, yytext);  break;
        case INT_HEX:   fprintf(yyout,"< %d , %s >\n", INT_HEX, yytext);  break;

        case PNT:       fprintf(yyout,"< %d , %s >\n", PNT, yytext);  break;
        case ARROW:     fprintf(yyout,"< %d , %s >\n", ARROW, yytext);  break;

        case COMMENT:   fprintf(yyout,"< %d , COMMENT >\n", COMMENT);  break;
        case DF:        fprintf(yyout,"< %d , %s >\n", DF, yytext);  break;
        case IFILE:     fprintf(yyout,"< %d , %s >\n", IFILE, yytext);  break;
        case ERR:       fprintf(yyout,"< %d , %s >\n", ERR, yytext);  break;
        
        default: break;
    }
    return;
}

int main (int argc, char ** argv){
    
    printf("TOKEN KEYWORD   TOKEN VALUE\n");
    int c;
	if (argc>=2){
	    if ((yyin = fopen(argv[1], "r")) == NULL){
	    printf("Can't open file %s\n", argv[1]);
	    return 1;
        }
        if (argc>=3){
            yyout=fopen(argv[2], "w");
	    }
	}

	while (1){
        c = yylex();
        textout(c);
        if(c == -1)
            break;
	}
    
	if(argc>=2){
	    fclose(yyin);
	    if (argc>=3) fclose(yyout);
	}
	return 0;

}
