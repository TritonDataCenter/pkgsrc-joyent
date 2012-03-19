$NetBSD$

--- fixincludes/fixincl.x.orig	2012-03-15 08:17:10.455456559 +0000
+++ fixincludes/fixincl.x
@@ -15,7 +15,7 @@
  * certain ANSI-incompatible system header files which are fixed to work
  * correctly with ANSI C and placed in a directory that GNU C will search.
  *
- * This file contains 210 fixup descriptions.
+ * This file contains 211 fixup descriptions.
  *
  * See README for more information.
  *
@@ -6971,6 +6971,43 @@ static const char* apzSolaris_Int_TypesP
 
 /* * * * * * * * * * * * * * * * * * * * * * * * * *
  *
+ *  Description of Solaris_Posix_Spawn_Restrict fix
+ */
+tSCC zSolaris_Posix_Spawn_RestrictName[] =
+     "solaris_posix_spawn_restrict";
+
+/*
+ *  File name selection pattern
+ */
+tSCC zSolaris_Posix_Spawn_RestrictList[] =
+  "spawn.h\0";
+/*
+ *  Machine/OS name selection pattern
+ */
+tSCC* apzSolaris_Posix_Spawn_RestrictMachs[] = {
+        "*-*-solaris2*",
+        (const char*)NULL };
+
+/*
+ *  content selection pattern - do fix if pattern found
+ */
+tSCC zSolaris_Posix_Spawn_RestrictSelect0[] =
+       "(.*[ \t]+)([a-z]+)\\[_RESTRICT_KYWD\\](.*)";
+
+#define    SOLARIS_POSIX_SPAWN_RESTRICT_TEST_CT  1
+static tTestDesc aSolaris_Posix_Spawn_RestrictTests[] = {
+  { TT_EGREP,    zSolaris_Posix_Spawn_RestrictSelect0, (regex_t*)NULL }, };
+
+/*
+ *  Fix Command Arguments for Solaris_Posix_Spawn_Restrict
+ */
+static const char* apzSolaris_Posix_Spawn_RestrictPatch[] = {
+    "format",
+    "%1*_RESTRICT_KYWD %2%3",
+    (char*)NULL };
+
+/* * * * * * * * * * * * * * * * * * * * * * * * * *
+ *
  *  Description of Solaris_Stdio_Tag fix
  */
 tSCC zSolaris_Stdio_TagName[] =
@@ -8554,9 +8591,9 @@ static const char* apzX11_SprintfPatch[]
  *
  *  List of all fixes
  */
-#define REGEX_COUNT          249
+#define REGEX_COUNT          250
 #define MACH_LIST_SIZE_LIMIT 181
-#define FIX_COUNT            210
+#define FIX_COUNT            211
 
 /*
  *  Enumerate the fixes
@@ -8733,6 +8770,7 @@ typedef enum {
     SOLARIS_INT_LIMITS_2_FIXIDX,
     SOLARIS_INT_LIMITS_3_FIXIDX,
     SOLARIS_INT_TYPES_FIXIDX,
+    SOLARIS_POSIX_SPAWN_RESTRICT_FIXIDX,
     SOLARIS_STDIO_TAG_FIXIDX,
     SOLARIS_SYS_VA_LIST_FIXIDX,
     STATSSWTCH_FIXIDX,
@@ -9630,6 +9668,11 @@ tFixDesc fixDescList[ FIX_COUNT ] = {
      SOLARIS_INT_TYPES_TEST_CT, FD_MACH_ONLY | FD_SUBROUTINE,
      aSolaris_Int_TypesTests,   apzSolaris_Int_TypesPatch, 0 },
 
+  {  zSolaris_Posix_Spawn_RestrictName,    zSolaris_Posix_Spawn_RestrictList,
+     apzSolaris_Posix_Spawn_RestrictMachs,
+     SOLARIS_POSIX_SPAWN_RESTRICT_TEST_CT, FD_MACH_ONLY | FD_SUBROUTINE,
+     aSolaris_Posix_Spawn_RestrictTests,   apzSolaris_Posix_Spawn_RestrictPatch, 0 },
+
   {  zSolaris_Stdio_TagName,    zSolaris_Stdio_TagList,
      apzSolaris_Stdio_TagMachs,
      SOLARIS_STDIO_TAG_TEST_CT, FD_MACH_ONLY,
