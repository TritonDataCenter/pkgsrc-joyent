$NetBSD: patch-sql_sql__table.cc,v 1.1 2013/05/06 14:41:08 joerg Exp $

--- sql/sql_table.cc.orig	2013-06-26 20:38:20.000000000 +0000
+++ sql/sql_table.cc
@@ -3876,7 +3876,7 @@ mysql_prepare_create_table(THD *thd, HA_
 	  with length (unlike blobs, where ft code takes data length from a
 	  data prefix, ignoring column->length).
 	*/
-	column->length=test(f_is_blob(sql_field->pack_flag));
+	column->length=my_test(f_is_blob(sql_field->pack_flag));
       }
       else
       {
@@ -7061,7 +7061,7 @@ mysql_prepare_alter_table(THD *thd, TABL
 
       key= new Key(key_type, key_name, strlen(key_name),
                    &key_create_info,
-                   test(key_info->flags & HA_GENERATED_KEY),
+                   my_test(key_info->flags & HA_GENERATED_KEY),
                    key_parts);
       new_key_list.push_back(key);
 
@@ -9267,7 +9267,7 @@ static bool check_engine(THD *thd, const
   handlerton *enf_engine= ha_enforce_handlerton(thd);
 
   bool no_substitution=
-        test(thd->variables.sql_mode & MODE_NO_ENGINE_SUBSTITUTION);
+        my_test(thd->variables.sql_mode & MODE_NO_ENGINE_SUBSTITUTION);
 
   if (!(*new_engine= ha_checktype(thd, ha_legacy_type(req_engine),
                                   no_substitution, 1)))
