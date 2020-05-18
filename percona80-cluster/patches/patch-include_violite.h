$NetBSD$

Additional s6_addr32 compatibility.

--- include/violite.h.orig	2020-04-17 13:14:42.000000000 +0000
+++ include/violite.h
@@ -64,8 +64,10 @@ struct Vio;
 #include <atomic>
 #endif
 
-#if defined(__APPLE__)
+#if defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__)
 #define s6_addr32 __u6_addr.__u6_addr32
+#elif defined(__sun)
+#define s6_addr32 _S6_un._S6_u32
 #endif
 
 #ifdef HAVE_PSI_INTERFACE
