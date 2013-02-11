$NetBSD$

--- src/scripts/create-tool-scripts.sh.orig	2012-08-14 11:21:53.000000000 +0000
+++ src/scripts/create-tool-scripts.sh
@@ -76,6 +76,7 @@ for p in $subprograms; do
   target="${outdir}/sqoop-${p}"
   cp "${template}" "${target}"
   chmod +x "${target}"
-  sed -i -e "s/SUBCOMMANDMARKER/$p/" "${target}"
+  sed -e "s/SUBCOMMANDMARKER/$p/" "${target}" > "${target}.tmp" && \
+    mv "${target}.tmp" "${target}"
 done
 
