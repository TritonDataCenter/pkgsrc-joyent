$NetBSD$

Fix crash on exit, PKGSRC-1342.  Do not unload as it can conflict with
atexit/__cxa_finalize handlers.  We're exiting anyway so leave it to process
cleanup.

Avoid SunOS large pages, only supported on Oracle Solaris.

--- sql/mysqld.cc.orig	2025-03-30 10:27:08.000000000 +0000
+++ sql/mysqld.cc
@@ -2966,7 +2966,7 @@ static void mysqld_exit(int exit_code) {
          exit_code == MYSQLD_RESTART_EXIT);
 
 #ifdef WITH_WSREP
-  wsrep_deinit_server();
+  //wsrep_deinit_server();
 #endif /* WITH_WSREP */
 
   log_final_messages(exit_code);
@@ -4417,7 +4417,7 @@ extern "C" void *signal_hand(void *arg [
           close_connections();
 
 #ifdef WITH_WSREP
-          if (WSREP_ON) wsrep_deinit();
+          //if (WSREP_ON) wsrep_deinit();
 #endif /* WITH_WSREP */
         }
 #if defined(HAVE_GCOV) && !defined(NDEBUG)
@@ -7393,7 +7393,7 @@ int init_common_variables() {
     */
   }
 #endif /* HAVE_LINUX_LARGE_PAGES */
-#ifdef HAVE_SOLARIS_LARGE_PAGES
+#ifdef notHAVE_SOLARIS_LARGE_PAGES
 #define LARGE_PAGESIZE (4 * 1024 * 1024)         /* 4MB */
 #define SUPER_LARGE_PAGESIZE (256 * 1024 * 1024) /* 256MB */
   if (opt_large_pages) {
