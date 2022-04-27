$NetBSD$

Fix missing (non-standard) s6_addr32.

--- include/my_global.h.orig	2022-02-07 19:58:20.000000000 +0000
+++ include/my_global.h
@@ -802,8 +802,12 @@ typedef mode_t MY_MODE;
   #define strcasecmp _stricmp
 #endif
 
-#if defined(HAVE_IPV6) && defined(__APPLE__)
+#if defined(HAVE_IPV6)
+# if defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__)
 #define s6_addr32 __u6_addr.__u6_addr32
+# elif defined(__sun)
+#define s6_addr32 _S6_un._S6_u32
+# endif
 #endif
 
 #endif  // MY_GLOBAL_INCLUDED
