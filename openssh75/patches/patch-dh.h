$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- dh.h.orig	2020-11-11 10:57:57.000000000 +0000
+++ dh.h
@@ -42,7 +42,7 @@ DH	*dh_new_group18(void);
 DH	*dh_new_group_fallback(int);
 
 int	 dh_gen_key(DH *, int);
-int	 dh_pub_is_valid(DH *, BIGNUM *);
+int	 dh_pub_is_valid(const DH *, const BIGNUM *);
 
 u_int	 dh_estimate(int);
 
