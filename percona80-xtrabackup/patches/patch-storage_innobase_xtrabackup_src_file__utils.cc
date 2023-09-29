$NetBSD$

Limit epoll to Linux.

--- storage/innobase/xtrabackup/src/file_utils.cc.orig	2023-07-13 07:32:22.000000000 +0000
+++ storage/innobase/xtrabackup/src/file_utils.cc
@@ -22,7 +22,7 @@ Foundation, Inc., 51 Franklin Street, Fi
 #include <mysql/service_mysql_alloc.h>
 #ifdef __APPLE__
 #include <sys/event.h>
-#else
+#elif defined(__linux__)
 #include <sys/epoll.h>
 #endif
 #include <thread>
@@ -406,7 +406,7 @@ File open_fifo_for_read_with_timeout(con
     return -1;
   }
   close(kqueue_fd);
-#else
+#elif defined(__linux__)
   int epoll_fd = epoll_create1(0);
   if (epoll_fd < 0) {
     return -1;
