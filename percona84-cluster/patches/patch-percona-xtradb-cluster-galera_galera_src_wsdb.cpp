$NetBSD$

Fix iterator type.

--- percona-xtradb-cluster-galera/galera/src/wsdb.cpp.orig	2020-04-17 14:28:44.000000000 +0000
+++ percona-xtradb-cluster-galera/galera/src/wsdb.cpp
@@ -147,7 +147,7 @@ galera::Wsdb::get_trx(const TrxHandleMas
     {
         /* trx_id is default (-1) search in conn_trx_map using pthread-id */
         pthread_t const id = pthread_self();
-        TrxMap::iterator const i(conn_trx_map_.find(id));
+        ConnTrxMap::iterator const i(conn_trx_map_.find(id));
         if (i == conn_trx_map_.end() && create)
         {
             return create_trx(params, source_id, trx_id);
