$NetBSD$

Don't add /usr/local/include by default on Solaris.

--- lib/Frontend/InitHeaderSearch.cpp.orig	2018-01-04 07:43:41.000000000 +0000
+++ lib/Frontend/InitHeaderSearch.cpp
@@ -216,6 +216,7 @@ void InitHeaderSearch::AddDefaultCInclud
     case llvm::Triple::NaCl:
     case llvm::Triple::PS4:
     case llvm::Triple::ELFIAMCU:
+    case llvm::Triple::Solaris:
       break;
     case llvm::Triple::Win32:
       if (triple.getEnvironment() != llvm::Triple::Cygnus)
