$NetBSD$

Match prototype (XXX: use POSIX_PTHREAD_SEMANTICS)

--- src/libstd/sys/unix/os.rs.orig	2016-11-08 03:16:18.000000000 +0000
+++ src/libstd/sys/unix/os.rs
@@ -621,7 +621,7 @@ pub fn home_dir() -> Option<PathBuf> {
             // getpwuid_r semantics is different on Illumos/Solaris:
             // http://illumos.org/man/3c/getpwuid_r
             let result = libc::getpwuid_r(me, passwd, buf.as_mut_ptr(),
-                                          buf.capacity() as libc::size_t);
+                                          buf.capacity() as libc::c_int);
             if result.is_null() { None } else { Some(()) }
         }
 
