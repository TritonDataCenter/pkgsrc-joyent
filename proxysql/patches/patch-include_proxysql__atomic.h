$NetBSD$

Fix build on SunOS.

--- include/proxysql_atomic.h.orig	2017-03-26 11:18:09.000000000 +0000
+++ include/proxysql_atomic.h
@@ -2,7 +2,9 @@
 #define PROXYSQL_ATOMIC 
 /*
 typedef unsigned spinlock;
+#ifndef HAVE_SYNCH_H
 typedef struct _rwlock_t rwlock_t;
+#endif
 struct _rwlock_t {
     spinlock lock;
     unsigned readers;
