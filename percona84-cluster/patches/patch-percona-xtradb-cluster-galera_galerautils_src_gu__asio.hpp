$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/src/gu_asio.hpp.orig	2022-04-07 06:34:19.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_asio.hpp
@@ -462,7 +462,9 @@ namespace gu
         /**
          * Read tcp_info struct from the underlying TCP socket.
          */
+#if defined(__linux__) || defined(__FreeBSD__)
         virtual struct tcp_info get_tcp_info() = 0;
+#endif
     };
 
     /**
