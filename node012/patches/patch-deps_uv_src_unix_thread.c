$NetBSD: patch-deps_uv_src_unix_thread.c,v 1.1 2013/05/22 15:17:07 mspo Exp $

Older NetBSD does not have pthread_condattr_setclock.
--- deps/uv/src/unix/thread.c.orig	2015-02-06 20:04:23.000000000 +0000
+++ deps/uv/src/unix/thread.c
@@ -330,7 +330,7 @@ int uv_cond_init(uv_cond_t* cond) {
   if (err)
     return -err;
 
-#if !defined(__ANDROID__)
+#if !defined(__ANDROID__) && !(defined(__NetBSD__) && (__NetBSD_Version__ < 699001600))
   err = pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
   if (err)
     goto error2;
