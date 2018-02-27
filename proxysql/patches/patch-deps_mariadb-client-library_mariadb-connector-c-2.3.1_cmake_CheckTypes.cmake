$NetBSD$

libsocket needed on SunOS.

--- deps/mariadb-client-library/mariadb-connector-c-2.3.1/cmake/CheckTypes.cmake.orig	2016-08-03 15:39:12.000000000 +0000
+++ deps/mariadb-client-library/mariadb-connector-c-2.3.1/cmake/CheckTypes.cmake
@@ -98,6 +98,7 @@ IF(WIN32)
 ELSE(WIN32)
   FOREACH(CHECK_TYPE "socklen_t" "size_t" "int")
     IF (NOT SOCKET_SIZE_TYPE)
+      SET(CMAKE_REQUIRED_LIBRARIES "${LIBSOCKET}")
       CHECK_C_SOURCE_COMPILES("
         #include <sys/socket.h>
         int main(int argc, char **argv)
