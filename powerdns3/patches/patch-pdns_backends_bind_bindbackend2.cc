$NetBSD: patch-pdns_backends_bind_bindbackend2.cc,v 1.2 2013/05/09 20:06:53 joerg Exp $

Resolve boost symbol ambiguity.
--- pdns/backends/bind/bindbackend2.cc.orig	2013-12-17 13:47:33.000000000 +0000
+++ pdns/backends/bind/bindbackend2.cc
@@ -55,7 +55,7 @@
 */
 
 // this map contains BB2DomainInfo structs, each of which contains a *pointer* to domain data
-shared_ptr<Bind2Backend::State> Bind2Backend::s_state;
+boost::shared_ptr<Bind2Backend::State> Bind2Backend::s_state;
 
 /* the model is that all our state hides in s_state. This State instance consists of the id_zone_map, which contains all our zone information, indexed by id.
    Then there is the name_id_map, which allows us to map a query to a zone id.
@@ -69,8 +69,8 @@ shared_ptr<Bind2Backend::State> Bind2Bac
    When it is necessary to change the State, a deep copy is made, which is changed. Afterwards, 
    the s_state pointer is made to point to the new State.
 
-   Anybody who is currently accessing the original holds a reference counted handle (shared_ptr) to it, which means it will stay around
-   To save memory, we hold the records as a shared_ptr as well.
+   Anybody who is currently accessing the original holds a reference counted handle (boost::shared_ptr) to it, which means it will stay around
+   To save memory, we hold the records as a boost::shared_ptr as well.
 
    Changes made to s_state directly should take the s_state_lock, so as to prevent writing to a stale copy.
 */
@@ -144,9 +144,9 @@ void Bind2Backend::setFresh(uint32_t dom
   s_state->id_zone_map[domain_id].d_lastcheck=time(0);
 }
 
