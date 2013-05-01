$NetBSD$

GCC compatability.

--- jdk/src/solaris/bin/ergo_i586.c.orig	2013-02-20 17:07:30.000000000 +0000
+++ jdk/src/solaris/bin/ergo_i586.c
@@ -27,7 +27,7 @@
 
 static unsigned long physical_processors(void);
 
-#ifdef __solaris__
+#if defined(__solaris__) && !defined(_GNU_SOURCE)
 
 /*
  * A utility method for asking the CPU about itself.
@@ -76,6 +76,9 @@ get_cpuid(uint32_t arg,
   asm(" popl    %ebx");
 #endif /* LP64 */
 }
+#endif /* __solaris__ && !_GNU_SOURCE */
+
+#ifdef __solaris__
 
 /* The definition of a server-class machine for solaris-i586/amd64 */
 jboolean
@@ -106,7 +109,7 @@ ServerClassMachineImpl(void) {
 
 #endif /* __solaris__ */
 
-#ifdef __linux__
+#if defined(__linux__) || (defined(__solaris__) && defined(_GNU_SOURCE))
 
 /*
  * A utility method for asking the CPU about itself.
@@ -170,6 +173,9 @@ get_cpuid(uint32_t arg,
   *edxp = value_of_edx;
 #endif /* _LP64 */
 }
+#endif /* #if __linux__ || ((__solaris__ && _GNU_SOURCE) */
+
+#ifdef __linux__
 
 /* The definition of a server-class machine for linux-i586 */
 jboolean
