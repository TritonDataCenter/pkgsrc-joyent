$NetBSD$

Fix build on SunOS.

--- include/proxysql.h.orig	2018-09-21 20:55:57.000000000 +0000
+++ include/proxysql.h
@@ -1,4 +1,5 @@
 #ifdef __cplusplus
+#include <cstring>
 #include <string>
 #include <stack>
 
@@ -111,6 +112,11 @@ void init_debug_struct_from_cmdline();
 void proxy_debug_func(enum debug_module, int, int, const char *, int, const char *, const char *, ...);
 #endif
 
+#if defined(__sun)
+#include <sys/filio.h>
+#define MSG_NOSIGNAL 0
+#endif
+
 #ifdef __cplusplus
 }
 #endif /* __cplusplus */
