$NetBSD$

Don't insert DWARF directives on SunOS.

--- mysys/my_context.c.orig	2017-05-19 23:04:13.000000000 +0000
+++ mysys/my_context.c
@@ -204,10 +204,11 @@ my_context_spawn(struct my_context *c, v
   */
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movq %%rsp, (%[save])\n\t"
      "movq %[stack], %%rsp\n\t"
 #if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4) || __clang__) && \
-     !defined(__INTEL_COMPILER)
+     !defined(__INTEL_COMPILER) && !defined(__sun)
      /*
        This emits a DWARF DW_CFA_undefined directive to make the return address
        undefined. This indicates that this is the top of the stack frame, and
@@ -245,6 +246,7 @@ my_context_spawn(struct my_context *c, v
      "2:\n\t"
      "movl $1, %[ret]\n"
      "3:\n"
+     ".cfi_endproc\n"
      : [ret] "=a" (ret),
        [f] "+S" (f),
        /* Need this in %rdi to follow calling convention. */
@@ -269,6 +271,7 @@ my_context_continue(struct my_context *c
 
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movq (%[save]), %%rax\n\t"
      "movq %%rsp, (%[save])\n\t"
      "movq %%rax, %%rsp\n\t"
@@ -318,6 +321,7 @@ my_context_continue(struct my_context *c
      "2:\n\t"
      "movl $1, %[ret]\n"
      "3:\n"
+     ".cfi_endproc\n"
      : [ret] "=a" (ret)
      : /* Need this in callee-save register to preserve in function call. */
        [save] "b" (&c->save[0])
@@ -335,6 +339,7 @@ my_context_yield(struct my_context *c)
   uint64_t *save= &c->save[0];
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movq (%[save]), %%rax\n\t"
      "movq %%rsp, (%[save])\n\t"
      "movq %%rax, %%rsp\n\t"
@@ -363,6 +368,7 @@ my_context_yield(struct my_context *c)
      "jmpq *%%rax\n"
 
      "1:\n"
+     ".cfi_endproc\n"
      : [save] "+D" (save)
      :
      : "rax", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11", "memory", "cc"
@@ -453,9 +459,10 @@ my_context_spawn(struct my_context *c, v
   */
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movl %%esp, (%[save])\n\t"
      "movl %[stack], %%esp\n\t"
-#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && !defined(__INTEL_COMPILER)
+#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)) && !defined(__INTEL_COMPILER) && !defined(__sun)
      /*
        This emits a DWARF DW_CFA_undefined directive to make the return address
        undefined. This indicates that this is the top of the stack frame, and
@@ -493,6 +500,7 @@ my_context_spawn(struct my_context *c, v
      "3:\n\t"
      "movl $1, %[ret]\n"
      "4:\n"
+     ".cfi_endproc\n"
      : [ret] "=a" (ret),
        [f] "+c" (f),
        [d] "+d" (d)
@@ -516,6 +524,7 @@ my_context_continue(struct my_context *c
 
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movl (%[save]), %%eax\n\t"
      "movl %%esp, (%[save])\n\t"
      "movl %%eax, %%esp\n\t"
@@ -561,6 +570,7 @@ my_context_continue(struct my_context *c
      "3:\n\t"
      "movl $1, %[ret]\n"
      "4:\n"
+     ".cfi_endproc\n"
      : [ret] "=a" (ret)
      : /* Need this in callee-save register to preserve in function call. */
        [save] "D" (&c->save[0])
@@ -578,6 +588,7 @@ my_context_yield(struct my_context *c)
   uint64_t *save= &c->save[0];
   __asm__ __volatile__
     (
+     ".cfi_startproc\n\t"
      "movl (%[save]), %%eax\n\t"
      "movl %%esp, (%[save])\n\t"
      "movl %%eax, %%esp\n\t"
@@ -604,6 +615,7 @@ my_context_yield(struct my_context *c)
      "jmp *%%eax\n"
 
      "2:\n"
+     ".cfi_endproc\n"
      : [save] "+d" (save)
      :
      : "eax", "ecx", "memory", "cc"
