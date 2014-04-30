$NetBSD: patch-pdns_backends_bind_bindbackend2.hh,v 1.1 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- pdns/backends/bind/bindbackend2.hh.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/backends/bind/bindbackend2.hh
@@ -109,7 +109,7 @@ public:
 
   uint32_t d_lastnotified; //!< Last serial number we notified our slaves of
 
-  shared_ptr<recordstorage_t > d_records;  //!< the actual records belonging to this domain
+  boost::shared_ptr<recordstorage_t > d_records;  //!< the actual records belonging to this domain
 private:
   time_t getCtime();
   time_t d_checkinterval;
@@ -170,7 +170,7 @@ public:
     id_zone_map_t id_zone_map;
   };
 
-  static void insert(shared_ptr<State> stage, int id, const string &qname, const QType &qtype, const string &content, int ttl=300, int prio=25, const std::string& hashed=string());  
+  static void insert(boost::shared_ptr<State> stage, int id, const string &qname, const QType &qtype, const string &content, int ttl=300, int prio=25, const std::string& hashed=string());  
   void rediscover(string *status=0);
 
   bool isMaster(const string &name, const string &ip);
@@ -181,7 +181,7 @@ public:
   
 private:
   void setupDNSSEC();
-  shared_ptr<SSQLite3> d_dnssecdb;
+  boost::shared_ptr<SSQLite3> d_dnssecdb;
   bool getNSEC3PARAM(const std::string& zname, NSEC3PARAMRecordContent* ns3p);
   class handle
   {
@@ -191,7 +191,7 @@ private:
     
     handle();
 
-    shared_ptr<recordstorage_t > d_records;
+    boost::shared_ptr<recordstorage_t > d_records;
     recordstorage_t::const_iterator d_iter, d_end_iter;
 
     recordstorage_t::const_iterator d_qname_iter;
@@ -214,10 +214,10 @@ private:
   };
 
 
-  static shared_ptr<State> s_state;
+  static boost::shared_ptr<State> s_state;
   static pthread_mutex_t s_state_lock;               //!< lock protecting ???
   static pthread_mutex_t s_state_swap_lock;               
-  static shared_ptr<State> getState();
+  static boost::shared_ptr<State> getState();
   static int s_first;                                  //!< this is raised on construction to prevent multiple instances of us being generated
 
   static string s_binddirectory;                              //!< this is used to store the 'directory' setting of the bind configuration
@@ -237,8 +237,8 @@ private:
   static string DLDomStatusHandler(const vector<string>&parts, Utility::pid_t ppid);
   static string DLListRejectsHandler(const vector<string>&parts, Utility::pid_t ppid);
   static string DLReloadNowHandler(const vector<string>&parts, Utility::pid_t ppid);
-  static void fixupAuth(shared_ptr<recordstorage_t> records);
-  static void doEmptyNonTerminals(shared_ptr<State> stage, int id, bool nsec3zone, NSEC3PARAMRecordContent ns3pr);
+  static void fixupAuth(boost::shared_ptr<recordstorage_t> records);
+  static void doEmptyNonTerminals(boost::shared_ptr<State> stage, int id, bool nsec3zone, NSEC3PARAMRecordContent ns3pr);
   void loadConfig(string *status=0);
   static void nukeZoneRecords(BB2DomainInfo *bbd);
 };
