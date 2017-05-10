$NetBSD$

libwrap patch from https://bugs.mysql.com/bug.php?id=84495

--- configure.cmake.orig	2017-04-12 09:57:48.000000000 +0000
+++ configure.cmake
@@ -376,6 +376,20 @@ IF(UNIX)
       hosts_access(0);
     }"
     HAVE_LIBWRAP)
+
+    IF(HAVE_LIBWRAP)
+      CHECK_CXX_SOURCE_COMPILES(
+      "
+      #include <tcpd.h>
+      int main()
+      {
+        struct request_info req;
+        if (req.sink)
+          (req.sink)(req.fd);
+      }"
+      HAVE_LIBWRAP_PROTOTYPES)
+    ENDIF()
+
     SET(CMAKE_REQUIRED_LIBRARIES ${SAVE_CMAKE_REQUIRED_LIBRARIES})
     IF(HAVE_LIBWRAP)
       SET(LIBWRAP "wrap")
