$NetBSD$

Backport Boost 1.50.x support based on
https://github.com/mongodb/mongo/commit/b3b1949de30b5dc1bde3d91aa197a8587d17d193
--- src/mongo/db/dur.cpp.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/db/dur.cpp
@@ -779,7 +779,7 @@ namespace mongo {
 
             bool samePartition = true;
             try {
-                const string dbpathDir = boost::filesystem::path(dbpath).native_directory_string();
+                const string dbpathDir = boost::filesystem::path(dbpath).string();
                 samePartition = onSamePartition(getJournalDir().string(), dbpathDir);
             }
             catch(...) {
