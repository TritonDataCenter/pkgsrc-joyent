$NetBSD$

Fix build on illumos.

--- sql/mysqld.cc.orig	2019-12-14 16:07:34.000000000 +0000
+++ sql/mysqld.cc
@@ -4427,7 +4427,7 @@ int init_common_variables() {
     */
   }
 #endif /* HAVE_LINUX_LARGE_PAGES */
-#ifdef HAVE_SOLARIS_LARGE_PAGES
+#ifdef notHAVE_SOLARIS_LARGE_PAGES
 #define LARGE_PAGESIZE (4 * 1024 * 1024)         /* 4MB */
 #define SUPER_LARGE_PAGESIZE (256 * 1024 * 1024) /* 256MB */
   if (opt_large_pages) {
