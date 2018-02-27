$NetBSD$

Incorrect assembler syntax.

--- deps/mariadb-client-library/mariadb-connector-c-2.3.1/libmariadb/my_context.c.orig	2016-08-03 15:39:12.000000000 +0000
+++ deps/mariadb-client-library/mariadb-connector-c-2.3.1/libmariadb/my_context.c
@@ -204,6 +204,7 @@ my_context_spawn(struct my_context *c, v
   */
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movq %%rsp, (%[save])\n\t"
      "movq %[stack], %%rsp\n\t"
 #if __GNUC__ >= 4 && __GNUC_MINOR__ >= 4 && !defined(__INTEL_COMPILER)
@@ -244,6 +245,7 @@ my_context_spawn(struct my_context *c, v
      "2:\n\t"
      "movl $1, %[ret]\n"
      "3:\n"
+     ".cfi_endproc\n"
      : [ret] "=a" (ret),
        [f] "+S" (f),
        /* Need this in %rdi to follow calling convention. */
@@ -452,6 +454,7 @@ my_context_spawn(struct my_context *c, v
   */
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movl %%esp, (%[save])\n\t"
      "movl %[stack], %%esp\n\t"
 #if __GNUC__ >= 4 && __GNUC_MINOR__ >= 4 && !defined(__INTEL_COMPILER)
@@ -492,6 +495,7 @@ my_context_spawn(struct my_context *c, v
      "3:\n\t"
      "movl $1, %[ret]\n"
      "4:\n"
+     ".cfi_endproc\n"
      : [ret] "=a" (ret),
        [f] "+c" (f),
        [d] "+d" (d)
