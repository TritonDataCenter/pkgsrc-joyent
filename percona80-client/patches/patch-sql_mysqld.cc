$NetBSD$

SunOS does not expose s6_addr32 to userland code.

--- sql/mysqld.cc.orig	2019-12-05 20:21:35.000000000 +0000
+++ sql/mysqld.cc
@@ -841,6 +841,10 @@ inline void setup_fpu() {
 #endif /* __i386__ */
 }
 
+#if defined(__sun) && !defined(s6_addr32)
+#define s6_addr32	_S6_un._S6_u32
+#endif
+
 extern "C" void handle_fatal_signal(int sig);
 
 /* Constants */
@@ -4667,7 +4671,7 @@ int init_common_variables() {
     */
   }
 #endif /* HAVE_LINUX_LARGE_PAGES */
-#ifdef HAVE_SOLARIS_LARGE_PAGES
+#ifdef notHAVE_SOLARIS_LARGE_PAGES
 #define LARGE_PAGESIZE (4 * 1024 * 1024)         /* 4MB */
 #define SUPER_LARGE_PAGESIZE (256 * 1024 * 1024) /* 256MB */
   if (opt_large_pages) {
