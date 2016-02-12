$NetBSD$

Support Apache 2.4.

--- src/crowd_client.c.orig	2013-11-20 23:34:10.000000000 +0000
+++ src/crowd_client.c
@@ -614,8 +614,13 @@ static char *make_app_cache_key(const re
 
 static char *make_session_cache_key(const char *token, const char *forwarded_for, const request_rec *r, const crowd_config *config) {
     return log_ralloc(r, apr_psprintf(r->pool, "%s\037%s\037%s\037%s\037%s", token,
-        forwarded_for == NULL ? "" : forwarded_for, r->connection->remote_ip, config->crowd_app_name,
-        config->crowd_url));
+        forwarded_for == NULL ? "" : forwarded_for,
+#if AP_MODULE_MAGIC_AT_LEAST(20111130,0)
+        r->useragent_ip,
+#else
+        r->connection->remote_ip,
+#endif
+        config->crowd_app_name, config->crowd_url));
 }
 
 /*==========================
@@ -747,7 +752,12 @@ static bool handle_crowd_create_session_
 
 static const char *get_validation_factors(const request_rec *r, const char *forwarded_for) {
     const char *payload_beginning = log_ralloc(r, apr_pstrcat(r->pool,
-        "<validation-factors><validation-factor><name>remote_address</name><value>", r->connection->remote_ip,
+        "<validation-factors><validation-factor><name>remote_address</name><value>",
+#if AP_MODULE_MAGIC_AT_LEAST(20111130,0)
+    	r->useragent_ip,
+#else
+        r->connection->remote_ip,
+#endif
         "</value></validation-factor>", NULL));
     if (payload_beginning == NULL) {
         return NULL;
