$NetBSD$

Disable Solaris section, we don't want mtmalloc (we use libumem) and
the rest is just Studio-specific.

--- cmake/build_configurations/compiler_options.cmake.orig	2020-04-17 13:14:42.000000000 +0000
+++ cmake/build_configurations/compiler_options.cmake
@@ -72,7 +72,7 @@ IF(UNIX)
   ENDIF()
 
   # Solaris flags
-  IF(SOLARIS)
+  IF(notSOLARIS)
     # Link mysqld with mtmalloc on Solaris 10 and later
     SET(WITH_MYSQLD_LDFLAGS "-lmtmalloc" CACHE STRING "")
 
