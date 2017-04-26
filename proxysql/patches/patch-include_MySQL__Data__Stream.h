$NetBSD$

Sane symbol naming.

--- include/MySQL_Data_Stream.h.orig	2017-03-26 11:18:09.000000000 +0000
+++ include/MySQL_Data_Stream.h
@@ -16,7 +16,7 @@ typedef struct _queue_t {
 	//unsigned char *pkt;
 	PtrSize_t pkt;
 	mysql_hdr hdr;
-} queue_t;
+} ps_queue_t;
 
 
 /*
@@ -67,9 +67,9 @@ class MySQL_Data_Stream
 	void * operator new(size_t);
 	void operator delete(void *);
 
-	queue_t queueIN;
+	ps_queue_t queueIN;
 	uint64_t pkts_recv; // counter of received packets
-	queue_t queueOUT;
+	ps_queue_t queueOUT;
 	uint64_t pkts_sent; // counter of sent packets
 
 	struct {
