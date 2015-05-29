$NetBSD$

Fix use_system_icu=1 when using host toolset builds.

--- external/v8_3.30.33.16/third_party/icu/icu.gyp.orig	2015-03-30 21:14:22.000000000 +0000
+++ external/v8_3.30.33.16/third_party/icu/icu.gyp
@@ -70,7 +70,7 @@
     'msvs_disabled_warnings': [4005, 4068, 4355, 4996, 4267],
   },
   'conditions': [
-    ['use_system_icu==0 or want_separate_host_toolset==1', {
+    ['use_system_icu==0', {
       'targets': [
         {
           'target_name': 'copy_icudtl_dat',
@@ -406,13 +406,14 @@
               },
             }],
           ],
+          'toolsets': ['host', 'target'],
         },
         {
           'target_name': 'icudata',
           'type': 'none',
           'dependencies': ['system_icu'],
           'export_dependent_settings': ['system_icu'],
-          'toolsets': ['target'],
+          'toolsets': ['host', 'target'],
         },
         {
           'target_name': 'icui18n',
@@ -509,7 +510,7 @@
           'includes': [
             '../../build/shim_headers.gypi',
           ],
-          'toolsets': ['target'],
+          'toolsets': ['host', 'target'],
         },
         {
           'target_name': 'icuuc',
@@ -612,7 +613,7 @@
           'includes': [
             '../../build/shim_headers.gypi',
           ],
-          'toolsets': ['target'],
+          'toolsets': ['host', 'target'],
         },
       ], # targets
     }],
