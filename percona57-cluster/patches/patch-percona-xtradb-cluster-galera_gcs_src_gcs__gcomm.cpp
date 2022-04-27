$NetBSD$

Disable pthread priority scheduling on SunOS, because the current pthread_setschedparam() approach is not viable on non-global zones.

--- percona-xtradb-cluster-galera/gcs/src/gcs_gcomm.cpp.orig	2022-02-07 19:57:24.000000000 +0000
+++ percona-xtradb-cluster-galera/gcs/src/gcs_gcomm.cpp
@@ -377,9 +377,11 @@ void GCommConn::connect(const string& ch
         Barrier& barrier_;
     } start_barrier(barrier_);
 
+#if !defined(__sun)
     thread_set_schedparam(thd_, schedparam_);
     log_info << "gcomm thread scheduling priority set to "
              << thread_get_schedparam(thd_) << " ";
+#endif
 
     uri_.set_option("gmcast.group", channel);
     tp_ = Transport::create(*net_, uri_);
@@ -558,6 +560,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
                        reinterpret_cast<const byte_t*>(buf) + len)));
 
     int err;
+#if !defined(__sun)
     // Set thread scheduling params if gcomm thread runs with
     // non-default params
     gu::ThreadSchedparam orig_sp;
@@ -573,7 +576,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
             err = e.get_errno();
         }
     }
-
+#endif
 
     {
         gcomm::Critical<Protonet> crit(conn.get_pnet());
@@ -590,6 +593,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
         }
     }
 
+#if !defined(__sun)
     if (conn.schedparam() != gu::ThreadSchedparam::system_default)
     {
         try
@@ -601,6 +605,7 @@ static GCS_BACKEND_SEND_FN(gcomm_send)
             err = e.get_errno();
         }
     }
+#endif
 
     return (err == 0 ? len : -err);
 }
