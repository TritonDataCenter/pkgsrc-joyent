$NetBSD$

SunOS also needs to link the OpenSSL libs.

--- vendor/src/github.com/spacemonkeygo/openssl/build.go.orig	2015-04-01 22:40:18.000000000 +0000
+++ vendor/src/github.com/spacemonkeygo/openssl/build.go
@@ -19,4 +19,5 @@ package openssl
 // #cgo linux pkg-config: openssl
 // #cgo windows CFLAGS: -DWIN32_LEAN_AND_MEAN
 // #cgo darwin LDFLAGS: -lssl -lcrypto
+// #cgo solaris LDFLAGS: -lssl -lcrypto
 import "C"
