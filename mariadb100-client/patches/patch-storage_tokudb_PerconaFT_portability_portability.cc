$NetBSD$

Add thread and fcntl support on SunOS.
--- storage/tokudb/PerconaFT/portability/portability.cc.orig	2015-02-25 15:40:56.000000000 +0000
+++ storage/tokudb/PerconaFT/portability/portability.cc
@@ -130,6 +130,9 @@ PATENT RIGHTS GRANT:
 #include "memory.h"
 #include <portability/toku_atomic.h>
 #include <util/partitioned_counter.h>
+#if defined(__sun)
+#include <thread.h>
+#endif
 
 int
 toku_portability_init(void) {
@@ -160,6 +163,8 @@ toku_os_gettid(void) {
     return syscall(SYS_gettid);
 #elif defined(HAVE_PTHREAD_GETTHREADID_NP)
     return pthread_getthreadid_np();
+#elif defined(__sun)
+    return thr_self();
 #else
 # error "no implementation of gettid available"
 #endif
@@ -244,7 +249,18 @@ toku_os_lock_file(const char *name) {
     int r;
     int fd = open(name, O_RDWR|O_CREAT, S_IRUSR | S_IWUSR);
     if (fd>=0) {
+#if defined(__sun)
+       struct flock lock;
+
+       lock.l_start = 0;
+       lock.l_len = 0;
+       lock.l_type = F_WRLCK;
+       lock.l_whence = SEEK_SET;
+
+        r = fcntl(fd, F_SETLK, &lock);
+#else
         r = flock(fd, LOCK_EX | LOCK_NB);
+#endif
         if (r!=0) {
             r = errno; //Save errno from flock.
             close(fd);
@@ -257,7 +273,17 @@ toku_os_lock_file(const char *name) {
 
 int
 toku_os_unlock_file(int fildes) {
+#if defined(__sun)
+    struct flock lock;
+
+    lock.l_start = 0;
+    lock.l_len = 0;
+    lock.l_type = F_WRLCK;
+    lock.l_whence = SEEK_SET;
+    int r = fcntl(fildes, F_SETLK, &lock);
+#else
     int r = flock(fildes, LOCK_UN);
+#endif
     if (r==0) r = close(fildes);
     return r;
 }
@@ -407,6 +433,10 @@ toku_os_get_processor_frequency(uint64_t
         r = toku_get_processor_frequency_sys(hzret);
         if (r != 0)
             r = toku_get_processor_frequency_cpuinfo(hzret);
+#if defined(__sun)
+        if (r != 0)
+            r = toku_get_processor_frequency_sysctl("kstat -p 'cpu_info:0:cpu_info0:current_clock_Hz'|awk '{print $2}'", hzret);
+#endif
         if (r != 0)
             r = toku_get_processor_frequency_sysctl("sysctl -n hw.cpufrequency", hzret);
         if (r != 0)
