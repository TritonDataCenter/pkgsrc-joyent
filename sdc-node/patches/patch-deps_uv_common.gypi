$NetBSD$

Add support for NetBSD.

--- deps/uv/common.gypi.orig	2013-04-11 16:39:16.000000000 +0000
+++ deps/uv/common.gypi
@@ -129,7 +129,7 @@
           }]
         ]
       }],
-      [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris"', {
+      [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" OR OS=="netbsd"', {
         'cflags': [ '-Wall' ],
         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
         'target_conditions': [
