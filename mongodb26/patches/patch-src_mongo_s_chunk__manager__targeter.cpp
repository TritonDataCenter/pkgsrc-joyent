$NetBSD$

Fix C++11 support.
--- src/mongo/s/chunk_manager_targeter.cpp.orig	2014-04-07 00:36:57.000000000 +0000
+++ src/mongo/s/chunk_manager_targeter.cpp
@@ -48,7 +48,7 @@ namespace mongo {
             *errMsg = ex.toString();
         }
 
-        return config;
+        return config != NULL;
     }
 
     ChunkManagerTargeter::ChunkManagerTargeter() :
