$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- regress/unittests/sshkey/test_file.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ regress/unittests/sshkey/test_file.c
@@ -46,6 +46,7 @@ sshkey_file_tests(void)
 	struct sshbuf *buf, *pw;
 	BIGNUM *a, *b, *c;
 	char *cp;
+	const BIGNUM *n, *p, *q, *g, *pub_key, *priv_key;
 
 	TEST_START("load passphrase");
 	pw = load_text_file("pw");
@@ -58,7 +59,8 @@ sshkey_file_tests(void)
 	sshbuf_free(buf);
 	ASSERT_PTR_NE(k1, NULL);
 	a = load_bignum("rsa1_1.param.n");
-	ASSERT_BIGNUM_EQ(k1->rsa->n, a);
+	RSA_get0_key(k1->rsa, &n, NULL, NULL);
+	ASSERT_BIGNUM_EQ(n, a);
 	BN_free(a);
 	TEST_DONE();
 
@@ -109,9 +111,11 @@ sshkey_file_tests(void)
 	a = load_bignum("rsa_1.param.n");
 	b = load_bignum("rsa_1.param.p");
 	c = load_bignum("rsa_1.param.q");
-	ASSERT_BIGNUM_EQ(k1->rsa->n, a);
-	ASSERT_BIGNUM_EQ(k1->rsa->p, b);
-	ASSERT_BIGNUM_EQ(k1->rsa->q, c);
+	RSA_get0_key(k1->rsa, &n, NULL, NULL);
+	RSA_get0_factors(k1->rsa, &p, &q);
+	ASSERT_BIGNUM_EQ(n, a);
+	ASSERT_BIGNUM_EQ(p, b);
+	ASSERT_BIGNUM_EQ(q, c);
 	BN_free(a);
 	BN_free(b);
 	BN_free(c);
@@ -200,9 +204,11 @@ sshkey_file_tests(void)
 	a = load_bignum("dsa_1.param.g");
 	b = load_bignum("dsa_1.param.priv");
 	c = load_bignum("dsa_1.param.pub");
-	ASSERT_BIGNUM_EQ(k1->dsa->g, a);
-	ASSERT_BIGNUM_EQ(k1->dsa->priv_key, b);
-	ASSERT_BIGNUM_EQ(k1->dsa->pub_key, c);
+	DSA_get0_pqg(k1->dsa, NULL, NULL, &g);
+	DSA_get0_key(k1->dsa, &pub_key, &priv_key);
+	ASSERT_BIGNUM_EQ(g, a);
+	ASSERT_BIGNUM_EQ(priv_key, b);
+	ASSERT_BIGNUM_EQ(pub_key, c);
 	BN_free(a);
 	BN_free(b);
 	BN_free(c);
