$NetBSD$

Don't install libprotobuf.

--- extra/protobuf/protobuf-3.6.1/cmake/libprotobuf.cmake.orig	2019-12-14 16:07:34.000000000 +0000
+++ extra/protobuf/protobuf-3.6.1/cmake/libprotobuf.cmake
@@ -159,6 +159,6 @@ IF(protobuf_BUILD_SHARED_LIBS)
       )
   ENDIF()
 
-  INSTALL_PRIVATE_LIBRARY(libprotobuf)
+  #INSTALL_PRIVATE_LIBRARY(libprotobuf)
 
 ENDIF()
