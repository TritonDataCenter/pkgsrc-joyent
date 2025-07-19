$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.hpp.orig	2022-04-07 06:34:19.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.hpp
@@ -66,7 +66,9 @@ namespace gu
         virtual size_t get_receive_buffer_size() GALERA_OVERRIDE;
         virtual void set_send_buffer_size(size_t) GALERA_OVERRIDE;
         virtual size_t get_send_buffer_size() GALERA_OVERRIDE;
+#if defined(__linux__) || defined(__FreeBSD__)
         virtual struct tcp_info get_tcp_info() GALERA_OVERRIDE;
+#endif
 
 
         // Handlers for ASIO service.
