$NetBSD$

Add thread support on SunOS.
--- storage/tokudb/PerconaFT/portability/toku_pthread.h.orig	2015-02-25 15:40:56.000000000 +0000
+++ storage/tokudb/PerconaFT/portability/toku_pthread.h
@@ -142,7 +142,7 @@ typedef struct toku_mutex_aligned {
 #endif
 
 // Darwin doesn't provide adaptive mutexes
-#if defined(__APPLE__)
+#if defined(__APPLE__) || defined(__sun)
 # define TOKU_MUTEX_ADAPTIVE PTHREAD_MUTEX_DEFAULT
 # if TOKU_PTHREAD_DEBUG
 #  define TOKU_ADAPTIVE_MUTEX_INITIALIZER { .pmutex = PTHREAD_MUTEX_INITIALIZER, .owner = 0, .locked = false, .valid = true }
