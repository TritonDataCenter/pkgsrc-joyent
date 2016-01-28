$NetBSD: patch-tools_gyp_pylib_gyp_common.py,v 1.1 2013/05/22 15:17:07 mspo Exp $

Add support for NetBSD and DragonFly.
--- tools/gyp/pylib/gyp/common.py.orig	2016-01-21 01:08:27.000000000 +0000
+++ tools/gyp/pylib/gyp/common.py
@@ -425,6 +425,10 @@ def GetFlavor(params):
     return 'freebsd'
   if sys.platform.startswith('openbsd'):
     return 'openbsd'
+  if sys.platform.startswith('netbsd'):
+    return 'netbsd'
+  if sys.platform.startswith('dragonflybsd'):
+    return 'dragonflybsd'
   if sys.platform.startswith('aix'):
     return 'aix'
 
