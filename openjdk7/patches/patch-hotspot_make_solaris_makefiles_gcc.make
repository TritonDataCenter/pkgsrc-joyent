$NetBSD$

--- hotspot/make/solaris/makefiles/gcc.make.orig	2011-06-27 16:10:17.000000000 +0000
+++ hotspot/make/solaris/makefiles/gcc.make
@@ -146,6 +146,9 @@ ifneq ($(USE_PRECOMPILED_HEADER),1)
 CFLAGS += -DDONT_USE_PRECOMPILED_HEADER
 endif
 
+# Inline functions
+CFLAGS += $(GAMMADIR)/src/os_cpu/solaris_${Platform_arch}/vm/solaris_${Platform_arch_model}.il
+
 #------------------------------------------------------------------------
 # Linker flags
 
