$NetBSD$

Move inline function to shared header.

--- erts/emulator/beam/beam_bp.h.orig	2011-10-03 18:12:07.000000000 +0000
+++ erts/emulator/beam/beam_bp.h
@@ -144,7 +144,17 @@ extern erts_smp_spinlock_t erts_bp_lock;
 #define ErtsSmpBPUnlock(BDC)
 #endif
 
+/* bp_hash */
 ERTS_INLINE Uint bp_sched2ix(void);
+ERTS_INLINE Uint bp_sched2ix() {
+#ifdef ERTS_SMP
+    ErtsSchedulerData *esdp;
+    esdp = erts_get_scheduler_data();
+    return esdp->no - 1;
+#else
+    return 0;
+#endif
+}
 
 #ifdef ERTS_SMP
 #define bp_sched2ix_proc(p) ((p)->scheduler_data->no - 1)
