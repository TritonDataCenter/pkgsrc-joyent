$NetBSD$

Support SunOS/gcc.

--- common/autoconf/toolchain.m4.orig	2018-06-24 14:07:06.000000000 +0000
+++ common/autoconf/toolchain.m4
@@ -38,7 +38,7 @@ VALID_TOOLCHAINS_all="gcc clang solstudi
 
 # These toolchains are valid on different platforms
 VALID_TOOLCHAINS_linux="gcc clang"
-VALID_TOOLCHAINS_solaris="solstudio"
+VALID_TOOLCHAINS_solaris="gcc solstudio"
 VALID_TOOLCHAINS_macosx="gcc clang"
 VALID_TOOLCHAINS_aix="xlc"
 VALID_TOOLCHAINS_windows="microsoft"
