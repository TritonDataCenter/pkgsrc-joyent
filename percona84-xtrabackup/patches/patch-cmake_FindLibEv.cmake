$NetBSD$

Help cmake find libev.

--- cmake/FindLibEv.cmake.orig	2019-12-14 16:07:34.000000000 +0000
+++ cmake/FindLibEv.cmake
@@ -19,13 +19,16 @@
 #  LIBEV_FOUND, If false, do not try to use ant
 
 find_path(LIBEV_INCLUDE_DIRS ev.h PATHS
+    ${LIBEV_INCLUDE_PATHS}
     /usr/include
     /usr/local/include
     /opt/local/include
     /usr/include/libev
   )
 
-set(LIBEV_LIB_PATHS /usr/lib /usr/local/lib /opt/local/lib)
+if (NOT LIBEV_LIB_PATHS)
+  set(LIBEV_LIB_PATHS /usr/lib /usr/local/lib /opt/local/lib)
+endif()
 find_library(LIBEV_LIB NAMES ev PATHS ${LIBEV_LIB_PATHS})
 
 if (LIBEV_LIB AND LIBEV_INCLUDE_DIRS)
