$NetBSD$

Don't install libprotobuf.

--- extra/protobuf/protobuf-3.11.4/cmake/libprotobuf.cmake.orig	2020-08-28 21:02:32.000000000 +0000
+++ extra/protobuf/protobuf-3.11.4/cmake/libprotobuf.cmake
@@ -166,6 +166,4 @@ IF(protobuf_BUILD_SHARED_LIBS)
       )
   ENDIF()
 
-  INSTALL_PRIVATE_LIBRARY(libprotobuf)
-
 ENDIF()
