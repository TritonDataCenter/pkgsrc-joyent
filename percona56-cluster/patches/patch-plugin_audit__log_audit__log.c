$NetBSD$

--- plugin/audit_log/audit_log.c.orig	2017-04-13 12:11:11.000000000 +0000
+++ plugin/audit_log/audit_log.c
@@ -69,8 +69,14 @@ static char *audit_log_exclude_commands=
 static char *audit_log_include_commands= NULL;
 
 static int audit_log_syslog_facility_codes[]=
-  { LOG_USER,   LOG_AUTHPRIV, LOG_CRON,   LOG_DAEMON, LOG_FTP,
+  { LOG_USER,   LOG_CRON,   LOG_DAEMON,
     LOG_KERN,   LOG_LPR,      LOG_MAIL,   LOG_NEWS,
+#if (defined LOG_AUTHPRIV)
+    LOG_AUTHPRIV,
+#endif
+#if (defined LOG_FTP)
+    LOG_FTP,
+#endif
 #if (defined LOG_SECURITY)
     LOG_SECURITY,
 #endif
