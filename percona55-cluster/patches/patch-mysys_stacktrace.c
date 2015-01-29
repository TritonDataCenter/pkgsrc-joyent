$NetBSD: patch-mysys_stacktrace.c,v 1.2 2012/10/01 15:54:40 adam Exp $

--- mysys/stacktrace.c.orig	2014-09-05 08:16:57.000000000 +0000
+++ mysys/stacktrace.c
@@ -431,7 +431,7 @@ void my_write_core(int sig)
   __gcov_flush();
 #endif
   pthread_kill(pthread_self(), sig);
-#if defined(P_MYID) && !defined(SCO)
+#if HAVE_SIGSEND && defined(P_MYID) && !defined(SCO)
   /* On Solaris, the above kill is not enough */
   sigsend(P_PID,P_MYID,sig);
 #endif
