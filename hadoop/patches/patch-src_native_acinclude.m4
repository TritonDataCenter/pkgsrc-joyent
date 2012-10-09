$NetBSD$

sed pattern not portable, let's use ldd instead.
--- src/native/acinclude.m4.orig	2012-05-08 20:34:52.000000000 +0000
+++ src/native/acinclude.m4
@@ -9,9 +9,7 @@ AC_CACHE_CHECK([Checking for the 'actual
   echo 'int main(int argc, char **argv){return 0;}' > conftest.c
   if test -z "`${CC} ${LDFLAGS} -o conftest conftest.c -l$1 2>&1`"; then
     dnl Try objdump and ldd in that order to get the dynamic library
-    if test ! -z "`which objdump | grep -v 'no objdump'`"; then
-      ac_cv_libname_$1="`objdump -p conftest | grep NEEDED | grep $1 | sed 's/\W*NEEDED\W*\(.*\)\W*$/\"\1\"/'`"
-    elif test ! -z "`which ldd | grep -v 'no ldd'`"; then
+    if test ! -z "`which ldd | grep -v 'no ldd'`"; then
       ac_cv_libname_$1="`ldd conftest | grep $1 | sed 's/^[[[^A-Za-z0-9]]]*\([[[A-Za-z0-9\.]]]*\)[[[^A-Za-z0-9]]]*=>.*$/\"\1\"/'`"
     else
       AC_MSG_ERROR(Can't find either 'objdump' or 'ldd' to compute the dynamic library for '-l$1')
