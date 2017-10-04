$NetBSD$

--- percona-xtradb-cluster-galera/galerautils/src/gu_progress.hpp.orig	2017-10-04 12:55:51.475551297 +0000
+++ percona-xtradb-cluster-galera/galerautils/src/gu_progress.hpp
@@ -69,7 +69,7 @@ namespace gu
             current_      (0),
             last_size_    (current_),
             last_time_    (),
-            total_digits_ (::ceil(::log10(total_ + 1)))
+            total_digits_ (::ceil(std::log10(total_ + 1)))
         {
             report(gu::datetime::Date::monotonic());
         }
