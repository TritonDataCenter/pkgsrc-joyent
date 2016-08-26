$NetBSD$

Pull in Debian patch to fix something.

--- deps/libgit2-sys-0.4.3/build.rs.orig	2016-04-08 18:17:34.000000000 +0000
+++ deps/libgit2-sys-0.4.3/build.rs
@@ -102,7 +102,6 @@ fn main() {
         cfg.define("USE_OPENSSL", "OFF");
     }
 
-    let _ = fs::remove_dir_all(env::var("OUT_DIR").unwrap());
     t!(fs::create_dir_all(env::var("OUT_DIR").unwrap()));
 
     let dst = cfg.define("BUILD_SHARED_LIBS", "OFF")
