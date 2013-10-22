$NetBSD: patch-cmake_ssl.cmake,v 1.2 2013/04/20 08:06:01 adam Exp $

Allow OpenSSH versions below 1.0.
Do not prefer static libraries (or linking will fail).

--- cmake/ssl.cmake.orig	2013-06-26 20:38:20.000000000 +0000
+++ cmake/ssl.cmake
@@ -143,9 +143,7 @@ MACRO (MYSQL_CHECK_SSL)
     ENDIF()
 
     # On mac this list is <.dylib;.so;.a>
-    # We prefer static libraries, so we revert it here.
     IF (WITH_SSL_PATH)
-      LIST(REVERSE CMAKE_FIND_LIBRARY_SUFFIXES)
       MESSAGE(STATUS "suffixes <${CMAKE_FIND_LIBRARY_SUFFIXES}>")
     ENDIF()
     FIND_LIBRARY(OPENSSL_LIBRARY
