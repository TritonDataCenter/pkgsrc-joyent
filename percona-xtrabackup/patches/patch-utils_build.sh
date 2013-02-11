$NetBSD$

* XXX: disable ssl certs, bzr uses the wrong ones from /etc

--- utils/build.sh.orig	2013-01-17 20:25:28.000000000 +0000
+++ utils/build.sh
@@ -320,6 +320,7 @@ case "$type" in
 	    bzr pull --overwrite
 	else
 	    bzr branch -r tag:Percona-Server-$PS_55_VERSION \
+		-Ossl.cert_reqs=none \
 		lp:percona-server $branch_dir
 	    cd $branch_dir
 	fi
