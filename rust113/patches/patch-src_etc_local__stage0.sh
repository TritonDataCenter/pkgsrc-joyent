$NetBSD: patch-src_etc_local__stage0.sh,v 1.3 2016/09/13 12:37:08 ryoon Exp $

-Copy additional libarena required on Darwin.
-Copy GCC support libraries required on SunOS.

--- src/etc/local_stage0.sh.orig	2016-11-08 03:16:18.000000000 +0000
+++ src/etc/local_stage0.sh
@@ -18,7 +18,7 @@ LIB_PREFIX=lib
 
 OS=`uname -s`
 case $OS in
-    ("Linux"|"FreeBSD"|"DragonFly"|"Bitrig"|"OpenBSD"|"SunOS"|"Haiku")
+    ("Linux"|"FreeBSD"|"DragonFly"|"Bitrig"|"OpenBSD"|"SunOS"|"Haiku"|"NetBSD")
     BIN_SUF=
     LIB_SUF=.so
     ;;
@@ -71,6 +71,9 @@ cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}log
 cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}rbml*${LIB_SUF} ${TARG_DIR}/stage0/${LIB_DIR}/
 cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}serialize*${LIB_SUF} ${TARG_DIR}/stage0/${LIB_DIR}/
 cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}term*${LIB_SUF} ${TARG_DIR}/stage0/${LIB_DIR}/
+cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}gcc_s*${LIB_SUF}* ${TARG_DIR}/stage0/${LIB_DIR}/
+cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}ssp*${LIB_SUF}* ${TARG_DIR}/stage0/${LIB_DIR}/
+cp ${PREFIX}/${LIB_DIR}/${LIB_PREFIX}stdc++*${LIB_SUF}* ${TARG_DIR}/stage0/${LIB_DIR}/
 
 # do not fail if one of the above fails, as all we need is a working rustc!
 exit 0
