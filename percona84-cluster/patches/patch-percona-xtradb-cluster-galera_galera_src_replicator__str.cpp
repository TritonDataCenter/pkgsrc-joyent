$NetBSD$

Avoid strndup() on a NULL pointer.

--- percona-xtradb-cluster-galera/galera/src/replicator_str.cpp.orig	2020-12-23 17:43:52.000000000 +0000
+++ percona-xtradb-cluster-galera/galera/src/replicator_str.cpp
@@ -443,10 +443,14 @@ void ReplicatorSMM::process_state_req(vo
     //                          streq->sst_len());
     // have to resort to C ways.
 
-    char* const tmp(strndup(static_cast<const char*>(streq->sst_req()),
-                            streq->sst_len()));
-    std::string const req_str(tmp);
-    free (tmp);
+    std::string req_str;
+
+    if (streq->sst_len()) {
+        char* const tmp(strndup(reinterpret_cast<const char*>(streq->sst_req()),
+                                streq->sst_len()));
+        req_str.assign(tmp);
+        free (tmp);
+    }
 
     bool const trivial_sst(sst_is_trivial(streq->sst_req(), streq->sst_len()));
     bool const skip_sst(trivial_sst
