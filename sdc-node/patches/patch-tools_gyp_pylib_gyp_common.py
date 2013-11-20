$NetBSD$

Add support for NetBSD and DragonFly.
--- tools/gyp/pylib/gyp/common.py.orig	2013-11-12 20:22:12.000000000 +0000
+++ tools/gyp/pylib/gyp/common.py
@@ -409,6 +409,10 @@ def GetFlavor(params):
     return 'freebsd'
   if sys.platform.startswith('openbsd'):
     return 'openbsd'
+  if sys.platform.startswith('netbsd'):
+    return 'netbsd'
+  if sys.platform.startswith('dragonflybsd'):
+    return 'dragonflybsd'
   if sys.platform.startswith('aix'):
     return 'aix'
 
