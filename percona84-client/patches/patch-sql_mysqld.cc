$NetBSD$

SunOS does not expose s6_addr32 to userland code.

--- sql/mysqld.cc.orig	2025-05-27 16:31:11.000000000 +0000
+++ sql/mysqld.cc
@@ -1007,6 +1007,10 @@ using std::vector;
 #define mysqld_charset &my_charset_latin1
 #define mysqld_default_locale_name "en_US"
 
+#if defined(__sun) && !defined(s6_addr32)
+#define s6_addr32	_S6_un._S6_u32
+#endif
+
 #ifdef HAVE_FPU_CONTROL_H
 #include <fpu_control.h>  // IWYU pragma: keep
 #elif defined(__i386__)
@@ -6894,7 +6898,7 @@ int init_common_variables() {
     */
   }
 #endif /* HAVE_LINUX_LARGE_PAGES */
-#ifdef HAVE_SOLARIS_LARGE_PAGES
+#ifdef notHAVE_SOLARIS_LARGE_PAGES
 #define LARGE_PAGESIZE (4 * 1024 * 1024)         /* 4MB */
 #define SUPER_LARGE_PAGESIZE (256 * 1024 * 1024) /* 256MB */
   if (opt_large_pages) {
