$NetBSD$

SunOS needs socket libraries.
cgo needs math library for pkg-config linking

--- ../github.com/influxdata/flux@v0.139.0/libflux/go/libflux/link_dynamic.go.orig	1979-12-31 00:00:00.000000000 +0000
+++ ../github.com/influxdata/flux@v0.139.0/libflux/go/libflux/link_dynamic.go
@@ -3,4 +3,5 @@
 package libflux
 
 // #cgo pkg-config: flux
+// #cgo solaris LDFLAGS: -lsocket -lnsl -lm
 import "C"
