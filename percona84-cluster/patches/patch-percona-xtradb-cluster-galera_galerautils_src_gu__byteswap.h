$NetBSD$

Add missing include.

--- percona-xtradb-cluster-galera/galerautils/src/gu_byteswap.h.orig	2023-07-27 06:44:53.000000000 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_byteswap.h
@@ -54,6 +54,7 @@ static GU_FORCE_INLINE uint64_t GU_ROTL6
 #  define gu_bswap32 _OSSwapInt32
 #  define gu_bswap64 _OSSwapInt64
 #elif defined(__sun__)
+#include <sys/byteorder.h>
 #  define gu_bswap16 BSWAP_16
 #  define gu_bswap32 BSWAP_32
 #  define gu_bswap64 BSWAP_64
