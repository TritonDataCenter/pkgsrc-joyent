$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- monitor.c.orig	2017-03-20 02:39:27.000000000 +0000
+++ monitor.c
@@ -581,9 +581,12 @@ mm_answer_moduli(int sock, Buffer *m)
 		return (0);
 	} else {
 		/* Send first bignum */
+		const BIGNUM *p, *g;
+
+		DH_get0_pqg(dh, &p, NULL, &g);
 		buffer_put_char(m, 1);
-		buffer_put_bignum2(m, dh->p);
-		buffer_put_bignum2(m, dh->g);
+		buffer_put_bignum2(m, p);
+		buffer_put_bignum2(m, g);
 
 		DH_free(dh);
 	}
