$NetBSD$

Move inline function to shared header.

--- erts/emulator/beam/beam_bp.c.orig	2011-10-03 18:12:07.000000000 +0000
+++ erts/emulator/beam/beam_bp.c
@@ -495,16 +495,6 @@ erts_find_local_func(Eterm mfa[3]) {
     return NULL;
 }
 
-/* bp_hash */
-ERTS_INLINE Uint bp_sched2ix() {
-#ifdef ERTS_SMP
-    ErtsSchedulerData *esdp;
-    esdp = erts_get_scheduler_data();
-    return esdp->no - 1;
-#else
-    return 0;
-#endif
-}
 static void bp_hash_init(bp_time_hash_t *hash, Uint n) {
     Uint size = sizeof(bp_data_time_item_t)*n;
     Uint i;
