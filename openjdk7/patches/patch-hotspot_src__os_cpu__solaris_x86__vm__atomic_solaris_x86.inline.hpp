$NetBSD$

--- hotspot/src/os_cpu/solaris_x86/vm/atomic_solaris_x86.inline.hpp.orig	2011-06-27 16:11:33.000000000 +0000
+++ hotspot/src/os_cpu/solaris_x86/vm/atomic_solaris_x86.inline.hpp
@@ -68,16 +68,16 @@ inline void Atomic::dec_ptr(volatile voi
 #endif // _LP64
 
 extern "C" {
-  jint _Atomic_add(jint add_value, volatile jint* dest IS_MP_DECL());
+  jint _Atomic_add(jint add_value, volatile jint* dest IS_MP_DECL(), int mp);
   jint _Atomic_xchg(jint exchange_value, volatile jint* dest);
   jint _Atomic_cmpxchg(jint exchange_value, volatile jint* dest,
-                       jint compare_value IS_MP_DECL());
+                       jint compare_value IS_MP_DECL(), int mp);
   jlong _Atomic_cmpxchg_long(jlong exchange_value, volatile jlong* dest,
-                             jlong compare_value IS_MP_DECL());
+                             jlong compare_value IS_MP_DECL(), int mp);
 }
 
 inline jint     Atomic::add    (jint     add_value, volatile jint*     dest) {
-  return _Atomic_add(add_value, dest IS_MP_ARG());
+  return _Atomic_add(add_value, dest IS_MP_ARG(), 0);
 }
 
 inline jint     Atomic::xchg       (jint     exchange_value, volatile jint*     dest) {
@@ -85,26 +85,26 @@ inline jint     Atomic::xchg       (jint
 }
 
 inline jint     Atomic::cmpxchg    (jint     exchange_value, volatile jint*     dest, jint     compare_value) {
-  return _Atomic_cmpxchg(exchange_value, dest, compare_value IS_MP_ARG());
+  return _Atomic_cmpxchg(exchange_value, dest, compare_value IS_MP_ARG(), 0);
 }
 
 inline jlong    Atomic::cmpxchg    (jlong    exchange_value, volatile jlong*    dest, jlong    compare_value) {
-  return _Atomic_cmpxchg_long(exchange_value, dest, compare_value IS_MP_ARG());
+  return _Atomic_cmpxchg_long(exchange_value, dest, compare_value IS_MP_ARG(), 0);
 }
 
 
 #ifdef AMD64
 inline void Atomic::store    (jlong    store_value, jlong*             dest) { *dest = store_value; }
 inline void Atomic::store    (jlong    store_value, volatile jlong*    dest) { *dest = store_value; }
-extern "C" jlong _Atomic_add_long(jlong add_value, volatile jlong* dest);
+extern "C" jlong _Atomic_add_long(jlong add_value, volatile jlong* dest, int mp);
 extern "C" jlong _Atomic_xchg_long(jlong exchange_value, volatile jlong* dest);
 
 inline intptr_t Atomic::add_ptr(intptr_t add_value, volatile intptr_t* dest) {
-  return (intptr_t)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest);
+  return (intptr_t)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest, 0);
 }
 
 inline void*    Atomic::add_ptr(intptr_t add_value, volatile void*     dest) {
-  return (void*)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest);
+  return (void*)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest, 0);
 }
 
 inline intptr_t Atomic::xchg_ptr(intptr_t exchange_value, volatile intptr_t* dest) {
@@ -116,11 +116,11 @@ inline void*    Atomic::xchg_ptr(void*  
 }
 
 inline intptr_t Atomic::cmpxchg_ptr(intptr_t exchange_value, volatile intptr_t* dest, intptr_t compare_value) {
-  return (intptr_t)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value);
+  return (intptr_t)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value, 0);
 }
 
 inline void*    Atomic::cmpxchg_ptr(void*    exchange_value, volatile void*     dest, void*    compare_value) {
-  return (void*)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value);
+  return (void*)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value, 0);
 }
 
 inline jlong Atomic::load(volatile jlong* src) { return *src; }
