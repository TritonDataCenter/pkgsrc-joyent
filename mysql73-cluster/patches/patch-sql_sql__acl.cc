$NetBSD$

Build fix.

--- sql/sql_acl.cc.orig	2014-07-02 09:22:13.000000000 +0000
+++ sql/sql_acl.cc
@@ -3227,7 +3227,7 @@ static int replace_user_table(THD *thd,
       * An empty password is considered to be of mysql_native type.
     */
     
-    if (combo->plugin.str == NULL || combo->plugin.str == '\0')
+    if (combo->plugin.str == NULL || combo->plugin.str[0] == '\0')
     {
       if (combo->uses_identified_by_password_clause)
       {
