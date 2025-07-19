$NetBSD$

Avoid ambiguous function call.

--- percona-xtradb-cluster-galera/galerautils/src/gu_progress.hpp.orig	2022-11-24 10:31:59.814843671 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_progress.hpp
@@ -99,7 +99,7 @@ namespace gu
             last_logged_  (),
             last_log_time_(),
             last_cb_time_ (),
-            total_digits_ (::ceil(::log10(total_ + 1)))
+            total_digits_ (::ceil(std::log10(total_ + 1)))
         {
             gu::datetime::Date const now(gu::datetime::Date::monotonic());
             if (callback_) cb(now);
