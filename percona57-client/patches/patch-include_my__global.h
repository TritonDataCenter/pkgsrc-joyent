$NetBSD$

Fix SHUT_RDWR handling on IRIX.
Fix missing s6_addr32 on SunOS.

--- include/my_global.h.orig	2016-06-30 06:22:11.000000000 +0000
+++ include/my_global.h
@@ -145,6 +145,15 @@ static inline void sleep(unsigned long s
 #define default_shared_memory_base_name "MYSQL"
 #endif /* _WIN32*/
 
+#if defined(__sgi) && !defined(SHUT_RDWR)
+
+/*
+  IRIX 5 does not define SHUT_RDWR
+*/
+
+#define SHUT_RDWR 2
+#endif
+
 /**
   Cast a member of a structure to the structure that contains it.
 
@@ -783,4 +792,8 @@ typedef mode_t MY_MODE;
 #define s6_addr32 __u6_addr.__u6_addr32
 #endif
 
+#if defined(HAVE_IPV6) && defined(__sun)
+#define s6_addr32 _S6_un._S6_u32
+#endif
+
 #endif  // MY_GLOBAL_INCLUDED
