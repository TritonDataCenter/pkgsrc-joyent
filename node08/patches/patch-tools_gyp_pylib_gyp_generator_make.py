$NetBSD$

detects NetBSD.

--- tools/gyp/pylib/gyp/generator/make.py.orig	2013-03-01 15:57:34.000000000 +0900
+++ tools/gyp/pylib/gyp/generator/make.py	2013-03-01 15:57:46.000000000 +0900
@@ -1995,6 +1995,10 @@
     header_params.update({
         'flock': 'lockf',
     })
+  elif flavor == 'netbsd':
+    header_params.update({
+        'flock': 'lockf',
+    })
 
   header_params.update(RunSystemTests(flavor))
   header_params.update({
