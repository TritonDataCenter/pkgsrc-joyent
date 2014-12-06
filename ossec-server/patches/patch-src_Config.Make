$NetBSD$

Use pkgsrc zlib.
--- src/Config.Make.orig	2014-09-09 02:03:23.000000000 +0000
+++ src/Config.Make
@@ -23,7 +23,7 @@ OS_CRYPTO = ${PT}os_crypto/os_crypto.a
 OS_SHARED = ${PT}shared/lib_shared.a
 OS_ROOTCHECK = ${PT}rootcheck/rootcheck_lib.a
 OS_CONFIG = ${PT}config/lib_config.a
-OS_ZLIB = ${PT}os_zlib/os_zlib.c ${PT}external/libz.a
+OS_ZLIB = ${PT}os_zlib/os_zlib.c -lz
 OS_LINK = ${IEXTRA}
 OS_CJSON = ${PT}external/libcJSON.a -lm
 DBS = cdb/cdb.a
