$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.cpp.orig	2024-12-11 15:45:47.600751718 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_asio_stream_react.cpp
@@ -356,6 +356,7 @@ catch (const asio::system_error& e)
     gu_throw_system_error(e.code().value()) << "error getting send buffer size";
 }
 
+#if defined(__linux__) || defined(__FreeBSD__)
 struct tcp_info gu::AsioStreamReact::get_tcp_info() try
 {
     return ::get_tcp_info(socket_);
@@ -364,6 +365,7 @@ catch (const asio::system_error& e)
 {
     gu_throw_system_error(e.code().value()) << "error getting TCP info";
 }
+#endif
 
 
 void gu::AsioStreamReact::complete_client_handshake(
