$NetBSD$

Limit tcp_info to Linux and FreeBSD.

--- percona-xtradb-cluster-galera/galerautils/src/gu_asio_socket_util.hpp.orig	2024-11-25 10:01:03.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_asio_socket_util.hpp
@@ -143,12 +143,12 @@ static void bind(Socket& socket, const g
     }
 }
 
+#if defined(__linux__) || defined(__FreeBSD__)
 template <class Socket>
 static struct tcp_info get_tcp_info(Socket& socket)
 {
     struct tcp_info tcpi;
     memset(&tcpi, 0, sizeof(tcpi));
-#if defined(__linux__) || defined(__FreeBSD__)
 #if defined(__linux__)
     static int const level(SOL_TCP);
 #else /* FreeBSD */
@@ -162,9 +162,9 @@ static struct tcp_info get_tcp_info(Sock
         gu_throw_system_error(err) << "Failed to read TCP info from socket: "
                                    << strerror(err);
     }
-#endif /* __linux__ || __FreeBSD__ */
     return tcpi;
 }
+#endif /* __linux__ || __FreeBSD__ */
 
 
 static inline std::string
