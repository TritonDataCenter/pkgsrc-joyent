$NetBSD: patch-sql_mysqld.cc,v 1.3 2013/05/06 14:41:08 joerg Exp $

--- sql/mysqld.cc.orig	2013-06-26 20:38:20.000000000 +0000
+++ sql/mysqld.cc
@@ -1493,8 +1493,6 @@ static void close_server_sock()
 {
 #ifdef HAVE_CLOSE_SERVER_SOCK
   DBUG_ENTER("close_server_sock");
-  MYSQL_SOCKET tmp_sock;
-  tmp_sock=ip_sock;
 
   close_socket(base_ip_sock, "TCP/IP");
   close_socket(extra_ip_sock, "TCP/IP");
@@ -6354,7 +6352,7 @@ void handle_connections_sockets()
 
 #ifdef HAVE_LIBWRAP
     {
-      if (mysql_socket_getfd(sock) == mysql_socket_getfd(ip_sock))
+      if (mysql_socket_getfd(sock) == mysql_socket_getfd(base_ip_sock))
       {
         struct request_info req;
         signal(SIGCHLD, SIG_DFL);
@@ -8495,7 +8493,7 @@ mysqld_get_one_option(int optid,
     opt_myisam_log=1;
     break;
   case (int) OPT_BIN_LOG:
-    opt_bin_log= test(argument != disabled_my_option);
+    opt_bin_log= my_test(argument != disabled_my_option);
     break;
 #ifdef HAVE_REPLICATION
   case (int)OPT_REPLICATE_IGNORE_DB:
@@ -9007,7 +9005,7 @@ static int get_options(int *argc_ptr, ch
     Set some global variables from the global_system_variables
     In most cases the global variables will not be used
   */
-  my_disable_locking= myisam_single_user= test(opt_external_locking == 0);
+  my_disable_locking= myisam_single_user= my_test(opt_external_locking == 0);
   my_default_record_cache_size=global_system_variables.read_buff_size;
 
   global_system_variables.long_query_time= (ulonglong)
@@ -9053,7 +9051,7 @@ static int get_options(int *argc_ptr, ch
 #endif
 
   global_system_variables.engine_condition_pushdown=
-    test(global_system_variables.optimizer_switch &
+    my_test(global_system_variables.optimizer_switch &
          OPTIMIZER_SWITCH_ENGINE_CONDITION_PUSHDOWN);
 
   opt_readonly= read_only;
