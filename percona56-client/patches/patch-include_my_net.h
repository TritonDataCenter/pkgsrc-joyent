$NetBSD: patch-include_my_net.h,v 1.1 2013/02/13 21:00:04 adam Exp $

Define SHUT_RDWR for Irix 5.

--- include/my_net.h.orig	2016-03-03 13:27:37.000000000 +0000
+++ include/my_net.h
@@ -70,6 +70,15 @@ C_MODE_START
 #include <netdb.h>     /* getaddrinfo() & co */
 #endif
 
+#if defined(__sgi) && !defined(SHUT_RDWR)
+
+/*
+  IRIX 5 does not define SHUT_RDWR
+*/
+
+#define SHUT_RDWR 2
+#endif
+
 /*
   On OSes which don't have the in_addr_t, we guess that using uint32 is the best
   possible choice. We guess this from the fact that on HP-UX64bit & FreeBSD64bit
@@ -83,5 +92,9 @@ C_MODE_START
 #define s6_addr32 __u6_addr.__u6_addr32
 #endif
 
+#if defined(HAVE_IPV6) && defined(__sun)
+#define s6_addr32 _S6_un._S6_u32
+#endif
+
 C_MODE_END
 #endif
