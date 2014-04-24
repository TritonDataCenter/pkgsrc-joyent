$NetBSD$

Bison 3 compatibility.

--- sql/sql_yacc.yy.orig	2014-02-19 13:48:13.000000000 +0000
+++ sql/sql_yacc.yy
@@ -26,8 +26,6 @@
 ** The type will be void*, so it must be  cast to (THD*) when used.
 ** Use the YYTHD macro for this.
 */
-#define YYPARSE_PARAM yythd
-#define YYLEX_PARAM yythd
 #define YYTHD ((THD *)yythd)
 #define YYLIP (& YYTHD->m_parser_state->m_lip)
 #define YYPS (& YYTHD->m_parser_state->m_yacc)
@@ -85,7 +83,7 @@ int yylex(void *yylval, void *yythd);
     ulong val= *(F);                          \
     if (my_yyoverflow((B), (D), &val))        \
     {                                         \
-      yyerror((char*) (A));                   \
+      yyerror(yythd, (char*) (A));            \
       return 2;                               \
     }                                         \
     else                                      \
@@ -183,7 +181,7 @@ void my_parse_error(const char *s)
   to abort from the parser.
 */
 
-void MYSQLerror(const char *s)
+void MYSQLerror(void *yythd, const char *s)
 {
   THD *thd= current_thd;
 
@@ -1024,7 +1022,9 @@ bool match_authorized_user(Security_cont
 bool my_yyoverflow(short **a, YYSTYPE **b, ulong *yystacksize);
 %}
 
-%pure_parser                                    /* We have threads */
+%pure-parser					/* We have threads */
+%parse-param { void *yythd }
+%lex-param { void *yythd }
 /*
   Currently there are 161 shift/reduce conflicts.
   We should not introduce new conflicts any more.
