$NetBSD$

Add support for NetBSD and DragonFly.
--- tools/gyp/pylib/gyp/generator/make.py.orig	2013-11-12 20:22:12.000000000 +0000
+++ tools/gyp/pylib/gyp/generator/make.py
@@ -1999,7 +1999,7 @@ def GenerateOutput(target_list, target_d
         'flock': './gyp-flock-tool flock',
         'flock_index': 2,
     })
-  elif flavor == 'freebsd':
+  elif flavor == 'freebsd' or flavor == 'dragonflybsd' or flavor == 'netbsd':
     # Note: OpenBSD has sysutils/flock. lockf seems to be FreeBSD specific.
     header_params.update({
         'flock': 'lockf',
