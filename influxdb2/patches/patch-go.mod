$NetBSD$

Upgrade some required modules for upstream fixes.  Generated with:

  ${GO} mod edit --replace=<pkg>=<pkg>@vN
  ${GO} mod download <pkg>@vN

--- go.mod.orig	2021-08-13 17:55:41.000000000 +0000
+++ go.mod
@@ -3,6 +3,7 @@ module github.com/influxdata/influxdb/v2
 go 1.16
 
 require (
+	github.com/AlecAivazis/survey/v2 v2.2.9 // indirect
 	github.com/BurntSushi/toml v0.3.1
 	github.com/NYTimes/gziphandler v1.0.1
 	github.com/RoaringBitmap/roaring v0.4.16
@@ -111,3 +112,9 @@ require (
 replace github.com/apache/arrow/go/arrow v0.0.0-20191024131854-af6fa24be0db => github.com/influxdata/arrow/go/arrow v0.0.0-20200917142114-986e413c1705
 
 replace github.com/nats-io/nats-streaming-server v0.11.2 => github.com/influxdata/nats-streaming-server v0.11.3-0.20201112040610-c277f7560803
+
+replace github.com/pkg/term => github.com/pkg/term v1.1.0
+
+replace github.com/mattn/go-tty => github.com/mattn/go-tty v0.0.3
+
+replace github.com/AlecAivazis/survey/v2 => github.com/jperkin/survey/v2 v2.3.2-0.20210901161554-6b4ea175889c
