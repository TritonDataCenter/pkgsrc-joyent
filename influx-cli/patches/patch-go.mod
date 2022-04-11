$NetBSD$

Pull in patched survey module with illumos fixes.  Generated with:

  cp -p go.mod go.mod.orig
  go117 mod edit --replace=github.com/AlecAivazis/survey/v2=github.com/jperkin/survey/v2@illumos

--- go.mod.orig	2022-03-18 22:21:12.000000000 +0000
+++ go.mod
@@ -41,3 +41,5 @@ require (
 	golang.org/x/time v0.0.0-20210220033141-f8bda1e9f3ba // indirect
 	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
 )
+
+replace github.com/AlecAivazis/survey/v2 => github.com/jperkin/survey/v2 v2.2.10-0.20220411122235-fc3ed4888ce1
