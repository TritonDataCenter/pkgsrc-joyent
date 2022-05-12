$NetBSD$

Avoid memset_s on NULL pointer.

--- sql/binlog_reader.cc.orig	2022-02-28 19:55:41.000000000 +0000
+++ sql/binlog_reader.cc
@@ -89,7 +89,9 @@ Binlog_event_data_istream::Decryption_bu
 }
 
 bool Binlog_event_data_istream::Decryption_buffer::resize(size_t new_size) {
-  memset_s(m_buffer, m_size, 0, m_size);
+  if (m_buffer != nullptr) {
+    memset_s(m_buffer, m_size, 0, m_size);
+  }
   delete[] m_buffer;
   m_size = 0;
   m_buffer = nullptr;
