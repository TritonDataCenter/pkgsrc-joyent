$NetBSD$

Fix C++11 support.
--- src/mongo/db/exec/working_set.cpp.orig	2014-04-07 00:36:57.000000000 +0000
+++ src/mongo/db/exec/working_set.cpp
@@ -119,7 +119,7 @@ namespace mongo {
     }
 
     bool WorkingSetMember::hasComputed(const WorkingSetComputedDataType type) const {
-        return _computed[type];
+        return _computed[type] != NULL;
     }
 
     const WorkingSetComputedData* WorkingSetMember::getComputed(const WorkingSetComputedDataType type) const {
