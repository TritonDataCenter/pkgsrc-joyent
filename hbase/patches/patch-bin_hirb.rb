$NetBSD$

--- bin/hirb.rb.orig	2013-01-14 20:40:00.185448323 +0000
+++ bin/hirb.rb
@@ -39,8 +39,8 @@ require 'irb/completion'
 
 # Add the $HBASE_HOME/lib/ruby OR $HBASE_HOME/src/main/ruby/lib directory
 # to the ruby load path so I can load up my HBase ruby modules
-if File.exists?(File.join(File.dirname(__FILE__), "..", "lib", "ruby", "hbase.rb"))
-  $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib", "ruby")
+if File.exists?(File.join(File.dirname(__FILE__), "..", "share", "hbase", "lib", "ruby", "hbase.rb"))
+  $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "share", "hbase", "lib", "ruby")
 else
   $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "src", "main", "ruby")
 end
