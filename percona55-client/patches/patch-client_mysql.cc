$NetBSD$

Backport upstream fix.

--- client/mysql.cc.orig	2017-08-18 12:24:50.000000000 +0000
+++ client/mysql.cc
@@ -2714,7 +2714,7 @@ You can turn off this feature to get a q
         mysql_free_result(fields);
         break;
       }
-      field_names[i][num_fields*2]= '\0';
+      field_names[i][num_fields*2]= NULL;
       j=0;
       while ((sql_field=mysql_fetch_field(fields)))
       {
