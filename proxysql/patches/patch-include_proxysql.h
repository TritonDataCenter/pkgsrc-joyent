$NetBSD$

Fix build on SunOS.

--- include/proxysql.h.orig	2017-03-26 11:18:09.000000000 +0000
+++ include/proxysql.h
@@ -1,4 +1,5 @@
 #ifdef __cplusplus
+#include <cstring>
 #include <string>
 #include <stack>
 
@@ -135,6 +136,10 @@ void init_debug_struct_from_cmdline();
 void proxy_debug_func(enum debug_module, int, int, const char *, int, const char *, const char *, ...);
 #endif
 
+#if defined(__sun)
+#include <sys/filio.h>
+#define MSG_NOSIGNAL 0
+#endif
 
 #ifdef __cplusplus
 }
