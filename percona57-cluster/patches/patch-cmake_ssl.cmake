$NetBSD$

Avoid broken Solaris flags.

--- cmake/ssl.cmake.orig	2022-02-07 19:58:20.000000000 +0000
+++ cmake/ssl.cmake
@@ -196,7 +196,7 @@ MACRO (MYSQL_CHECK_SSL)
     IF("${OPENSSL_VERSION}" VERSION_GREATER "1.1.0")
        ADD_DEFINITIONS(-DHAVE_TLSv13)
        SET(HAVE_TLSv13 1)
-       IF(SOLARIS)
+       IF(notSOLARIS)
          SET(FORCE_SSL_SOLARIS "-Wl,--undefined,address_of_sk_new_null")
        ENDIF()
     ENDIF()
