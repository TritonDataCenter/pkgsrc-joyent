$NetBSD$

Fix portability.

--- garb/files/freebsd/garb.sh.orig	2014-03-27 15:49:30.000000000 +0000
+++ garb/files/freebsd/garb.sh
@@ -70,7 +70,7 @@ garb_prestart()
 		PORT=${PORT:-$GALERA_PORT}
 		nc -z $HOST $PORT >/dev/null 2>&1 && break
 	done
-	[ ${ADDRESS} == "0" ] && err 1 "None of the nodes in $garb_galera_nodes is accessible"
+	[ ${ADDRESS} = "0" ] && err 1 "None of the nodes in $garb_galera_nodes is accessible"
 
 	command_args="$command_args -a gcomm://$ADDRESS"
 	[ -n "$garb_galera_group" ]   && command_args="$command_args -g $garb_galera_group"
