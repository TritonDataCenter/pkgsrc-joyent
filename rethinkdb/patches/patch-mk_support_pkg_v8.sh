$NetBSD$

Use MACHINE_ARCH rather than relying on GCC -dumpmachine.

--- mk/support/pkg/v8.sh.orig	2015-03-30 21:14:22.000000000 +0000
+++ mk/support/pkg/v8.sh
@@ -30,7 +30,7 @@ pkg_install () {
     arch_gypflags=
     raspberry_pi_gypflags='-Darm_version=6 -Darm_fpu=vfpv2'
     host=$($CXX -dumpmachine)
-    case ${host%%-*} in
+    case ${MACHINE_ARCH} in
         i?86)   arch=ia32 ;;
         x86_64) arch=x64 ;;
         arm*)   arch=arm; arch_gypflags=$raspberry_pi_gypflags ;;
