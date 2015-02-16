$NetBSD: patch-deps_uv_common.gypi,v 1.1 2013/05/22 15:17:07 mspo Exp $

Add support for NetBSD.

--- deps/uv/common.gypi.orig	2015-02-06 20:04:23.000000000 +0000
+++ deps/uv/common.gypi
@@ -130,7 +130,7 @@
           }]
         ]
       }],
-      ['OS in "freebsd linux openbsd solaris android"', {
+      ['OS in "freebsd linux openbsd netbsd solaris android"', {
         'cflags': [ '-Wall' ],
         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
         'target_conditions': [
