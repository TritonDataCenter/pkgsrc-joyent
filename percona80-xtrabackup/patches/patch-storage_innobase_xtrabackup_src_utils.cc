$NetBSD$

Support SunOS.

--- storage/innobase/xtrabackup/src/utils.cc.orig	2023-07-13 07:32:22.000000000 +0000
+++ storage/innobase/xtrabackup/src/utils.cc
@@ -143,6 +143,15 @@ unsigned long host_free_memory() {
   }
   return 0;
 }
+#elif defined(__sun)
+unsigned long host_total_memory() {
+  unsigned long total_mem = sysconf(_SC_PHYS_PAGES) * sysconf(_SC_PAGESIZE);
+  return total_mem;
+}
+
+unsigned long host_free_memory() {
+  return 0;
+}
 #else
 unsigned long host_total_memory() {
 #ifdef HAVE_PROCPS_V3
