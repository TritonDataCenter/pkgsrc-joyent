$NetBSD$

On Mac OS X, use PkgSrc libtool.

--- cmake/libutils.cmake.orig	2014-11-21 10:02:01.000000000 +0000
+++ cmake/libutils.cmake
@@ -179,7 +179,7 @@ MACRO(MERGE_STATIC_LIBS TARGET OUTPUT_NA
       "${LINKER_EXTRA_FLAGS}")
   ELSE()
     GET_TARGET_PROPERTY(TARGET_LOCATION ${TARGET} LOCATION)  
-    IF(APPLE)
+    IF(0)
       # Use OSX's libtool to merge archives (ihandles universal 
       # binaries properly)
       ADD_CUSTOM_COMMAND(TARGET ${TARGET} POST_BUILD
