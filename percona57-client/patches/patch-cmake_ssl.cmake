$NetBSD$

Remove bogus Solaris section.

--- cmake/ssl.cmake.orig	2022-03-28 10:58:37.000000000 +0000
+++ cmake/ssl.cmake
@@ -221,7 +221,7 @@ MACRO (MYSQL_CHECK_SSL)
     IF("${OPENSSL_VERSION}" VERSION_GREATER "1.1.0")
        ADD_DEFINITIONS(-DHAVE_TLSv13)
        SET(HAVE_TLSv13 1)
-       IF(SOLARIS)
+       IF(notSOLARIS)
          SET(FORCE_SSL_SOLARIS "-Wl,--undefined,address_of_sk_new_null")
        ENDIF()
     ENDIF()
