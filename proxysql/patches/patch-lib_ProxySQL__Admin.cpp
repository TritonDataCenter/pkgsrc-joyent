$NetBSD$

How was this supposed to work at all?

--- lib/ProxySQL_Admin.cpp.orig	2017-03-26 11:18:09.000000000 +0000
+++ lib/ProxySQL_Admin.cpp
@@ -2291,7 +2291,7 @@ static void * admin_main_loop(void *arg)
 	//size_t c;
 	//int sd;
 	struct sockaddr_in addr;
-	//size_t mystacksize=256*1024;
+	size_t mystacksize=256*1024;
 	struct pollfd *fds=((struct _main_args *)arg)->fds;
 	int nfds=((struct _main_args *)arg)->nfds;
 	int *callback_func=((struct _main_args *)arg)->callback_func;
@@ -2522,7 +2522,7 @@ void ProxySQL_Admin::print_version() {
 bool ProxySQL_Admin::init() {
 	//int i;
 	cpu_timer cpt;
-	//size_t mystacksize=256*1024;
+	size_t mystacksize=256*1024;
 
 	child_func[0]=child_mysql;
 	child_func[1]=child_telnet;
