$NetBSD$

Fix check-portability.

--- scripts/mysqld_safe.sh.orig	2014-11-25 06:30:35.000000000 +0000
+++ scripts/mysqld_safe.sh
@@ -204,7 +204,7 @@ wsrep_pick_url() {
     nc -z "$host" $port >/dev/null && break
   done
 
-  if [ "$url" == "0" ]; then
+  if [ "$url" = "0" ]; then
     log_error "ERROR: none of the URLs in '$@' is reachable."
     return 1
   fi
