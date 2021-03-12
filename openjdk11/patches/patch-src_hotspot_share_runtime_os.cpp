$NetBSD$

SunOS does not support tm_gmtoff.

--- src/hotspot/share/runtime/os.cpp.orig	2020-07-29 16:52:13.000000000 +0000
+++ src/hotspot/share/runtime/os.cpp
@@ -154,7 +154,7 @@ char* os::iso8601_time(char* buffer, siz
   // No offset when dealing with UTC
   time_t UTC_to_local = 0;
   if (!utc) {
-#if defined(_ALLBSD_SOURCE) || defined(_GNU_SOURCE)
+#if (defined(_ALLBSD_SOURCE) || defined(_GNU_SOURCE)) && !defined(__sun)
     UTC_to_local = -(time_struct.tm_gmtoff);
 #elif defined(_WINDOWS)
     long zone;
