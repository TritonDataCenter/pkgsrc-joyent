$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/tests/gu_asio_test.cpp.orig	2023-07-27 06:44:53.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/tests/gu_asio_test.cpp
@@ -903,7 +903,9 @@ void test_get_tcp_info_common(gu::AsioIo
     {
         io_service.run_one();
     }
+#if defined(__linux__) || defined(__FreeBSD__)
     (void)socket->get_tcp_info();
+#endif
 }
 
 START_TEST(test_tcp_get_tcp_info)
