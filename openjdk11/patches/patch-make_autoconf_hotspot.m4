$NetBSD$

Fix Shenandoah feature check.

--- make/autoconf/hotspot.m4.orig	2020-09-22 15:30:20.000000000 +0000
+++ make/autoconf/hotspot.m4
@@ -354,16 +354,16 @@ AC_DEFUN_ONCE([HOTSPOT_SETUP_JVM_FEATURE
 
   # Only enable Shenandoah on supported arches, and only if requested
   AC_MSG_CHECKING([if shenandoah can be built])
-  if HOTSPOT_CHECK_JVM_FEATURE(shenandoahgc); then
+  #if HOTSPOT_CHECK_JVM_FEATURE(shenandoahgc); then
     if test "x$OPENJDK_TARGET_CPU_ARCH" = "xx86" || test "x$OPENJDK_TARGET_CPU" = "xaarch64" ; then
       AC_MSG_RESULT([yes])
     else
       DISABLED_JVM_FEATURES="$DISABLED_JVM_FEATURES shenandoahgc"
       AC_MSG_RESULT([no, platform not supported])
     fi
-  else
-      DISABLED_JVM_FEATURES="$DISABLED_JVM_FEATURES shenandoahgc"
-  fi
+  #else
+  #    DISABLED_JVM_FEATURES="$DISABLED_JVM_FEATURES shenandoahgc"
+  #fi
 
   # Only enable ZGC on supported platforms
   AC_MSG_CHECKING([if zgc can be built])
