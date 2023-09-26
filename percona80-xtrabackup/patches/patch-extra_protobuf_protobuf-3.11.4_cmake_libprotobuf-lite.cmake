$NetBSD$

Don't install libprotobuf-lite.

--- extra/protobuf/protobuf-3.11.4/cmake/libprotobuf-lite.cmake.orig	2020-08-28 21:02:32.000000000 +0000
+++ extra/protobuf/protobuf-3.11.4/cmake/libprotobuf-lite.cmake
@@ -113,8 +113,6 @@ IF(protobuf_BUILD_SHARED_LIBS)
       )
   ENDIF()
 
-  INSTALL_PRIVATE_LIBRARY(libprotobuf-lite)
-
   IF(WITH_ROUTER)
     IF(APPLE OR WIN32)
       INSTALL(TARGETS libprotobuf-lite
