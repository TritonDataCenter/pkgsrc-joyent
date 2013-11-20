$NetBSD$

Add support for NetBSD.

--- common.gypi.orig	2013-11-12 20:22:12.000000000 +0000
+++ common.gypi
@@ -159,7 +159,7 @@
           'BUILDING_UV_SHARED=1',
         ],
       }],
-      [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris"', {
+      [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" or OS=="netbsd"', {
         'cflags': [ '-Wall', '-Wextra', '-Wno-unused-parameter', '-pthread', ],
         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
         'ldflags': [ '-pthread', '-rdynamic' ],
