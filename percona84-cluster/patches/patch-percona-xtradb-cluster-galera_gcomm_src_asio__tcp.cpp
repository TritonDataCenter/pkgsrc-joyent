$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/gcomm/src/asio_tcp.cpp.orig	2022-04-07 06:34:19.000000000 +0000
+++ percona-xtradb-cluster-galera/gcomm/src/asio_tcp.cpp
@@ -656,6 +656,7 @@ gcomm::SocketStats gcomm::AsioTcpSocket:
     SocketStats ret;
     try
     {
+#if defined(__linux__) || defined(__FreeBSD__)
         auto tcpi(socket_->get_tcp_info());
         ret.rtt            = tcpi.tcpi_rtt;
         ret.rttvar         = tcpi.tcpi_rttvar;
@@ -667,6 +668,7 @@ gcomm::SocketStats gcomm::AsioTcpSocket:
 #endif /* __linux__ */
         ret.last_data_recv = tcpi.tcpi_last_data_recv;
         ret.cwnd           = tcpi.tcpi_snd_cwnd;
+#endif
         gu::datetime::Date now(gu::datetime::Date::monotonic());
         Critical<AsioProtonet> crit(net_);
         ret.last_queued_since = (now - last_queued_tstamp_).get_nsecs();
