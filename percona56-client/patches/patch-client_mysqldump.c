$NetBSD$

--- client/mysqldump.c.orig	2013-06-26 20:38:20.000000000 +0000
+++ client/mysqldump.c
@@ -2564,7 +2564,7 @@ static my_bool contains_autoinc_column(c
       Check only the first (for PRIMARY KEY) or the second (for secondary keys)
       quoted identifier.
     */
-    if ((idnum == 1 + test(type != KEY_TYPE_PRIMARY)))
+    if ((idnum == 1 + my_test(type != KEY_TYPE_PRIMARY)))
       break;
 
     keydef= to + 1;
