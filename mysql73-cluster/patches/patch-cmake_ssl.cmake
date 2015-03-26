$NetBSD$

--- cmake/ssl.cmake.orig	2014-07-02 09:22:14.000000000 +0000
+++ cmake/ssl.cmake
@@ -166,7 +166,7 @@ MACRO (MYSQL_CHECK_SSL)
     # Encoded as MNNFFPPS: major minor fix patch status
     FILE(STRINGS "${OPENSSL_INCLUDE_DIR}/openssl/opensslv.h"
       OPENSSL_VERSION_NUMBER
-      REGEX "^#define[\t ]+OPENSSL_VERSION_NUMBER[\t ]+0x[0-9].*"
+      REGEX "^# *define[\t ]+OPENSSL_VERSION_NUMBER[\t ]+0x[0-9].*"
     )
     STRING(REGEX REPLACE
       "^.*OPENSSL_VERSION_NUMBER[\t ]+0x([0-9]).*$" "\\1"
