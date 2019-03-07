$NetBSD$

Fix build issue with newer clang.

--- deps/v8/include/v8.h.orig	2016-12-21 12:14:28.000000000 +0000
+++ deps/v8/include/v8.h
@@ -812,14 +812,14 @@ class V8_EXPORT HandleScope {
     return reinterpret_cast<Isolate*>(isolate_);
   }
 
+  static internal::Object** CreateHandle(internal::Isolate* isolate,
+                                         internal::Object* value);
+
  protected:
   V8_INLINE HandleScope() {}
 
   void Initialize(Isolate* isolate);
 
-  static internal::Object** CreateHandle(internal::Isolate* isolate,
-                                         internal::Object* value);
-
  private:
   // Uses heap_object to obtain the current Isolate.
   static internal::Object** CreateHandle(internal::HeapObject* heap_object,
