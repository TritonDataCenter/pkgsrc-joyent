$NetBSD$

Backport Boost 1.50.x support based on
https://github.com/mongodb/mongo/commit/b3b1949de30b5dc1bde3d91aa197a8587d17d193
--- src/mongo/pch.h.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/pch.h
@@ -44,7 +44,7 @@
 #include "string.h"
 #include "limits.h"
 
-#define BOOST_FILESYSTEM_VERSION 2
+#define BOOST_FILESYSTEM_VERSION 3
 #include <boost/shared_ptr.hpp>
 #include <boost/smart_ptr.hpp>
 #include <boost/function.hpp>
