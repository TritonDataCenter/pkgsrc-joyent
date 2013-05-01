$NetBSD$

--- hotspot/src/os_cpu/solaris_x86/vm/os_solaris_x86.cpp.orig	2013-02-19 23:21:59.000000000 +0000
+++ hotspot/src/os_cpu/solaris_x86/vm/os_solaris_x86.cpp
@@ -235,13 +235,39 @@ frame os::get_sender_for_C_frame(frame*
   return frame(fr->sender_sp(), fr->link(), fr->sender_pc());
 }
 
+#ifdef AMD64
+#define SPELL_REG_SP "rsp"
+#define SPELL_REG_FP "rbp"
+#else
+#define SPELL_REG_SP "esp"
+#define SPELL_REG_FP "ebp"
+#endif // AMD64
+
+#ifdef SPARC_WORKS
 extern "C" intptr_t *_get_current_sp();  // in .il file
+#else
+#ifdef _GNU_SOURCE
+extern "C" intptr_t *_get_current_sp() {
+  register intptr_t *rsp __asm__ (SPELL_REG_SP);
+  return rsp;
+}
+#endif // _GNU_SOURCE
+#endif // SPARC_WORKS
 
 address os::current_stack_pointer() {
   return (address)_get_current_sp();
 }
 
+#ifdef SPARC_WORKS
 extern "C" intptr_t *_get_current_fp();  // in .il file
+#else
+#ifdef _GNU_SOURCE
+extern "C" intptr_t *_get_current_fp() {
+  register intptr_t **rbp __asm__ (SPELL_REG_FP);
+  return (intptr_t*) *rbp;   // we want what it points to.
+}
+#endif // _GNU_SOURCE
+#endif // SPARC_WORKS
 
 frame os::current_frame() {
   intptr_t* fp = _get_current_fp();  // it's inlined so want current fp
@@ -933,7 +959,12 @@ add_func_t*          os::atomic_add_func
 extern "C" void _solaris_raw_setup_fpu(address ptr);
 void os::setup_fpu() {
   address fpu_cntrl = StubRoutines::addr_fpu_cntrl_wrd_std();
+#ifndef _GNU_SOURCE
   _solaris_raw_setup_fpu(fpu_cntrl);
+#else
+  // same as hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp : os::setup_fpu()
+  __asm__ volatile("fldcw (%0)"::"r"(fpu_cntrl):"memory");
+#endif // !_GNU_SOURCE
 }
 #endif // AMD64
 
