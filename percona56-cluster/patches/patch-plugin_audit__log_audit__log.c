$NetBSD$

--- plugin/audit_log/audit_log.c.orig	2014-11-25 06:30:35.000000000 +0000
+++ plugin/audit_log/audit_log.c
@@ -62,8 +62,14 @@ ulong audit_log_syslog_priority= 0;
 
 
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
