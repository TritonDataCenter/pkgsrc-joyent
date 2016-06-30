$NetBSD$

Don't insert DWARF directives on SunOS.

--- mysys/my_context.c.orig	2016-06-23 09:24:43.000000000 +0000
+++ mysys/my_context.c
@@ -206,7 +206,7 @@ my_context_spawn(struct my_context *c, v
     (
      "movq %%rsp, (%[save])\n\t"
      "movq %[stack], %%rsp\n\t"
-#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && !defined(__INTEL_COMPILER)
+#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && !defined(__INTEL_COMPILER) && !defined(__sun)
      /*
        This emits a DWARF DW_CFA_undefined directive to make the return address
        undefined. This indicates that this is the top of the stack frame, and
@@ -454,7 +454,7 @@ my_context_spawn(struct my_context *c, v
     (
      "movl %%esp, (%[save])\n\t"
      "movl %[stack], %%esp\n\t"
-#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && !defined(__INTEL_COMPILER)
+#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && !defined(__INTEL_COMPILER) && !defined(__sun)
      /*
        This emits a DWARF DW_CFA_undefined directive to make the return address
        undefined. This indicates that this is the top of the stack frame, and
