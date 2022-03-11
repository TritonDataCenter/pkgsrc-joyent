$NetBSD$

Avoid modbus, does not build on illumos.

--- plugins/inputs/all/all.go.orig	2022-02-16 20:34:52.000000000 +0000
+++ plugins/inputs/all/all.go
@@ -110,7 +110,7 @@ import (
 	_ "github.com/influxdata/telegraf/plugins/inputs/memcached"
 	_ "github.com/influxdata/telegraf/plugins/inputs/mesos"
 	_ "github.com/influxdata/telegraf/plugins/inputs/minecraft"
-	_ "github.com/influxdata/telegraf/plugins/inputs/modbus"
+	//_ "github.com/influxdata/telegraf/plugins/inputs/modbus"
 	_ "github.com/influxdata/telegraf/plugins/inputs/mongodb"
 	_ "github.com/influxdata/telegraf/plugins/inputs/monit"
 	_ "github.com/influxdata/telegraf/plugins/inputs/mqtt_consumer"
