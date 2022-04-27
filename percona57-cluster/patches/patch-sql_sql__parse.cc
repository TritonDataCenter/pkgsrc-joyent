$NetBSD$

Fix for -fpermissive.

--- sql/sql_parse.cc.orig	2022-02-07 19:58:26.000000000 +0000
+++ sql/sql_parse.cc
@@ -8163,7 +8163,7 @@ static void wsrep_mysql_parse(THD *thd,
 #endif
 
           /* DTRACE begin */
-          MYSQL_QUERY_START(rawbuf, thd->thread_id(),
+          MYSQL_QUERY_START((char *)rawbuf, thd->thread_id(),
                             (char *) (thd->db().str ? thd->db().str : ""),
                             (char *) thd->security_context()->priv_user().str,
                             (char *) thd->security_context()->host_or_ip().str);
