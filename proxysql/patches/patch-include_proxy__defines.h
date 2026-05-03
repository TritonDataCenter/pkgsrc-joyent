$NetBSD$

This should avoid epoll usage.

--- include/proxy_defines.h.orig	2018-09-21 20:55:57.000000000 +0000
+++ include/proxy_defines.h
@@ -2,7 +2,7 @@
 // If defined then active pthread mutex in ProxySQL_Admin else use the wrlock
 #define PA_PTHREAD_MUTEX
 
-#if !defined(__FreeBSD__) && !defined(__APPLE__)
+#if !defined(__FreeBSD__) && !defined(__APPLE__) && !defined(__sun)
 // If enabled, it adds support for auxiliary threads
 #define IDLE_THREADS
 #endif
