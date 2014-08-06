$NetBSD$

Add portable code for ftime for NetBSD.

Based on https://code.google.com/p/lz4/source/detail?r=81.
--- programs/fuzzer.c.orig	2014-07-24 11:54:05.000000000 +0000
+++ programs/fuzzer.c
@@ -29,6 +29,7 @@
 #ifdef _MSC_VER    /* Visual Studio */
 #  pragma warning(disable : 4127)        /* disable: C4127: conditional expression is constant */
 #  pragma warning(disable : 4146)        /* disable: C4146: minus unsigned expression */
+#  define BMK_LEGACY_TIMER 1
 #endif
 
 
@@ -37,12 +38,17 @@
 **************************************/
 #include <stdlib.h>
 #include <stdio.h>      // fgets, sscanf
-#include <sys/timeb.h>  // timeb
 #include <string.h>     // strcmp
 #include "lz4.h"
 #include "lz4hc.h"
 #include "xxhash.h"
 
+// Use ftime() if gettimeofday() is not available on your target
+#if defined(BMK_LEGACY_TIMER)
+#  include <sys/timeb.h>   // timeb, ftime
+#else
+#  include <sys/time.h>    // gettimeofday
+#endif
 
 /**************************************
    Basic Types
@@ -103,8 +109,11 @@ static int displayLevel = 2;
 /*********************************************************
   Fuzzer functions
 *********************************************************/
+#if defined(BMK_LEGACY_TIMER)
+
 static int FUZ_GetMilliStart(void)
 {
+   // Based on Legacy ftime()
    struct timeb tb;
    int nCount;
    ftime( &tb );
@@ -112,6 +121,20 @@ static int FUZ_GetMilliStart(void)
    return nCount;
 }
 
+#else
+
+static int FUZ_GetMilliStart()
+{
+  // Based on newer gettimeofday()
+  // Use GetMilliSpan to correct for rollover
+  struct timeval tv;
+  int nCount;
+  gettimeofday(&tv, NULL);
+  nCount = (int) (tv.tv_usec/1000 + (tv.tv_sec & 0xfffff) * 1000);
+  return nCount;
+}
+
+#endif
 
 static int FUZ_GetMilliSpan( int nTimeStart )
 {
