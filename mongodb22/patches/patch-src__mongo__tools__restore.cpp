$NetBSD$

Backport Boost 1.50.x support based on
https://github.com/mongodb/mongo/commit/b3b1949de30b5dc1bde3d91aa197a8587d17d193
--- src/mongo/tools/restore.cpp.orig	2014-01-12 21:19:10.000000000 +0000
+++ src/mongo/tools/restore.cpp
@@ -229,7 +229,7 @@ public:
         LOG(2) << "drillDown: " << root.string() << endl;
 
         // skip hidden files and directories
-        if (root.leaf()[0] == '.' && root.leaf() != ".")
+        if (root.leaf().string()[0] == '.' && root.leaf().string() != ".")
             return;
 
         if ( is_directory( root ) ) {
@@ -311,7 +311,7 @@ public:
 
         verify( ns.size() );
 
-        string oldCollName = root.leaf(); // Name of the collection that was dumped from
+        string oldCollName = root.leaf().string(); // Name of the collection that was dumped from
         oldCollName = oldCollName.substr( 0 , oldCollName.find_last_of( "." ) );
         if (use_coll) {
             ns += "." + _coll;
@@ -350,7 +350,7 @@ public:
             if (!boost::filesystem::exists(metadataFile.string())) {
                 // This is fine because dumps from before 2.1 won't have a metadata file, just print a warning.
                 // System collections shouldn't have metadata so don't warn if that file is missing.
-                if (!startsWith(metadataFile.leaf(), "system.")) {
+                if (!startsWith(metadataFile.leaf().string(), "system.")) {
                     log() << metadataFile.string() << " not found. Skipping." << endl;
                 }
             } else {
