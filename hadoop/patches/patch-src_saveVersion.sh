$NetBSD$

Use id instead of whoami for better portability. Use digest instead of md5sum.
--- src/saveVersion.sh.orig	2012-05-08 20:34:52.000000000 +0000
+++ src/saveVersion.sh
@@ -22,7 +22,7 @@ unset LANG
 unset LC_CTYPE
 version=$1
 build_dir=$2
-user=`whoami`
+user=`id -un`
 date=`date`
 if [ -d .git ]; then
   revision=`git log -1 --pretty=format:"%H"`
@@ -33,7 +33,7 @@ else
   revision=`svn info | sed -n -e 's/Last Changed Rev: \(.*\)/\1/p'`
   url=`svn info | sed -n -e 's/URL: \(.*\)/\1/p'`
 fi
-srcChecksum=`find src -name '*.java' | LC_ALL=C sort | xargs md5sum | md5sum | cut -d ' ' -f 1`
+srcChecksum=`find src -name '*.java' | LC_ALL=C sort | xargs digest md5 | digest md5 | cut -d ' ' -f 1`
 
 mkdir -p $build_dir/src/org/apache/hadoop
 cat << EOF | \