-shared_ptr<Bind2Backend::State> Bind2Backend::getState()
+boost::shared_ptr<Bind2Backend::State> Bind2Backend::getState()
 {
-  shared_ptr<State> ret;
+  boost::shared_ptr<State> ret;
   {
     Lock l(&s_state_swap_lock);
     ret = s_state; // is only read from
@@ -161,7 +161,7 @@ bool Bind2Backend::startTransaction(cons
     d_transaction_id=id;
     return true;
   }
-  shared_ptr<State> state = getState(); 
+  boost::shared_ptr<State> state = getState(); 
 
   const BB2DomainInfo &bbd=state->id_zone_map[d_transaction_id=id];
 
@@ -186,7 +186,7 @@ bool Bind2Backend::commitTransaction()
     return true;
   delete d_of;
   d_of=0;
-  shared_ptr<State> state = getState(); 
+  boost::shared_ptr<State> state = getState(); 
 
   // this might fail if s_state was cycled during the AXFR
   if(rename(d_transaction_tmpname.c_str(), state->id_zone_map[d_transaction_id].d_filename.c_str())<0)
@@ -237,7 +237,7 @@ bool Bind2Backend::feedRecord(const DNSR
 {
   string qname=r.qname;
 
-  const shared_ptr<State> state = getState();
+  const boost::shared_ptr<State> state = getState();
   string domain = state->id_zone_map[d_transaction_id].d_name;
 
   if(!stripDomainSuffix(&qname,domain)) 
@@ -273,7 +273,7 @@ bool Bind2Backend::feedRecord(const DNSR
 void Bind2Backend::getUpdatedMasters(vector<DomainInfo> *changedDomains)
 {
   SOAData soadata;
-  shared_ptr<State> state = getState(); 
+  boost::shared_ptr<State> state = getState(); 
 
   for(id_zone_map_t::const_iterator i = state->id_zone_map.begin(); i != state->id_zone_map.end() ; ++i) {
     if(!i->second.d_masters.empty() && this->alsoNotify.empty() && i->second.d_also_notify.empty())
@@ -303,7 +303,7 @@ void Bind2Backend::getUpdatedMasters(vec
 void Bind2Backend::getAllDomains(vector<DomainInfo> *domains) {
   SOAData soadata;
 
-  shared_ptr<State> state = getState(); 
+  boost::shared_ptr<State> state = getState(); 
 
   for(id_zone_map_t::const_iterator i = state->id_zone_map.begin(); i != state->id_zone_map.end() ; ++i) {
     soadata.db=(DNSBackend *)-1; // makes getSOA() skip the cache. 
@@ -323,7 +323,7 @@ void Bind2Backend::getAllDomains(vector<
 
 void Bind2Backend::getUnfreshSlaveInfos(vector<DomainInfo> *unfreshDomains)
 {
-  shared_ptr<State> state = getState();
+  boost::shared_ptr<State> state = getState();
   for(id_zone_map_t::const_iterator i = state->id_zone_map.begin(); i != state->id_zone_map.end() ; ++i) {
     if(i->second.d_masters.empty())
       continue;
@@ -350,7 +350,7 @@ void Bind2Backend::getUnfreshSlaveInfos(
 
 bool Bind2Backend::getDomainInfo(const string &domain, DomainInfo &di)
 {
-  shared_ptr<State> state = getState();
+  boost::shared_ptr<State> state = getState();
   for(id_zone_map_t::const_iterator i = state->id_zone_map.begin(); i != state->id_zone_map.end() ; ++i) { // why is this a linear scan??
     if(pdns_iequals(i->second.d_name,domain)) {
       di.id=i->first;
@@ -377,7 +377,7 @@ bool Bind2Backend::getDomainInfo(const s
 
 void Bind2Backend::alsoNotifies(const string &domain, set<string> *ips)
 {
-  shared_ptr<State> state = getState();
+  boost::shared_ptr<State> state = getState();
   // combine global list with local list
   for(set<string>::iterator i = this->alsoNotify.begin(); i != this->alsoNotify.end(); i++) {
     (*ips).insert(*i);
@@ -411,7 +411,7 @@ static string canonic(string ret)
 /** THIS IS AN INTERNAL FUNCTION! It does moadnsparser prio impedence matching
     This function adds a record to a domain with a certain id. 
     Much of the complication is due to the efforts to benefit from std::string reference counting copy on write semantics */
-void Bind2Backend::insert(shared_ptr<State> stage, int id, const string &qnameu, const QType &qtype, const string &content, int ttl, int prio, const std::string& hashed)
+void Bind2Backend::insert(boost::shared_ptr<State> stage, int id, const string &qnameu, const QType &qtype, const string &content, int ttl, int prio, const std::string& hashed)
 {
   BB2DomainInfo bb2 = stage->id_zone_map[id];
   Bind2DNSRecord bdr;
@@ -467,7 +467,7 @@ void Bind2Backend::insert(shared_ptr<Sta
 
 string Bind2Backend::DLReloadNowHandler(const vector<string>&parts, Utility::pid_t ppid)
 {
-  shared_ptr<State> state = getState();
+  boost::shared_ptr<State> state = getState();
   ostringstream ret;
 
   for(vector<string>::const_iterator i=parts.begin()+1;i<parts.end();++i) {
@@ -489,7 +489,7 @@ string Bind2Backend::DLReloadNowHandler(
 string Bind2Backend::DLDomStatusHandler(const vector<string>&parts, Utility::pid_t ppid)
 {
   ostringstream ret;
-  shared_ptr<State> state = getState();
+  boost::shared_ptr<State> state = getState();
       
   if(parts.size() > 1) {
     for(vector<string>::const_iterator i=parts.begin()+1;i<parts.end();++i) {
@@ -514,7 +514,7 @@ string Bind2Backend::DLDomStatusHandler(
 
 string Bind2Backend::DLListRejectsHandler(const vector<string>&parts, Utility::pid_t ppid)
 {
-  shared_ptr<State> state = getState();
+  boost::shared_ptr<State> state = getState();
 
   ostringstream ret;
   for(id_zone_map_t::iterator j = state->id_zone_map.begin(); j != state->id_zone_map.end(); ++j) 
@@ -536,7 +536,7 @@ Bind2Backend::Bind2Backend(const string
     return;
   }
   
-  s_state = shared_ptr<State>(new State);
+  s_state = boost::shared_ptr<State>(new State);
   if(loadZones) {
     loadConfig();
     s_first=0;
@@ -564,7 +564,7 @@ void Bind2Backend::reload()
     i->second.d_checknow=true;
 }
 
-void Bind2Backend::fixupAuth(shared_ptr<recordstorage_t> records)
+void Bind2Backend::fixupAuth(boost::shared_ptr<recordstorage_t> records)
 {
   pair<recordstorage_t::const_iterator, recordstorage_t::const_iterator> range;
   string sqname;
@@ -593,7 +593,7 @@ void Bind2Backend::fixupAuth(shared_ptr<
   }
 }
 
-void Bind2Backend::doEmptyNonTerminals(shared_ptr<State> stage, int id, bool nsec3zone, NSEC3PARAMRecordContent ns3pr)
+void Bind2Backend::doEmptyNonTerminals(boost::shared_ptr<State> stage, int id, bool nsec3zone, NSEC3PARAMRecordContent ns3pr)
 {
   BB2DomainInfo bb2 = stage->id_zone_map[id];
 
@@ -650,7 +650,7 @@ void Bind2Backend::loadConfig(string* st
   
   static int domain_id=1;
 
-  shared_ptr<State> staging = shared_ptr<State>(new State);
+  boost::shared_ptr<State> staging = boost::shared_ptr<State>(new State);
 
   if(!getArg("config").empty()) {
     BindParser BP;
@@ -730,7 +730,7 @@ void Bind2Backend::loadConfig(string* st
         
           try {
             // we need to allocate a new vector so we don't kill the original, which is still in use!
-            bbd->d_records=shared_ptr<recordstorage_t> (new recordstorage_t()); 
+            bbd->d_records=boost::shared_ptr<recordstorage_t> (new recordstorage_t()); 
 
             ZoneParserTNG zpt(i->filename, i->name, BP.getDirectory());
             DNSResourceRecord rr;
@@ -843,7 +843,7 @@ void Bind2Backend::loadConfig(string* st
 void Bind2Backend::nukeZoneRecords(BB2DomainInfo *bbd)
 {
   bbd->d_loaded=0; // block further access
-  bbd->d_records = shared_ptr<recordstorage_t > (new recordstorage_t);
+  bbd->d_records = boost::shared_ptr<recordstorage_t > (new recordstorage_t);
 }
 
 
@@ -851,14 +851,14 @@ void Bind2Backend::queueReload(BB2Domain
 {
   Lock l(&s_state_lock);
 
-  shared_ptr<State> staging(new State);
+  boost::shared_ptr<State> staging(new State);
 
   // we reload *now* for the time being
 
   try {
     // nukeZoneRecords(bbd); // ? do we need this?
     staging->id_zone_map[bbd->d_id]=s_state->id_zone_map[bbd->d_id];
-    shared_ptr<recordstorage_t > newrecords(new recordstorage_t);
+    boost::shared_ptr<recordstorage_t > newrecords(new recordstorage_t);
     staging->id_zone_map[bbd->d_id].d_records=newrecords;
 
     ZoneParserTNG zpt(bbd->d_filename, bbd->d_name, s_binddirectory);
@@ -954,7 +954,7 @@ bool Bind2Backend::findBeforeAndAfterUnh
 
 bool Bind2Backend::getBeforeAndAfterNamesAbsolute(uint32_t id, const std::string& qname, std::string& unhashed, std::string& before, std::string& after)
 {
-  shared_ptr<State> state = s_state;
+  boost::shared_ptr<State> state = s_state;
   BB2DomainInfo& bbd = state->id_zone_map[id];  
   NSEC3PARAMRecordContent ns3pr;
   string auth=state->id_zone_map[id].d_name;
@@ -1057,7 +1057,7 @@ void Bind2Backend::lookup(const QType &q
   if(mustlog) 
     L<<Logger::Warning<<"Lookup for '"<<qtype.getName()<<"' of '"<<domain<<"'"<<endl;
 
-  shared_ptr<State> state = s_state;
+  boost::shared_ptr<State> state = s_state;
 
   name_id_map_t::const_iterator iditer;
   do {
@@ -1207,7 +1207,7 @@ bool Bind2Backend::handle::get_normal(DN
 
 bool Bind2Backend::list(const string &target, int id)
 {
-  shared_ptr<State> state = s_state;
+  boost::shared_ptr<State> state = s_state;
   if(!state->id_zone_map.count(id))
     return false;
 
@@ -1244,7 +1244,7 @@ bool Bind2Backend::handle::get_list(DNSR
 // this function really is too slow
 bool Bind2Backend::isMaster(const string &name, const string &ip)
 {
-  shared_ptr<State> state = getState(); 
+  boost::shared_ptr<State> state = getState(); 
   for(id_zone_map_t::iterator j=state->id_zone_map.begin(); j!=state->id_zone_map.end();++j) {
     if(j->second.d_name==name) {
       for(vector<string>::const_iterator iter = j->second.d_masters.begin(); iter != j->second.d_masters.end(); ++iter)
@@ -1328,7 +1328,7 @@ bool Bind2Backend::createSlaveDomain(con
   BB2DomainInfo &bbd = s_state->id_zone_map[newid];
 
   bbd.d_id = newid;
-  bbd.d_records = shared_ptr<recordstorage_t >(new recordstorage_t);
+  bbd.d_records = boost::shared_ptr<recordstorage_t >(new recordstorage_t);
   bbd.d_name = domain;
   bbd.setCheckInterval(getArgAsNum("check-interval"));
   bbd.d_masters.push_back(ip);
