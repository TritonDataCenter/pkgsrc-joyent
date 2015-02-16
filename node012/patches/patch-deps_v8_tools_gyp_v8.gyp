$NetBSD: patch-deps_v8_tools_gyp_v8.gyp,v 1.1 2013/05/22 15:17:07 mspo Exp $

Fix path to Python.

--- deps/v8/tools/gyp/v8.gyp.orig	2015-02-06 20:04:23.000000000 +0000
+++ deps/v8/tools/gyp/v8.gyp
@@ -1355,7 +1355,7 @@
             'outputs': [
               '<(PRODUCT_DIR)/natives_blob.bin',
             ],
-            'action': ['python', '<@(_inputs)', '<@(_outputs)'],
+            'action': ['@PYTHONBIN@', '<@(_inputs)', '<@(_outputs)'],
           }],
         }],
         ['want_separate_host_toolset==1', {
@@ -1437,7 +1437,7 @@
             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
           ],
           'action': [
-            'python',
+            '@PYTHONBIN@',
             '../../tools/js2c.py',
             '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
             'CORE',
@@ -1464,7 +1464,7 @@
             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
           ],
           'action': [
-            'python',
+            '@PYTHONBIN@',
             '../../tools/js2c.py',
             '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
             'EXPERIMENTAL',
@@ -1502,7 +1502,7 @@
               '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
             ],
             'action': [
-              'python',
+              '@PYTHONBIN@',
               '../../tools/gen-postmortem-metadata.py',
               '<@(_outputs)',
               '<@(heapobject_files)'
