$NetBSD$

Fix crash on exit, PKGSRC-1342.
Avoid SunOS large pages, only supported on Oracle Solaris.

--- sql/mysqld.cc.orig	2020-04-17 13:14:42.000000000 +0000
+++ sql/mysqld.cc
@@ -2462,7 +2462,11 @@ static void mysqld_exit(int exit_code) {
       (exit_code >= MYSQLD_SUCCESS_EXIT && exit_code <= MYSQLD_ABORT_EXIT) ||
       exit_code == MYSQLD_RESTART_EXIT);
 #ifdef WITH_WSREP
+  /*
+   * Do not unload as it can conflict with atexit/__cxa_finalize
+   * handlers.  We're exiting anyway so leave it to process cleanup.
   wsrep_deinit_server();
+   */
 #endif /* WITH_WSREP */
   mysql_audit_finalize();
   Srv_session::module_deinit();
@@ -3866,7 +3870,11 @@ extern "C" void *signal_hand(void *arg M
           close_connections();
 
 #ifdef WITH_WSREP
+          /*
+           * Do not unload as it can conflict with atexit/__cxa_finalize
+           * handlers.  We're exiting anyway so leave it to process cleanup.
           if (WSREP_ON) wsrep_deinit();
+           */
 #endif /* WITH_WSREP */
         }
         my_thread_end();
@@ -5160,7 +5168,7 @@ int init_common_variables() {
     */
   }
 #endif /* HAVE_LINUX_LARGE_PAGES */
-#ifdef HAVE_SOLARIS_LARGE_PAGES
+#ifdef notHAVE_SOLARIS_LARGE_PAGES
 #define LARGE_PAGESIZE (4 * 1024 * 1024)         /* 4MB */
 #define SUPER_LARGE_PAGESIZE (256 * 1024 * 1024) /* 256MB */
   if (opt_large_pages) {
