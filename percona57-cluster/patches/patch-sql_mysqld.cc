$NetBSD$

Avoid segfault on exit, PKGSRC-1342.

--- sql/mysqld.cc.orig	2019-06-19 23:17:41.000000000 +0000
+++ sql/mysqld.cc
@@ -2750,7 +2750,11 @@ extern "C" void *signal_hand(void *arg M
         close_connections();
 
 #ifdef WITH_WSREP
+        /*
+         * Do not unload as it can conflict with atexit/__cxa_finalize
+         * handlers.  We're exiting anyway so leave it to process cleanup.
         if (WSREP_ON) wsrep_deinit();
+         */
 #endif /* WITH_WSREP */
       }
       my_thread_end();
