$NetBSD$

Sane symbol naming.

--- include/MySQL_Data_Stream.h.orig	2017-04-23 05:15:16.000000000 +0000
+++ include/MySQL_Data_Stream.h
@@ -15,7 +15,7 @@ typedef struct _queue_t {
 	unsigned int partial;
 	PtrSize_t pkt;
 	mysql_hdr hdr;
-} queue_t;
+} ps_queue_t;
 
 
 // this class avoid copying data
@@ -53,9 +53,9 @@ class MySQL_Data_Stream
 	void * operator new(size_t);
 	void operator delete(void *);
 
-	queue_t queueIN;
+	ps_queue_t queueIN;
 	uint64_t pkts_recv; // counter of received packets
-	queue_t queueOUT;
+	ps_queue_t queueOUT;
 	uint64_t pkts_sent; // counter of sent packets
 
 	struct {
