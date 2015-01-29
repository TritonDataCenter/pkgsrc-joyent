$NetBSD: patch-include_my_pthread.h,v 1.1.1.1 2011/04/25 21:12:53 adam Exp $

--- include/my_pthread.h.orig	2014-09-05 08:16:57.000000000 +0000
+++ include/my_pthread.h
@@ -20,6 +20,13 @@
 
 #include "my_global.h"                          /* myf */
 
+/* defines __NetBSD_Version__ */
+#if defined(__NetBSD__)
+#include <sys/param.h>
+#endif
+
+#include <signal.h>
+
 #ifndef ETIME
 #define ETIME ETIMEDOUT				/* For FreeBSD */
 #endif
@@ -238,6 +245,10 @@ int sigwait(sigset_t *set, int *sig);
 #endif
 
 #ifndef HAVE_NONPOSIX_SIGWAIT
+#if defined (__NetBSD__) && (__NetBSD_Version__ < 106130000)
+#define my_sigwait(A,B) __pthread_sigwait((A),(B))
+#else
+#endif
 #define my_sigwait(A,B) sigwait((A),(B))
 #else
 int my_sigwait(const sigset_t *set,int *sig);
