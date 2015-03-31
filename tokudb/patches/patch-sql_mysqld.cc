$NetBSD: patch-sql_mysqld.cc,v 1.3 2012/10/01 15:54:40 adam Exp $

--- sql/mysqld.cc.orig	2015-01-21 20:49:23.000000000 +0000
+++ sql/mysqld.cc
@@ -161,7 +161,7 @@ extern int memcntl(caddr_t, size_t, int,
 int initgroups(const char *,unsigned int);
 #endif
 
-#if defined(__FreeBSD__) && defined(HAVE_IEEEFP_H) && !defined(HAVE_FEDISABLEEXCEPT)
+#if (defined(__FreeBSD__) || defined(__DragonFly__)) && defined(HAVE_IEEEFP_H) && !defined(HAVE_FEDISABLEEXCEPT)
 #include <ieeefp.h>
 #ifdef HAVE_FP_EXCEPT				// Fix type conflict
 typedef fp_except fp_except_t;
@@ -192,7 +192,7 @@ extern "C" my_bool reopen_fstreams(const
 
 inline void setup_fpu()
 {
-#if defined(__FreeBSD__) && defined(HAVE_IEEEFP_H) && !defined(HAVE_FEDISABLEEXCEPT)
+#if (defined(__FreeBSD__) || defined(__DragonFly__)) && defined(HAVE_IEEEFP_H) && !defined(HAVE_FEDISABLEEXCEPT)
   /* We can't handle floating point exceptions with threads, so disable
      this on freebsd
      Don't fall for overflow, underflow,divide-by-zero or loss of precision.
