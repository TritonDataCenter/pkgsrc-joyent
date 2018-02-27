$NetBSD$

synch.h on SunOS is not what's expected here.

--- deps/mariadb-client-library/mariadb-connector-c-2.3.1/include/my_pthread.h.orig	2016-08-03 15:39:12.000000000 +0000
+++ deps/mariadb-client-library/mariadb-connector-c-2.3.1/include/my_pthread.h
@@ -214,7 +214,7 @@ extern int my_sigwait(const sigset_t *se
 #ifdef HAVE_SCHED_H
 #include <sched.h>
 #endif
-#ifdef HAVE_SYNCH_H
+#if defined(HAVE_SYNCH_H) && !defined(__sun)
 #include <synch.h>
 #endif
 #if defined(__EMX__) && (!defined(EMX_PTHREAD_REV) || (EMX_PTHREAD_REV < 2))
