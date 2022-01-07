$NetBSD$

Use pkgsrc layout.

--- internal/fs/influx_dir.go.orig	2021-08-13 17:55:41.000000000 +0000
+++ internal/fs/influx_dir.go
@@ -30,7 +30,7 @@ func InfluxDir() (string, error) {
 		}
 		dir = wd
 	}
-	dir = filepath.Join(dir, ".influxdbv2")
+	dir = "@DATADIR@"
 
 	return dir, nil
 }
