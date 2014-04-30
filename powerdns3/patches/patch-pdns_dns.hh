$NetBSD: patch-pdns_dns.hh,v 1.1 2012/05/20 19:37:49 marino Exp $

Add DragonFly support.
--- pdns/dns.hh.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/dns.hh
@@ -205,7 +205,7 @@ enum  {
 #ifdef WIN32
 #define BYTE_ORDER 1
 #define LITTLE_ENDIAN 1
-#elif __FreeBSD__ || __APPLE__ || __OpenBSD__
+#elif __FreeBSD__ || __APPLE__ || __OpenBSD__ || __DragonFly__
 #include <machine/endian.h>
 #elif __linux__
 # include <endian.h>
