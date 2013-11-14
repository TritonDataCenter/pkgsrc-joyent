$NetBSD$

Add support for NetBSD.
--- deps/cares/cares.gyp.orig	2013-11-12 20:22:12.000000000 +0000
+++ deps/cares/cares.gyp
@@ -140,6 +140,10 @@
           'include_dirs': [ 'config/freebsd' ],
           'sources': [ 'config/freebsd/ares_config.h' ]
         }],
+        [ 'OS=="netbsd"', {
+          'include_dirs': [ 'config/netbsd' ],
+          'sources': [ 'config/netbsd/ares_config.h' ]
+        }],
         [ 'OS=="openbsd"', {
           'include_dirs': [ 'config/openbsd' ],
           'sources': [ 'config/openbsd/ares_config.h' ]
