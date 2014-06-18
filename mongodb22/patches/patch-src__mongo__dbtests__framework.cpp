$NetBSD$

Backport Boost 1.50.x support based on
https://github.com/mongodb/mongo/commit/b3b1949de30b5dc1bde3d91aa197a8587d17d193
--- src/mongo/dbtests/framework.cpp.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/dbtests/framework.cpp
@@ -199,7 +199,7 @@ namespace mongo {
                 boost::filesystem::create_directory(p);
             }
 
-            string dbpathString = p.native_directory_string();
+            string dbpathString = p.string();
             dbpath = dbpathString.c_str();
 
             cmdLine.prealloc = false;
