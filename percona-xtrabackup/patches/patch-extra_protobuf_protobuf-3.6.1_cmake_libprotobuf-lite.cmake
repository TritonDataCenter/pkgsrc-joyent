$NetBSD$

Don't install libprotobuf-lite.

--- extra/protobuf/protobuf-3.6.1/cmake/libprotobuf-lite.cmake.orig	2019-12-14 16:07:34.000000000 +0000
+++ extra/protobuf/protobuf-3.6.1/cmake/libprotobuf-lite.cmake
@@ -93,7 +93,7 @@ IF(protobuf_BUILD_SHARED_LIBS)
       )
   ENDIF()
 
-  INSTALL_PRIVATE_LIBRARY(libprotobuf-lite)
+  #INSTALL_PRIVATE_LIBRARY(libprotobuf-lite)
 
   IF(WITH_ROUTER)
     IF(APPLE OR WIN32)
