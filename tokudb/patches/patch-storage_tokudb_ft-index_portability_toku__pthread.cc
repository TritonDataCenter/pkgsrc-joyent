$NetBSD$

SunOS has sched_yield instead of pthread_yield_np.
--- storage/tokudb/ft-index/portability/toku_pthread.cc.orig	2015-02-24 19:09:53.000000000 +0000
+++ storage/tokudb/ft-index/portability/toku_pthread.cc
@@ -92,6 +92,10 @@ PATENT RIGHTS GRANT:
 #include <portability/toku_config.h>
 #include <toku_pthread.h>
 
+#if defined(__sun)
+#include <sched.h>	// for sched_yield()
+#endif
+
 int toku_pthread_yield(void) {
 #if defined(HAVE_PTHREAD_YIELD)
 # if defined(PTHREAD_YIELD_RETURNS_INT)
@@ -105,6 +109,8 @@ int toku_pthread_yield(void) {
 #elif defined(HAVE_PTHREAD_YIELD_NP)
     pthread_yield_np();
     return 0;
+#elif defined(__sun)
+    return sched_yield();
 #else
 # error "cannot find pthread_yield or pthread_yield_np"
 #endif
