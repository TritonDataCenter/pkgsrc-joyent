$NetBSD$

Help cmake find libev.

--- cmake/FindLibEv.cmake.orig	2016-03-29 11:27:21.000000000 +0000
+++ cmake/FindLibEv.cmake
@@ -23,9 +23,12 @@ find_path(LIBEV_INCLUDE_DIRS ev.h PATHS
     /usr/local/include
     /opt/local/include
     /usr/include/libev
+    ${LIBEV_INCLUDE_PATHS}
   )
 
-set(LIBEV_LIB_PATHS /usr/lib /usr/local/lib /opt/local/lib)
+if (NOT LIBEV_LIB_PATHS)
+  set(LIBEV_LIB_PATHS /usr/lib /usr/local/lib /opt/local/lib)
+endif ()
 find_library(LIBEV_LIB NAMES ev PATHS ${LIBEV_LIB_PATHS})
 
 if (LIBEV_LIB AND LIBEV_INCLUDE_DIRS)
