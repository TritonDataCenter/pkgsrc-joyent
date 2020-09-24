$NetBSD$

Shell portability.

--- make/autoconf/util_paths.m4.orig	2020-05-13 14:18:16.000000000 +0000
+++ make/autoconf/util_paths.m4
@@ -213,7 +213,7 @@ AC_DEFUN([UTIL_REMOVE_SYMBOLIC_LINKS],
       # Resolve file symlinks
       while test $COUNTER -lt 20; do
         ISLINK=`$LS -l $sym_link_dir/$sym_link_file | $GREP '\->' | $SED -e 's/.*-> \(.*\)/\1/'`
-        if test "x$ISLINK" == x; then
+        if test "x$ISLINK" = x; then
           # This is not a symbolic link! We are done!
           break
         fi
