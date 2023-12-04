$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.cpp.orig	2023-12-04 11:19:57.332137528 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.cpp
@@ -307,6 +307,7 @@ catch (const asio::system_error& e)
     gu_throw_error(e.code().value()) << "error getting send buffer size";
 }
 
+#if defined(__linux__) || defined(__FreeBSD__)
 struct tcp_info gu::AsioStreamReact::get_tcp_info() try
 {
     return ::get_tcp_info(socket_);
@@ -315,6 +316,7 @@ catch (const asio::system_error& e)
 {
     gu_throw_error(e.code().value()) << "error getting TCP info";
 }
+#endif
 
 
 void gu::AsioStreamReact::complete_client_handshake(
