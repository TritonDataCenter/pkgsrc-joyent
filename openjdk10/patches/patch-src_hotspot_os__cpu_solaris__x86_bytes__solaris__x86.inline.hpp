$NetBSD$

Support SunOS/gcc.

--- src/hotspot/os_cpu/solaris_x86/bytes_solaris_x86.inline.hpp.orig	2019-01-08 12:44:55.000000000 +0000
+++ src/hotspot/os_cpu/solaris_x86/bytes_solaris_x86.inline.hpp
@@ -25,6 +25,10 @@
 #ifndef OS_CPU_SOLARIS_X86_VM_BYTES_SOLARIS_X86_INLINE_HPP
 #define OS_CPU_SOLARIS_X86_VM_BYTES_SOLARIS_X86_INLINE_HPP
 
+#ifdef _GNU_SOURCE
+#include <sys/byteorder.h>
+#endif
+
 // For Sun Studio - implementation is in solaris_i486.il.
 // For gcc - implementation is just below.
 extern "C" u2 _raw_swap_u2(u2 x);
@@ -38,16 +42,28 @@ extern "C" u8 _raw_swap_u8(u4 x, u4 y);
 // Efficient swapping of data bytes from Java byte
 // ordering to native byte ordering and vice versa.
 inline u2   Bytes::swap_u2(u2 x) {
+#ifdef _GNU_SOURCE
+  return BSWAP_16(x);
+#else
   return _raw_swap_u2(x);
+#endif
 }
 
 inline u4   Bytes::swap_u4(u4 x) {
+#ifdef _GNU_SOURCE
+  return BSWAP_32(x);
+#else
   return _raw_swap_u4(x);
+#endif
 }
 
 inline u8   Bytes::swap_u8(u8 x) {
 #ifdef AMD64
+#ifdef _GNU_SOURCE
+  return BSWAP_64(x);
+#else
   return _raw_swap_u8(x);
+#endif
 #else
   return swap_u8_base(*(u4*)&x, *(((u4*)&x)+1));
 #endif // AMD64
