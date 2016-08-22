$NetBSD$

Support PKGSRC_USE_SSP (ugly for now).

--- src/libstd/rtdeps.rs.orig	2016-08-16 01:54:35.000000000 +0000
+++ src/libstd/rtdeps.rs
@@ -45,6 +45,8 @@ extern {}
 #[link(name = "socket")]
 #[link(name = "posix4")]
 #[link(name = "pthread")]
+// pkgsrc hack until I can figure out how to pass it through properly
+#[link(name = "ssp")]
 extern {}
 
 // For PNaCl targets, nacl_io is a Pepper wrapper for some IO functions
