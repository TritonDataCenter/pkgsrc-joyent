$NetBSD: patch-src_rust-installer_install-template.sh,v 1.1 2016/09/06 10:36:49 jperkin Exp $

Support SunOS.
Fix undefined variable warnings.

--- src/rust-installer/install-template.sh.orig	2016-09-27 07:18:21.000000000 +0000
+++ src/rust-installer/install-template.sh
@@ -352,6 +352,10 @@ get_host_triple() {
             _ostype=apple-darwin
             ;;
 
+	SunOS)
+            _ostype=unknown-solaris
+            ;;
+
 	MINGW*)
             _ostype=pc-windows-gnu
             ;;
