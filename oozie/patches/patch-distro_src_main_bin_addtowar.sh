$NetBSD$

--- distro/src/main/bin/addtowar.sh.orig	2013-01-17 23:39:20.000000000 +0000
+++ distro/src/main/bin/addtowar.sh
@@ -71,7 +71,7 @@ function checkFileDoesNotExist() {
 
 #finds a file under a directory any depth, file returns in variable RET
 function findFile() {
-   RET=`find -H ${1} -name ${2} | grep -e "[0-9.a${hadoopJarsSuffix}].jar"`
+   RET=`find -H ${1} -name ${2} | grep "[0-9.a${hadoopJarsSuffix}].jar"`
    RET=`echo ${RET} | sed "s/ .*//"`
    if [ "${RET}" = "" ]; then
      echo
