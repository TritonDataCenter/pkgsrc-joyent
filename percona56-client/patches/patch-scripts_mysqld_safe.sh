$NetBSD: patch-scripts_mysqld_safe.sh,v 1.1 2013/02/13 21:00:06 adam Exp $

--- scripts/mysqld_safe.sh.orig	2014-11-21 10:02:01.000000000 +0000
+++ scripts/mysqld_safe.sh
@@ -807,7 +807,7 @@ fi
 # Alternatively, you can start mysqld with the "myisam-recover" option. See
 # the manual for details.
 #
-# echo "Checking tables in $DATADIR"
+# log_notice "Checking tables in $DATADIR"
 # $MY_BASEDIR_VERSION/bin/myisamchk --silent --force --fast --medium-check $DATADIR/*/*.MYI
 # $MY_BASEDIR_VERSION/bin/isamchk --silent --force $DATADIR/*/*.ISM
 
