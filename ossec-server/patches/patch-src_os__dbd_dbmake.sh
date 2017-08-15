$NetBSD$

Let us control MySQL & PostgreSQL support.
--- src/os_dbd/dbmake.sh.orig	2017-08-09 12:15:46.000000000 +0000
+++ src/os_dbd/dbmake.sh
@@ -7,7 +7,7 @@ PL=""
 
 # Look for MySQL
 ls "`which mysql 2>/dev/null`" > /dev/null 2>&1
-if [ $? = 0 ]; then
+if [ "X$ENABLE_MYSQL" = "X1" ]; then
     # Check if mysql_config is installed to use it
     mysql_config --port > /dev/null 2>&1
     if [ $? = 0 ]; then
@@ -44,7 +44,7 @@ fi
 
 # Look for PostgreSQL
 ls "`which psql 2>/dev/null`" > /dev/null 2>&1
-if [ $? = 0 ]; then
+if [ "X$ENABLE_PGSQL" = "X1" ]; then
     # Check if pg_config is installed to use it
     pg_config --version > /dev/null 2>&1
     if [ $? = 0 ]; then
