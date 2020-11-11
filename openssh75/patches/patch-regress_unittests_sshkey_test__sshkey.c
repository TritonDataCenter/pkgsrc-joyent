$NetBSD$

Fedora openssh-7.3p1-openssl-1.1.0.patch

--- regress/unittests/sshkey/test_sshkey.c.orig	2020-11-11 11:16:04.000000000 +0000
+++ regress/unittests/sshkey/test_sshkey.c
@@ -197,9 +197,6 @@ sshkey_tests(void)
 	k1 = sshkey_new(KEY_RSA1);
 	ASSERT_PTR_NE(k1, NULL);
 	ASSERT_PTR_NE(k1->rsa, NULL);
-	ASSERT_PTR_NE(k1->rsa->n, NULL);
-	ASSERT_PTR_NE(k1->rsa->e, NULL);
-	ASSERT_PTR_EQ(k1->rsa->p, NULL);
 	sshkey_free(k1);
 	TEST_DONE();
 
@@ -207,9 +204,6 @@ sshkey_tests(void)
 	k1 = sshkey_new(KEY_RSA);
 	ASSERT_PTR_NE(k1, NULL);
 	ASSERT_PTR_NE(k1->rsa, NULL);
-	ASSERT_PTR_NE(k1->rsa->n, NULL);
-	ASSERT_PTR_NE(k1->rsa->e, NULL);
-	ASSERT_PTR_EQ(k1->rsa->p, NULL);
 	sshkey_free(k1);
 	TEST_DONE();
 
@@ -217,8 +211,6 @@ sshkey_tests(void)
 	k1 = sshkey_new(KEY_DSA);
 	ASSERT_PTR_NE(k1, NULL);
 	ASSERT_PTR_NE(k1->dsa, NULL);
-	ASSERT_PTR_NE(k1->dsa->g, NULL);
-	ASSERT_PTR_EQ(k1->dsa->priv_key, NULL);
 	sshkey_free(k1);
 	TEST_DONE();
 
@@ -244,9 +236,6 @@ sshkey_tests(void)
 	k1 = sshkey_new_private(KEY_RSA);
 	ASSERT_PTR_NE(k1, NULL);
 	ASSERT_PTR_NE(k1->rsa, NULL);
-	ASSERT_PTR_NE(k1->rsa->n, NULL);
-	ASSERT_PTR_NE(k1->rsa->e, NULL);
-	ASSERT_PTR_NE(k1->rsa->p, NULL);
 	ASSERT_INT_EQ(sshkey_add_private(k1), 0);
 	sshkey_free(k1);
 	TEST_DONE();
@@ -255,8 +244,6 @@ sshkey_tests(void)
 	k1 = sshkey_new_private(KEY_DSA);
 	ASSERT_PTR_NE(k1, NULL);
 	ASSERT_PTR_NE(k1->dsa, NULL);
-	ASSERT_PTR_NE(k1->dsa->g, NULL);
-	ASSERT_PTR_NE(k1->dsa->priv_key, NULL);
 	ASSERT_INT_EQ(sshkey_add_private(k1), 0);
 	sshkey_free(k1);
 	TEST_DONE();
@@ -295,18 +282,13 @@ sshkey_tests(void)
 	ASSERT_INT_EQ(sshkey_generate(KEY_RSA, 1024, &kr), 0);
 	ASSERT_PTR_NE(kr, NULL);
 	ASSERT_PTR_NE(kr->rsa, NULL);
-	ASSERT_PTR_NE(kr->rsa->n, NULL);
-	ASSERT_PTR_NE(kr->rsa->e, NULL);
-	ASSERT_PTR_NE(kr->rsa->p, NULL);
-	ASSERT_INT_EQ(BN_num_bits(kr->rsa->n), 1024);
+	ASSERT_INT_EQ(RSA_bits(kr->rsa), 1024);
 	TEST_DONE();
 
 	TEST_START("generate KEY_DSA");
 	ASSERT_INT_EQ(sshkey_generate(KEY_DSA, 1024, &kd), 0);
 	ASSERT_PTR_NE(kd, NULL);
 	ASSERT_PTR_NE(kd->dsa, NULL);
-	ASSERT_PTR_NE(kd->dsa->g, NULL);
-	ASSERT_PTR_NE(kd->dsa->priv_key, NULL);
 	TEST_DONE();
 
 #ifdef OPENSSL_HAS_ECC
@@ -333,9 +315,6 @@ sshkey_tests(void)
 	ASSERT_PTR_NE(kr, k1);
 	ASSERT_INT_EQ(k1->type, KEY_RSA);
 	ASSERT_PTR_NE(k1->rsa, NULL);
-	ASSERT_PTR_NE(k1->rsa->n, NULL);
-	ASSERT_PTR_NE(k1->rsa->e, NULL);
-	ASSERT_PTR_EQ(k1->rsa->p, NULL);
 	TEST_DONE();
 
 	TEST_START("equal KEY_RSA/demoted KEY_RSA");
@@ -349,8 +328,6 @@ sshkey_tests(void)
 	ASSERT_PTR_NE(kd, k1);
 	ASSERT_INT_EQ(k1->type, KEY_DSA);
 	ASSERT_PTR_NE(k1->dsa, NULL);
-	ASSERT_PTR_NE(k1->dsa->g, NULL);
-	ASSERT_PTR_EQ(k1->dsa->priv_key, NULL);
 	TEST_DONE();
 
 	TEST_START("equal KEY_DSA/demoted KEY_DSA");
