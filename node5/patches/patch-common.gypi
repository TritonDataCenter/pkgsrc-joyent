$NetBSD: patch-common.gypi,v 1.4 2015/09/17 10:42:34 fhajny Exp $

Add support for NetBSD.

--- common.gypi.orig	2016-01-21 01:08:17.000000000 +0000
+++ common.gypi
@@ -224,7 +224,7 @@
         'cflags': [ '-pthread', ],
         'ldflags': [ '-pthread' ],
       }],
-      [ 'OS in "linux freebsd openbsd solaris android aix"', {
+      [ 'OS in "linux freebsd openbsd solaris android aix netbsd"', {
         'cflags': [ '-Wall', '-Wextra', '-Wno-unused-parameter', ],
         'cflags_cc': [ '-fno-rtti', '-fno-exceptions', '-std=gnu++0x' ],
         'ldflags': [ '-rdynamic' ],
