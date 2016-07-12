$NetBSD$

Support SunOS.  Hack to enforce current latest snapshot.

--- src/etc/snapshot.py.orig	2016-03-03 01:03:46.000000000 +0000
+++ src/etc/snapshot.py
@@ -109,6 +109,8 @@ def get_kernel(triple):
         return "netbsd"
     if os_name == "openbsd":
         return "openbsd"
+    if os_name == "solaris":
+        return "solaris"
     return "linux"
 
 
@@ -200,8 +202,10 @@ def get_winnt_runtime_deps(platform):
 def make_snapshot(stage, triple):
     kernel = get_kernel(triple)
     platform = get_platform(triple)
-    rev = local_rev_short_sha()
-    date = local_rev_committer_date().split()[0]
+    #rev = local_rev_short_sha()
+    #date = local_rev_committer_date().split()[0]
+    rev = "4d3eebf"
+    date = "2016-02-17"
 
     file0 = partial_snapshot_name(date, rev, platform)
 
