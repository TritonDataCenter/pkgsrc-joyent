$NetBSD$

Backport Boost 1.50.x support based on
https://github.com/mongodb/mongo/commit/b3b1949de30b5dc1bde3d91aa197a8587d17d193
--- src/mongo/db/pdfile.cpp.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/db/pdfile.cpp
@@ -147,7 +147,7 @@ namespace mongo {
 #ifdef _WIN32
     string dbpath = "\\data\\db\\";
 #else
-    string dbpath = "/data/db/";
+    string dbpath = "/var/mongodb/";
 #endif
     const char FREELIST_NS[] = ".$freelist";
     bool directoryperdb = false;
@@ -1736,7 +1736,7 @@ namespace mongo {
             virtual bool apply( const Path &p ) {
                 if ( !boost::filesystem::exists( p ) )
                     return false;
-                boostRenameWrapper( p, newPath_ / ( p.leaf() + ".bak" ) );
+                boostRenameWrapper( p, newPath_ / ( p.leaf().string() + ".bak" ) );
                 return true;
             }
             virtual const char * op() const {
@@ -1844,7 +1844,7 @@ namespace mongo {
             uniqueReservedPath( ( preserveClonedFilesOnFailure || backupOriginalFiles ) ?
                                 "backup" : "_tmp" );
         MONGO_ASSERT_ON_EXCEPTION( boost::filesystem::create_directory( reservedPath ) );
-        string reservedPathString = reservedPath.native_directory_string();
+        string reservedPathString = reservedPath.string();
 
         bool res;
         {
