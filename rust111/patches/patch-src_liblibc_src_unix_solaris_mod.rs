$NetBSD$

Additional Solarish support.

--- src/liblibc/src/unix/solaris/mod.rs.orig	2016-07-04 18:04:18.000000000 +0000
+++ src/liblibc/src/unix/solaris/mod.rs
@@ -490,6 +490,9 @@ pub const SIGTERM: ::c_int = 15;
 
 pub const WNOHANG: ::c_int = 0x40;
 
+pub const RTLD_NOW: ::c_int = 0x2;
+pub const RTLD_DEFAULT: *mut ::c_void = -2isize as *mut ::c_void;
+
 pub const PROT_NONE: ::c_int = 0;
 pub const PROT_READ: ::c_int = 1;
 pub const PROT_WRITE: ::c_int = 2;
@@ -705,8 +708,8 @@ pub const IP_TTL: ::c_int = 4;
 pub const IP_HDRINCL: ::c_int = 2;
 pub const IP_ADD_MEMBERSHIP: ::c_int = 19;
 pub const IP_DROP_MEMBERSHIP: ::c_int = 20;
-pub const IPV6_JOIN_GROUP: ::c_int = 9;
-pub const IPV6_LEAVE_GROUP: ::c_int = 10;
+pub const IPV6_ADD_MEMBERSHIP: ::c_int = 9;
+pub const IPV6_DROP_MEMBERSHIP: ::c_int = 10;
 
 pub const TCP_NODELAY: ::c_int = 1;
 pub const TCP_KEEPIDLE: ::c_int = 34;
