$NetBSD$

Enable DTrace.
Attempt to fix SSL, does not work as yet.

--- utils/build.sh.orig	2014-01-23 14:59:36.000000000 +0000
+++ utils/build.sh
@@ -315,7 +315,7 @@ case "$type" in
 		-DWITH_PARTITION_STORAGE_ENGINE=ON \
 		-DWITH_ZLIB=bundled \
 		-DWITH_EXTRA_CHARSETS=all \
-		-DENABLE_DTRACE=OFF $extra_config_55plus"
+		-DENABLE_DTRACE=ON $extra_config_55plus"
 
 	build_all $type
 	;;
@@ -332,7 +332,8 @@ case "$type" in
                 -DWITH_ZLIB=bundled \
                 -DWITH_EXTRA_CHARSETS=all \
                 -DWITH_EMBEDDED_SERVER=1 \
-                -DENABLE_DTRACE=OFF $extra_config_55plus"
+                -DWITH_SSL=system \
+                -DENABLE_DTRACE=ON $extra_config_55plus"
         build_all $type
         ;;
 
@@ -370,7 +371,7 @@ case "$type" in
 		-DWITH_PARTITION_STORAGE_ENGINE=ON \
 		-DWITH_ZLIB=bundled \
 		-DWITH_EXTRA_CHARSETS=all \
-		-DENABLE_DTRACE=OFF $extra_config_55plus"
+		-DENABLE_DTRACE=ON $extra_config_55plus"
 	if [ "`uname -s`" = "Linux" ]
 	then
 		configure_cmd="LIBS=-lrt $configure_cmd"
