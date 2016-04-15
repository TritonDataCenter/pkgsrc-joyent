$NetBSD$

Portability.

--- storage/tokudb/PerconaFT/tools/ba_replay.cc.orig	2015-02-25 15:40:56.000000000 +0000
+++ storage/tokudb/PerconaFT/tools/ba_replay.cc
@@ -574,10 +574,10 @@ static void print_result(uint64_t alloca
 static int only_aggregate_reports;
 
 static struct option getopt_options[] = {
-    { "verbose", no_argument, &verbose, 1 },
-    { "only-aggregate-reports", no_argument, &only_aggregate_reports, 1 },
-    { "include-strategy", required_argument, nullptr, 'i' },
-    { "exclude-strategy", required_argument, nullptr, 'x' },
+    { (char *)"verbose", no_argument, &verbose, 1 },
+    { (char *)"only-aggregate-reports", no_argument, &only_aggregate_reports, 1 },
+    { (char *)"include-strategy", required_argument, nullptr, 'i' },
+    { (char *)"exclude-strategy", required_argument, nullptr, 'x' },
     { nullptr, 0, nullptr, 0 },
 };
 
@@ -670,9 +670,9 @@ int main(int argc, char *argv[]) {
     printf(" n_destroy:                 %15" PRIu64 "\n", stats.n_destroy);
     printf("\n");
     printf(" avg_alloc_hot:             %15" PRIu64 "\n", stats.alloc_hot_bytes.mean);
-    printf(" stddev_alloc_hot:          %15" PRIu64 "\n", (uint64_t) sqrt(stats.alloc_hot_bytes.variance));
+    printf(" stddev_alloc_hot:          %15" PRIu64 "\n", (uint64_t) sqrt((long double)stats.alloc_hot_bytes.variance));
     printf(" avg_alloc_cold:            %15" PRIu64 "\n", stats.alloc_cold_bytes.mean);
-    printf(" stddev_alloc_cold:         %15" PRIu64 "\n", (uint64_t) sqrt(stats.alloc_cold_bytes.variance));
+    printf(" stddev_alloc_cold:         %15" PRIu64 "\n", (uint64_t) sqrt((long double)stats.alloc_cold_bytes.variance));
     printf("\n");
 
     return 0;
