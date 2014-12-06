$NetBSD$

Let us control MySQL & PostgreSQL support.
--- src/os_dbd/dbmake.sh.orig	2014-09-09 02:03:23.000000000 +0000
+++ src/os_dbd/dbmake.sh
@@ -9,7 +9,7 @@ PL=""
 
 # Looking for mysql
 ls "`which mysql 2>/dev/null`" > /dev/null 2>&1
-if [ $? = 0 ]; then
+if [ "X$ENABLE_MYSQL" = "X1" ]; then
     
     # Checking if mysql_config is installed to use it.
     mysql_config --port > /dev/null 2>&1
@@ -49,7 +49,7 @@ fi
 
 # Looking for postgresql
 ls "`which psql 2>/dev/null`" > /dev/null 2>&1
-if [ $? = 0 ]; then
+if [ "X$ENABLE_PGSQL" = "X1" ]; then
 
     # Checking if pg_config is installed to use it.
     pg_config --version > /dev/null 2>&1
