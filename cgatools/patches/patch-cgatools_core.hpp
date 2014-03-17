$NetBSD$

Support BOOST_FILESYSTEM_VERSION=3

--- cgatools/core.hpp.orig	2013-08-28 22:35:18.000000000 +0000
+++ cgatools/core.hpp
@@ -43,7 +43,7 @@
 // Use version 2 of the Boost Filesystem library.
 // This stopped being the default as of Boost 1.44 and
 // will no longer be supported in Boost 1.48.
-#define BOOST_FILESYSTEM_VERSION 2
+#define BOOST_FILESYSTEM_VERSION 3
 
 #include <boost/cstdint.hpp>
 #include <limits>
