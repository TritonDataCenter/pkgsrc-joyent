$NetBSD$

Support SunOS/gcc.

--- src/hotspot/os_cpu/solaris_x86/atomic_solaris_x86.hpp.orig	2019-01-08 12:44:55.000000000 +0000
+++ src/hotspot/os_cpu/solaris_x86/atomic_solaris_x86.hpp
@@ -27,11 +27,65 @@
 
 // For Sun Studio - implementation is in solaris_x86_64.il.
 
+#ifdef __GNUC__
+inline jint _Atomic_add(jint add_value, volatile jint* dest) {
+  jint old_value;
+  __asm__ volatile ("lock xaddl %0,(%2)"
+                    : "=r" (old_value)
+                    : "0" (add_value), "r" (dest)
+                    : "cc", "memory");
+  return old_value;
+}
+inline jlong _Atomic_add_long(jlong add_value, volatile jlong* dest) {
+  jlong old_value;
+  __asm__ volatile ("lock xaddq %0,(%2)"
+                    : "=r" (old_value)
+                    : "0" (add_value), "r" (dest)
+                    : "cc", "memory");
+  return old_value;
+}
+inline jint _Atomic_xchg(jint exchange_value, volatile jint* dest) {
+  __asm__ __volatile__ ("xchgl (%2),%0"
+                        : "=r" (exchange_value)
+                        : "0" (exchange_value), "r" (dest)
+                        : "memory");
+  return exchange_value;
+}
+inline jlong _Atomic_xchg_long(jlong exchange_value, volatile jlong* dest) {
+  __asm__ __volatile__ ("xchgq (%2),%0"
+                        : "=r" (exchange_value)
+                        : "0" (exchange_value), "r" (dest)
+                        : "memory");
+  return exchange_value;
+}
+inline jbyte _Atomic_cmpxchg_byte(jbyte exchange_value, volatile jbyte* dest, jbyte compare_value) {
+  __asm__ volatile ("lock cmpxchgb %1,(%3)"
+                    : "=a" (exchange_value)
+                    : "q" (exchange_value), "a" (compare_value), "r" (dest)
+                    : "cc", "memory");
+  return exchange_value;
+}
+inline jint _Atomic_cmpxchg(jint exchange_value, volatile jint* dest, jint compare_value) {
+  __asm__ volatile ("lock cmpxchgl %1,(%3)"
+                    : "=a" (exchange_value)
+                    : "q" (exchange_value), "a" (compare_value), "r" (dest)
+                    : "cc", "memory");
+  return exchange_value;
+}
+inline jlong _Atomic_cmpxchg_long(jlong exchange_value, volatile jlong* dest, jlong compare_value) {
+  __asm__ volatile ("lock cmpxchgq %1,(%3)"
+                    : "=a" (exchange_value)
+                    : "q" (exchange_value), "a" (compare_value), "r" (dest)
+                    : "cc", "memory");
+  return exchange_value;
+}
+#else
 extern "C" {
   jint _Atomic_add(jint add_value, volatile jint* dest);
   jlong _Atomic_add_long(jlong add_value, volatile jlong* dest);
 
   jint _Atomic_xchg(jint exchange_value, volatile jint* dest);
+  jlong _Atomic_xchg_long(jlong exchange_value, volatile jlong* dest);
   jbyte _Atomic_cmpxchg_byte(jbyte exchange_value, volatile jbyte* dest,
                              jbyte compare_value);
   jint _Atomic_cmpxchg(jint exchange_value, volatile jint* dest,
@@ -39,6 +93,7 @@ extern "C" {
   jlong _Atomic_cmpxchg_long(jlong exchange_value, volatile jlong* dest,
                              jlong compare_value);
 }
+#endif
 
 template<size_t byte_size>
 struct Atomic::PlatformAdd
@@ -80,8 +135,6 @@ inline T Atomic::PlatformXchg<4>::operat
                  reinterpret_cast<jint volatile*>(dest)));
 }
 
-extern "C" jlong _Atomic_xchg_long(jlong exchange_value, volatile jlong* dest);
-
 template<>
 template<typename T>
 inline T Atomic::PlatformXchg<8>::operator()(T exchange_value,
