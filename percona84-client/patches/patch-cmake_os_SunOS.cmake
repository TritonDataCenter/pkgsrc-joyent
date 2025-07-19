$NetBSD$

Remove clearly bogus fatal error.

--- cmake/os/SunOS.cmake.orig	2022-02-28 19:55:41.000000000 +0000
+++ cmake/os/SunOS.cmake
@@ -27,8 +27,6 @@ INCLUDE(CheckCXXSourceCompiles)
 
 IF(CMAKE_SYSTEM_PROCESSOR MATCHES "sparc")
   SET(SOLARIS_SPARC 1)
-ELSE()
-  MESSAGE(FATAL_ERROR "Solaris on Intel is not supported.")
 ENDIF()
 
 IF("${CMAKE_C_FLAGS}${CMAKE_CXX_FLAGS}" MATCHES "-m32")
