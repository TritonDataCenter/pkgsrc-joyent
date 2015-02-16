$NetBSD: patch-common.gypi,v 1.1 2013/05/22 15:17:07 mspo Exp $

Add support for NetBSD.

--- common.gypi.orig	2015-02-06 20:04:23.000000000 +0000
+++ common.gypi
@@ -167,11 +167,11 @@
           'BUILDING_UV_SHARED=1',
         ],
       }],
-      [ 'OS in "linux freebsd openbsd solaris"', {
+      [ 'OS in "linux freebsd openbsd netbsd solaris"', {
         'cflags': [ '-pthread', ],
         'ldflags': [ '-pthread' ],
       }],
-      [ 'OS in "linux freebsd openbsd solaris android"', {
+      [ 'OS in "linux freebsd openbsd netbsd solaris android"', {
         'cflags': [ '-Wall', '-Wextra', '-Wno-unused-parameter', ],
         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
         'ldflags': [ '-rdynamic' ],
