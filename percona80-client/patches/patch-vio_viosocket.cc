$NetBSD$

SunOS does not expose s6_addr32 to userland code.

--- vio/viosocket.cc.orig	2019-05-03 11:55:18.000000000 +0000
+++ vio/viosocket.cc
@@ -703,6 +703,9 @@ static bool vio_client_must_be_proxied(c
         struct in6_addr *addr = &vio_pp_networks[i].addr.in6;
         struct in6_addr *mask = &vio_pp_networks[i].mask.in6;
         DBUG_ASSERT(vio_pp_networks[i].family == AF_INET6);
+#if defined(__sun) && !defined(s6_addr32)
+#define s6_addr32	_S6_un._S6_u32
+#endif
         if ((check->s6_addr32[0] & mask->s6_addr32[0]) == addr->s6_addr32[0] &&
             ((check->s6_addr32[1] & mask->s6_addr32[1]) ==
              addr->s6_addr32[1]) &&
