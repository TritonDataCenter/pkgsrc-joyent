$NetBSD$

--- plugin/audit_log/audit_log.c.orig	2016-09-19 11:10:30.000000000 +0000
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
@@ -80,8 +86,14 @@ static int audit_log_syslog_facility_cod
 
 
 static const char *audit_log_syslog_facility_names[]=
-  { "LOG_USER",   "LOG_AUTHPRIV", "LOG_CRON",   "LOG_DAEMON", "LOG_FTP",
+  { "LOG_USER",   "LOG_CRON",   "LOG_DAEMON",
     "LOG_KERN",   "LOG_LPR",      "LOG_MAIL",   "LOG_NEWS",
+#if (defined LOG_AUTHPRIV)
+    "LOG_AUTHPRIV",
+#endif
+#if (defined LOG_FTP)
+    "LOG_FTP",
+#endif
 #if (defined LOG_SECURITY)
     "LOG_SECURITY",
 #endif
