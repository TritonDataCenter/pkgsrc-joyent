$NetBSD$

Fix path to Python.

--- deps/v8/tools/gyp/v8.gyp.orig	2013-11-12 20:22:12.000000000 +0000
+++ deps/v8/tools/gyp/v8.gyp
@@ -792,7 +792,7 @@
                 '<(SHARED_INTERMEDIATE_DIR)/libraries.cc',
               ],
               'action': [
-                'python',
+                '@PYTHONBIN@',
                 '../../tools/js2c.py',
                 '<@(_outputs)',
                 'CORE',
@@ -810,7 +810,7 @@
                 '<(SHARED_INTERMEDIATE_DIR)/experimental-libraries.cc',
               ],
               'action': [
-                'python',
+                '@PYTHONBIN@',
                 '../../tools/js2c.py',
                 '<@(_outputs)',
                 'EXPERIMENTAL',
@@ -840,7 +840,7 @@
                   '<(SHARED_INTERMEDIATE_DIR)/debug-support.cc',
                 ],
                 'action': [
-                  'python',
+                  '@PYTHONBIN@',
                   '../../tools/gen-postmortem-metadata.py',
                   '<@(_outputs)',
                   '<@(heapobject_files)'
