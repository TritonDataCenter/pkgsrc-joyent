$NetBSD$

Fix library location on SunOS.

--- mk/rt.mk.orig	2016-08-19 09:17:11.563171964 +0000
+++ mk/rt.mk
@@ -269,6 +269,11 @@ endif
 COMPRT_DEFINES_$(1) := -DCOMPILER_RT_ENABLE_IOS=ON
 endif
 
+ifeq ($$(findstring solaris,$(1)),solaris)
+COMPRT_DIR_$(1) := sunos
+COMPRT_LIB_NAME_$(1) := clang_rt.builtins-$$(COMPRT_ARCH_$(1))
+endif
+
 ifndef COMPRT_DIR_$(1)
 # NB: FreeBSD and NetBSD output to "linux"...
 COMPRT_DIR_$(1) := linux
