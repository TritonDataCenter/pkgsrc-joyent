$NetBSD$

Fix build on NetBSD.

--- deps/cares/common.gypi.orig	2015-02-06 20:04:23.000000000 +0000
+++ deps/cares/common.gypi
@@ -137,7 +137,7 @@
         ],
       }],
 
-      [ 'OS in "linux freebsd openbsd solaris android"', {
+      [ 'OS in "linux freebsd openbsd netbsd solaris android"', {
         'variables': {
           'gcc_version%': '<!(python build/gcc_version.py)>)'
         },
