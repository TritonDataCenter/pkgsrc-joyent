$NetBSD$

Fix build where LOG_AUTHPRIV/LOG_FTP codes are not defined.

--- plugin/audit_log/audit_log.c.orig	2016-06-30 06:22:11.000000000 +0000
+++ plugin/audit_log/audit_log.c
@@ -77,8 +77,14 @@ static PSI_memory_info all_audit_log_mem
 };
 
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
