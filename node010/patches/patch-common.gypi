$NetBSD: patch-common.gypi,v 1.1 2013/05/22 15:17:07 mspo Exp $

Add support for NetBSD.

--- common.gypi.orig	2016-09-27 16:20:44.000000000 +0000
+++ common.gypi
@@ -177,7 +177,7 @@
           'BUILDING_UV_SHARED=1',
         ],
       }],
-      [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris"', {
+      [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" or OS=="netbsd"', {
         'cflags': [ '-Wall', '-Wextra', '-Wno-unused-parameter', '-pthread', ],
         'cflags_cc': [
           '-fno-delete-null-pointer-checks',
