$NetBSD$

Disable pthread priority scheduling on SunOS, because the current
pthread_setschedparam() approach is not viable on non-global zones.

--- percona-xtradb-cluster-galera/gcs/src/gcs_gcomm.cpp.orig	2024-11-25 10:01:03.000000000 +0000
+++ percona-xtradb-cluster-galera/gcs/src/gcs_gcomm.cpp
@@ -465,9 +465,11 @@ void GCommConn::connect(string channel,
         gu_throw_system_error(err) << "Failed to create thread";
     }
 
+#if !defined(__sun)
     thread_set_schedparam(thd_, schedparam_);
     log_info << "gcomm thread scheduling priority set to "
              << thread_get_schedparam(thd_) << " ";
+#endif
 
     /* Will throw if an exception was thrown in connect_task. */
     future.get();
@@ -610,6 +612,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
                        reinterpret_cast<const byte_t*>(buf) + len)));
 
     int err;
+#if !defined(__sun)
     // Set thread scheduling params if gcomm thread runs with
     // non-default params
     gu::ThreadSchedparam orig_sp;
@@ -625,7 +628,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
             err = e.get_errno();
         }
     }
-
+#endif
 
     {
         gcomm::Critical<Protonet> crit(conn.get_pnet());
@@ -642,6 +645,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
         }
     }
 
+#if !defined(__sun)
     if (conn.schedparam() != gu::ThreadSchedparam::system_default)
     {
         try
@@ -653,6 +657,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
             err = e.get_errno();
         }
     }
+#endif
 
     return (err == 0 ? len : -err);
 }
