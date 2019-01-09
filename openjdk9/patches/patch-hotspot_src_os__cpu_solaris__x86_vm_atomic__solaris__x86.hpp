$NetBSD$

Support SunOS/gcc.

--- hotspot/src/os_cpu/solaris_x86/vm/atomic_solaris_x86.hpp.orig	2017-08-01 09:03:05.000000000 +0000
+++ hotspot/src/os_cpu/solaris_x86/vm/atomic_solaris_x86.hpp
@@ -56,7 +56,7 @@ inline void Atomic::dec_ptr(volatile voi
 // facilitate this, os::is_MP() is passed as an additional argument.  64-bit
 // processors are assumed to be multi-threaded and/or multi-core, so the extra
 // argument is unnecessary.
-#ifndef _LP64
+#if !defined(_LP64) || defined(_GNU_SOURCE)
 #define IS_MP_DECL() , int is_mp
 #define IS_MP_ARG()  , (int) os::is_MP()
 #else
@@ -100,15 +100,15 @@ inline jlong    Atomic::cmpxchg    (jlon
 #ifdef AMD64
 inline void Atomic::store    (jlong    store_value, jlong*             dest) { *dest = store_value; }
 inline void Atomic::store    (jlong    store_value, volatile jlong*    dest) { *dest = store_value; }
-extern "C" jlong _Atomic_add_long(jlong add_value, volatile jlong* dest);
+extern "C" jlong _Atomic_add_long(jlong add_value, volatile jlong* dest IS_MP_DECL());
 extern "C" jlong _Atomic_xchg_long(jlong exchange_value, volatile jlong* dest);
 
 inline intptr_t Atomic::add_ptr(intptr_t add_value, volatile intptr_t* dest) {
-  return (intptr_t)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest);
+  return (intptr_t)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest IS_MP_ARG());
 }
 
 inline void*    Atomic::add_ptr(intptr_t add_value, volatile void*     dest) {
-  return (void*)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest);
+  return (void*)_Atomic_add_long((jlong)add_value, (volatile jlong*)dest IS_MP_ARG());
 }
 
 inline intptr_t Atomic::xchg_ptr(intptr_t exchange_value, volatile intptr_t* dest) {
@@ -120,11 +120,11 @@ inline void*    Atomic::xchg_ptr(void*
 }
 
 inline intptr_t Atomic::cmpxchg_ptr(intptr_t exchange_value, volatile intptr_t* dest, intptr_t compare_value, cmpxchg_memory_order order) {
-  return (intptr_t)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value);
+  return (intptr_t)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value IS_MP_ARG());
 }
 
 inline void*    Atomic::cmpxchg_ptr(void*    exchange_value, volatile void*     dest, void*    compare_value, cmpxchg_memory_order order) {
-  return (void*)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value);
+  return (void*)_Atomic_cmpxchg_long((jlong)exchange_value, (volatile jlong*)dest, (jlong)compare_value IS_MP_ARG());
 }
 
 inline jlong Atomic::load(volatile jlong* src) { return *src; }
