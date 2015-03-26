$NetBSD$

Add support for NetBSD<7.

--- deps/v8/src/base/platform/semaphore.cc.orig	2015-03-24 01:12:47.000000000 +0000
+++ deps/v8/src/base/platform/semaphore.cc
@@ -2,6 +2,7 @@
 // Use of this source code is governed by a BSD-style license that can be
 // found in the LICENSE file.
 
+#include <sys/param.h>
 #include "src/base/platform/semaphore.h"
 
 #if V8_OS_MACOSX
@@ -14,6 +15,33 @@
 #include "src/base/logging.h"
 #include "src/base/platform/time.h"
 
+#if defined(__NetBSD__) && (__NetBSD_Version__ < 699000400)
+static inline int sem_timedwait(sem_t *sem, const struct timespec *ts) {
+  struct timespec onems = { 0, 1000000 };
+  struct timespec total = { 0, 0 };
+  struct timespec unslept;
+  struct timespec elapsed;
+  struct timespec tmp;
+
+  while (timespeccmp(ts, &total, >)) {
+    if (sem_trywait(sem) == 0)
+      return 0;
+
+    if (errno != EAGAIN)
+      return -1;
+
+    (void)nanosleep(&onems, &unslept);
+
+    timespecsub(&onems, &unslept, &elapsed);
+    timespecadd(&total, &elapsed, &tmp);
+    total.tv_sec = tmp.tv_sec;
+    total.tv_nsec = tmp.tv_nsec;
+  }
+  errno = ETIMEDOUT;
+  return -1;
+}
+#endif /* __NetBSD__ */
+
 namespace v8 {
 namespace base {
 
