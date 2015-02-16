$NetBSD: patch-tools_install.py,v 1.1 2013/05/22 15:17:07 mspo Exp $

Install man pages under the right directory.

--- tools/install.py.orig	2015-02-06 20:04:23.000000000 +0000
+++ tools/install.py
@@ -138,7 +138,7 @@ def files(action):
   if 'freebsd' in sys.platform or 'openbsd' in sys.platform:
     action(['doc/node.1'], 'man/man1/')
   else:
-    action(['doc/node.1'], 'share/man/man1/')
+    action(['doc/node.1'], '@PKGMANDIR@/man1/')
 
   if 'true' == variables.get('node_install_npm'): npm_files(action)
 
