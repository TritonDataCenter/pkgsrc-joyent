$NetBSD$

SunOS does not expose s6_addr32 to userland code.

--- sql/mysqld.cc.orig	2019-05-03 11:55:18.000000000 +0000
+++ sql/mysqld.cc
@@ -807,6 +807,10 @@ inline void setup_fpu() {
 #endif /* __i386__ */
 }
 
+#if defined(__sun) && !defined(s6_addr32)
+#define s6_addr32	_S6_un._S6_u32
+#endif
+
 extern "C" void handle_fatal_signal(int sig);
 
 /* Constants */
