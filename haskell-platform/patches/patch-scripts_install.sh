$NetBSD$
 
Add support for DESTDIR (currently hardcoded for GHC 7.6.3)

--- scripts/install.sh.orig 2013-05-04 20:56:20.000000000 +0000
+++ scripts/install.sh
@@ -21,25 +21,45 @@ install_pkg () {
 
   [ -x Setup ] || die "The ${PKG}/Setup script does not exist or cannot be run"
 
-  ./Setup copy ${VERBOSE} \
-    || die "Installing the ${PKG} component failed"
 
-  ./Setup register ${VERBOSE} --gen-pkg-config="${PKG}.conf" \
-    || die "Generating the registration information for the package ${PKG} failed"
+  if [ -n "${DESTDIR}" ]; then
 
-  if [ -f ${PKG}.conf ]; then
-    if test "${USER_INSTALL}" = "YES"; then
-      GHC_PKG_DB="--user"
-    else
-      GHC_PKG_DB="--global"
-    fi
-    ${GHC_PKG} update ${GHC_PKG_DB} "${PKG}.conf" \
-      || die "Registering the package ${PKG} failed"
+      ./Setup copy ${VERBOSE} --destdir=${DESTDIR} \
+        || die "Installing the ${PKG} component failed"
+  
+      ./Setup register ${VERBOSE} --gen-pkg-config="${DESTDIR}${PREFIX}/lib/ghc-7.6.3/package.conf.d/${PKG}.conf" \
+        || die "Generating the registration information for the package ${PKG} failed"
+       
+  else
+   
+      ./Setup copy ${VERBOSE} \
+        || die "Installing the ${PKG} component failed"
+   
+      ./Setup register ${VERBOSE} --gen-pkg-config="${PKG}.conf" \
+        || die "Generating the registration information for the package ${PKG} failed"
+       
+      if [ -f ${PKG}.conf ]; then
+        if test "${USER_INSTALL}" = "YES"; then
+          GHC_PKG_DB="--user"
+        else
+          GHC_PKG_DB="--global"
+        fi
+        ${GHC_PKG} update ${GHC_PKG_DB} "${PKG}.conf" \
+          || die "Registering the package ${PKG} failed"
+      fi
+   
+      ./Setup copy ${VERBOSE} \
+        || die "Installing the ${PKG} component failed"
+   
   fi
 
   cd ../..
 }
 
+if [ -n "${DESTDIR}" ]; then
+    mkdir -p ${DESTDIR}${PREFIX}/lib/ghc-7.6.3/package.conf.d
+fi
+
 # Actually do something!
 for pkg in `cat packages/platform.packages`; do
   if is_pkg_installed "${pkg}"; then
