$NetBSD$

Additional Solarish support.

--- src/libstd/sys/unix/thread.rs.orig	2016-07-04 18:04:09.000000000 +0000
+++ src/libstd/sys/unix/thread.rs
@@ -12,7 +12,6 @@ use prelude::v1::*;
 
 use alloc::boxed::FnBox;
 use cmp;
-#[cfg(not(any(target_env = "newlib", target_os = "solaris")))]
 use ffi::CStr;
 use io;
 use libc;
