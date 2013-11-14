$NetBSD$

Older NetBSD does not have pthread_condattr_setclock.
--- deps/uv/src/unix/thread.c.orig	2013-11-12 20:22:12.000000000 +0000
+++ deps/uv/src/unix/thread.c
@@ -283,8 +283,10 @@ int uv_cond_init(uv_cond_t* cond) {
   if (pthread_condattr_init(&attr))
     return -1;
 
+#if !(defined(__NetBSD__) && (__NetBSD_Version__ < 699001600))
   if (pthread_condattr_setclock(&attr, CLOCK_MONOTONIC))
     goto error2;
+#endif
 
   if (pthread_cond_init(cond, &attr))
     goto error2;
