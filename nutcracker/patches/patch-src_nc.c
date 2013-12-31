$NetBSD$

Set default paths.
--- src/nc.c.orig	2013-04-18 11:33:03.000000000 +0000
+++ src/nc.c
@@ -28,12 +28,12 @@
 #include <nc_conf.h>
 #include <nc_signal.h>
 
-#define NC_CONF_PATH        "conf/nutcracker.yml"
+#define NC_CONF_PATH        "@PKG_SYSCONFDIR@/nutcracker.yml"
 
 #define NC_LOG_DEFAULT      LOG_NOTICE
 #define NC_LOG_MIN          LOG_EMERG
 #define NC_LOG_MAX          LOG_PVERB
-#define NC_LOG_PATH         NULL
+#define NC_LOG_PATH         "@NUTC_LOG_DIR@/nutcracker.log"
 
 #define NC_STATS_PORT       STATS_PORT
 #define NC_STATS_ADDR       STATS_ADDR
