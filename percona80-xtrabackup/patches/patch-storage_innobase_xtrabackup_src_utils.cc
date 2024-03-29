$NetBSD$

Support SunOS.

--- storage/innobase/xtrabackup/src/utils.cc.orig	2023-07-13 07:32:22.000000000 +0000
+++ storage/innobase/xtrabackup/src/utils.cc
@@ -22,7 +22,7 @@ Foundation, Inc., 51 Franklin Street, Fi
 #ifdef __APPLE__
 #include <mach/mach_host.h>
 #include <sys/sysctl.h>
-#else
+#elif defined(__linux__)
 #ifdef HAVE_PROCPS_V3
 #include <proc/sysinfo.h>
 #else
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
