$NetBSD$

Use illumos-patched nats-server.
Upgrade gopsutil to get illumos fixes.

--- go.mod.orig	2022-02-16 20:34:52.000000000 +0000
+++ go.mod
@@ -375,3 +375,7 @@ replace github.com/cisco-ie/nx-telemetry
 
 // replaced due to open PR updating protobuf https://github.com/riemann/riemann-go-client/pull/27
 replace github.com/riemann/riemann-go-client => github.com/dstrand1/riemann-go-client v0.5.1-0.20211028194734-b5eb11fb5754
+
+replace github.com/nats-io/nats-server/v2 => github.com/jperkin/nats-server/v2 v2.7.3-0.20220228185757-7d43c51ba2f0
+
+replace github.com/shirou/gopsutil/v3 => github.com/shirou/gopsutil/v3 v3.22.2
