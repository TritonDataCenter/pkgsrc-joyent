$NetBSD$

Fix DTrace handling typo.

--- cmake/dtrace.cmake.orig	2016-06-30 06:22:11.000000000 +0000
+++ cmake/dtrace.cmake
@@ -19,7 +19,7 @@ MACRO(CHECK_DTRACE)
  MARK_AS_ADVANCED(DTRACE)
 
  # On FreeBSD, dtrace does not handle userland tracing yet
- IF(ENABLE_DTRACE AND NOT CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+ IF(ENABLE_DTRACE AND CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
    MESSAGE(FATAL_ERROR "dtrace is not supported on this system")
  ENDIF()
 
