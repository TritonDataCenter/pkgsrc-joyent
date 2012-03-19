$NetBSD$

--- tools/scons/scons-local-1.2.0/SCons/Tool/sunar.py.orig	2011-03-03 06:10:26.000000000 +0000
+++ tools/scons/scons-local-1.2.0/SCons/Tool/sunar.py
@@ -42,7 +42,7 @@ def generate(env):
     """Add Builders and construction variables for ar to an Environment."""
     SCons.Tool.createStaticLibBuilder(env)
     
-    if env.Detect('CC'):
+    if env.Detect('CC') and env['CC'] != 'gcc':
         env['AR']          = 'CC'
         env['ARFLAGS']     = SCons.Util.CLVar('-xar')
         env['ARCOM']       = '$AR $ARFLAGS -o $TARGET $SOURCES'
