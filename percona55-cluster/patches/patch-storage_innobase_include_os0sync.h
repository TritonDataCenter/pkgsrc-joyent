$NetBSD: patch-storage_innobase_include_os0sync.h,v 1.2 2011/07/08 09:32:07 adam Exp $

--- storage/innobase/include/os0sync.h.orig	2014-09-05 08:16:57.000000000 +0000
+++ storage/innobase/include/os0sync.h
@@ -335,7 +335,7 @@ compare to, new_val is the value to swap
 	(atomic_cas_ulong(ptr, old_val, new_val) == old_val)
 
 # define os_compare_and_swap_lint(ptr, old_val, new_val) \
-	((lint)atomic_cas_ulong((ulong_t*) ptr, old_val, new_val) == old_val)
+	((lint)atomic_cas_ulong((unsigned long*) ptr, old_val, new_val) == old_val)
 
 # ifdef HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS
 #  if SIZEOF_PTHREAD_T == 4
@@ -360,7 +360,7 @@ Returns the resulting value, ptr is poin
 amount of increment. */
 
 # define os_atomic_increment_lint(ptr, amount) \
-	atomic_add_long_nv((ulong_t*) ptr, amount)
+	atomic_add_long_nv((unsigned long *) ptr, amount)
 
 # define os_atomic_increment_ulint(ptr, amount) \
 	atomic_add_long_nv(ptr, amount)
