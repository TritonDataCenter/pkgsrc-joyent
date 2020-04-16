$NetBSD$

Revert the values-*.o settings back to the GCC 7.x behaviour, where we avoid
the XPG4/XPG6 values completely.  Unfortunately due to illumos#12306 there
is widespread breakage when using them, unless users are running a platform
newer than 20200305.  This is likely to be required for some time :(
 
Add ${PREFIX}/lib to the default library search path.  These changes are
removed by subst if USE_GCC_LOCALBASE_PREFIX == "no".

--- gcc/config/sol2.h.orig	2020-03-21 10:54:58.000000000 +0000
+++ gcc/config/sol2.h
@@ -199,16 +199,8 @@ along with GCC; see the file COPYING3.
    first in ld.so.1's search path), we only link the values-*.o files into
    executable programs.  */
 #undef STARTFILE_ARCH_SPEC
-#define STARTFILE_ARCH_SPEC \
-  "%{!shared:%{!symbolic:%{!G: \
-     %{ \
-	std=c89|std=c90|std=gnu89|std=gnu90:values-Xa.o%s; \
-	ansi|std=c*|std=iso9899\\:199409:values-Xc.o%s; \
-	:values-Xa.o%s} \
-     %{ \
-	std=c89|std=c90|std=gnu89|std=gnu90:; \
-	:values-xpg6.o%s \
-     }}}}"
+#define STARTFILE_ARCH_SPEC "%{ansi:values-Xc.o%s} \
+                            %{!ansi:values-Xa.o%s}"
 
 #if defined(HAVE_LD_PIE) && defined(HAVE_SOLARIS_CRTS)
 #define STARTFILE_CRTBEGIN_SPEC "%{static:crtbegin.o%s; \
@@ -307,8 +299,9 @@ along with GCC; see the file COPYING3.
 #define LINK_ARCH32_SPEC_BASE \
   "%{YP,*} \
    %{R*} \
-   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp%R/lib:%R/usr/lib} \
-	   %{!p:%{!pg:-Y P,%R/lib:%R/usr/lib}}}"
+  -R@PREFIX@/lib \
+   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp%R/lib:%R/usr/lib:%R@PREFIX@/lib} \
+	   %{!p:%{!pg:-Y P,%R/lib:%R/usr/lib:%R@PREFIX@/lib}}}"
 
 #undef LINK_ARCH32_SPEC
 #define LINK_ARCH32_SPEC LINK_ARCH32_SPEC_BASE
@@ -319,8 +312,9 @@ along with GCC; see the file COPYING3.
 #define LINK_ARCH64_SPEC_BASE \
   "%{YP,*} \
    %{R*} \
-   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR "}	\
-	   %{!p:%{!pg:-Y P,%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR "}}}"
+  -R@PREFIX@/lib \
+   %{!YP,*:%{p|pg:-Y P,%R/usr/lib/libp/" ARCH64_SUBDIR ":%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR ":%R@PREFIX@/lib}	\
+	   %{!p:%{!pg:-Y P,%R/lib/" ARCH64_SUBDIR ":%R/usr/lib/" ARCH64_SUBDIR ":%R@PREFIX@/lib}}}"
 
 #undef LINK_ARCH64_SPEC
 #ifndef USE_GLD
