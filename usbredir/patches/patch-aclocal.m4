$NetBSD$

--- aclocal.m4.orig	2013-01-22 18:11:37.923794369 +0000
+++ aclocal.m4
@@ -1,4 +1,4 @@
-# generated automatically by aclocal 1.12.2 -*- Autoconf -*-
+# generated automatically by aclocal 1.12.6 -*- Autoconf -*-
 
 # Copyright (C) 1996-2012 Free Software Foundation, Inc.
 
@@ -22,8 +22,7 @@ To do so, use the procedure documented b
 # libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
 #
 #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
-#                 2006, 2007, 2008, 2009, 2010, 2011 Free Software
-#                 Foundation, Inc.
+#                 2006, 2007, 2008 Free Software Foundation, Inc.
 #   Written by Gordon Matzigkeit, 1996
 #
 # This file is free software; the Free Software Foundation gives
@@ -32,8 +31,7 @@ To do so, use the procedure documented b
 
 m4_define([_LT_COPYING], [dnl
 #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
-#                 2006, 2007, 2008, 2009, 2010, 2011 Free Software
-#                 Foundation, Inc.
+#                 2006, 2007, 2008 Free Software Foundation, Inc.
 #   Written by Gordon Matzigkeit, 1996
 #
 #   This file is part of GNU Libtool.
@@ -60,7 +58,7 @@ m4_define([_LT_COPYING], [dnl
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 ])
 
-# serial 57 LT_INIT
+# serial 56 LT_INIT
 
 
 # LT_PREREQ(VERSION)
@@ -89,7 +87,6 @@ esac
 # ------------------
 AC_DEFUN([LT_INIT],
 [AC_PREREQ([2.58])dnl We use AC_INCLUDES_DEFAULT
-AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT])dnl
 AC_BEFORE([$0], [LT_LANG])dnl
 AC_BEFORE([$0], [LT_OUTPUT])dnl
 AC_BEFORE([$0], [LTDL_INIT])dnl
@@ -106,8 +103,6 @@ AC_REQUIRE([LTVERSION_VERSION])dnl
 AC_REQUIRE([LTOBSOLETE_VERSION])dnl
 m4_require([_LT_PROG_LTMAIN])dnl
 
-_LT_SHELL_INIT([SHELL=${CONFIG_SHELL-/bin/sh}])
-
 dnl Parse OPTIONS
 _LT_SET_OPTIONS([$0], [$1])
 
@@ -144,7 +139,7 @@ m4_defun([_LT_CC_BASENAME],
     *) break;;
   esac
 done
-cc_basename=`$ECHO "$cc_temp" | $SED "s%.*/%%; s%^$host_alias-%%"`
+cc_basename=`$ECHO "X$cc_temp" | $Xsed -e 's%.*/%%' -e "s%^$host_alias-%%"`
 ])
 
 
@@ -164,11 +159,6 @@ m4_defun([_LT_FILEUTILS_DEFAULTS],
 m4_defun([_LT_SETUP],
 [AC_REQUIRE([AC_CANONICAL_HOST])dnl
 AC_REQUIRE([AC_CANONICAL_BUILD])dnl
-AC_REQUIRE([_LT_PREPARE_SED_QUOTE_VARS])dnl
-AC_REQUIRE([_LT_PROG_ECHO_BACKSLASH])dnl
-
-_LT_DECL([], [PATH_SEPARATOR], [1], [The PATH separator for the build system])dnl
-dnl
 _LT_DECL([], [host_alias], [0], [The host system])dnl
 _LT_DECL([], [host], [0])dnl
 _LT_DECL([], [host_os], [0])dnl
@@ -191,13 +181,10 @@ _LT_DECL([], [exeext], [0], [Executable
 dnl
 m4_require([_LT_FILEUTILS_DEFAULTS])dnl
 m4_require([_LT_CHECK_SHELL_FEATURES])dnl
-m4_require([_LT_PATH_CONVERSION_FUNCTIONS])dnl
 m4_require([_LT_CMD_RELOAD])dnl
 m4_require([_LT_CHECK_MAGIC_METHOD])dnl
-m4_require([_LT_CHECK_SHAREDLIB_FROM_LINKLIB])dnl
 m4_require([_LT_CMD_OLD_ARCHIVE])dnl
 m4_require([_LT_CMD_GLOBAL_SYMBOLS])dnl
-m4_require([_LT_WITH_SYSROOT])dnl
 
 _LT_CONFIG_LIBTOOL_INIT([
 # See if we are running on zsh, and set the options which allow our
@@ -213,6 +200,7 @@ fi
 _LT_CHECK_OBJDIR
 
 m4_require([_LT_TAG_COMPILER])dnl
+_LT_PROG_ECHO_BACKSLASH
 
 case $host_os in
 aix3*)
@@ -226,6 +214,23 @@ aix3*)
   ;;
 esac
 
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+sed_quote_subst='s/\([["`$\\]]\)/\\\1/g'
+
+# Same as above, but do not quote variable references.
+double_quote_subst='s/\([["`\\]]\)/\\\1/g'
+
+# Sed substitution to delay expansion of an escaped shell variable in a
+# double_quote_subst'ed string.
+delay_variable_subst='s/\\\\\\\\\\\$/\\\\\\$/g'
+
+# Sed substitution to delay expansion of an escaped single quote.
+delay_single_quote_subst='s/'\''/'\'\\\\\\\'\''/g'
+
+# Sed substitution to avoid accidental globbing in evaled expressions
+no_glob_subst='s/\*/\\\*/g'
+
 # Global variables:
 ofile=libtool
 can_build_shared=yes
@@ -266,28 +271,6 @@ _LT_CONFIG_COMMANDS
 ])# _LT_SETUP
 
 
-# _LT_PREPARE_SED_QUOTE_VARS
-# --------------------------
-# Define a few sed substitution that help us do robust quoting.
-m4_defun([_LT_PREPARE_SED_QUOTE_VARS],
-[# Backslashify metacharacters that are still active within
-# double-quoted strings.
-sed_quote_subst='s/\([["`$\\]]\)/\\\1/g'
-
-# Same as above, but do not quote variable references.
-double_quote_subst='s/\([["`\\]]\)/\\\1/g'
-
-# Sed substitution to delay expansion of an escaped shell variable in a
-# double_quote_subst'ed string.
-delay_variable_subst='s/\\\\\\\\\\\$/\\\\\\$/g'
-
-# Sed substitution to delay expansion of an escaped single quote.
-delay_single_quote_subst='s/'\''/'\'\\\\\\\'\''/g'
-
-# Sed substitution to avoid accidental globbing in evaled expressions
-no_glob_subst='s/\*/\\\*/g'
-])
-
 # _LT_PROG_LTMAIN
 # ---------------
 # Note that this code is called both from `configure', and `config.status'
@@ -440,7 +423,7 @@ m4_define([_lt_decl_all_varnames],
 # declaration there will have the same value as in `configure'.  VARNAME
 # must have a single quote delimited value for this to work.
 m4_define([_LT_CONFIG_STATUS_DECLARE],
-[$1='`$ECHO "$][$1" | $SED "$delay_single_quote_subst"`'])
+[$1='`$ECHO "X$][$1" | $Xsed -e "$delay_single_quote_subst"`'])
 
 
 # _LT_CONFIG_STATUS_DECLARATIONS
@@ -450,7 +433,7 @@ m4_define([_LT_CONFIG_STATUS_DECLARE],
 # embedded single quotes properly.  In configure, this macro expands
 # each variable declared with _LT_DECL (and _LT_TAGDECL) into:
 #
-#    <var>='`$ECHO "$<var>" | $SED "$delay_single_quote_subst"`'
+#    <var>='`$ECHO "X$<var>" | $Xsed -e "$delay_single_quote_subst"`'
 m4_defun([_LT_CONFIG_STATUS_DECLARATIONS],
 [m4_foreach([_lt_var], m4_quote(lt_decl_all_varnames),
     [m4_n([_LT_CONFIG_STATUS_DECLARE(_lt_var)])])])
@@ -549,20 +532,12 @@ LTCC='$LTCC'
 LTCFLAGS='$LTCFLAGS'
 compiler='$compiler_DEFAULT'
 
-# A function that is used when there is no print builtin or printf.
-func_fallback_echo ()
-{
-  eval 'cat <<_LTECHO_EOF
-\$[]1
-_LTECHO_EOF'
-}
-
 # Quote evaled strings.
 for var in lt_decl_all_varnames([[ \
 ]], lt_decl_quote_varnames); do
-    case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
+    case \`eval \\\\\$ECHO "X\\\\\$\$var"\` in
     *[[\\\\\\\`\\"\\\$]]*)
-      eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED \\"\\\$sed_quote_subst\\"\\\`\\\\\\""
+      eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"X\\\$\$var\\" | \\\$Xsed -e \\"\\\$sed_quote_subst\\"\\\`\\\\\\""
       ;;
     *)
       eval "lt_\$var=\\\\\\"\\\$\$var\\\\\\""
@@ -573,9 +548,9 @@ done
 # Double-quote double-evaled strings.
 for var in lt_decl_all_varnames([[ \
 ]], lt_decl_dquote_varnames); do
-    case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
+    case \`eval \\\\\$ECHO "X\\\\\$\$var"\` in
     *[[\\\\\\\`\\"\\\$]]*)
-      eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
+      eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"X\\\$\$var\\" | \\\$Xsed -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
       ;;
     *)
       eval "lt_\$var=\\\\\\"\\\$\$var\\\\\\""
@@ -583,38 +558,16 @@ for var in lt_decl_all_varnames([[ \
     esac
 done
 
+# Fix-up fallback echo if it was mangled by the above quoting rules.
+case \$lt_ECHO in
+*'\\\[$]0 --fallback-echo"')dnl "
+  lt_ECHO=\`\$ECHO "X\$lt_ECHO" | \$Xsed -e 's/\\\\\\\\\\\\\\\[$]0 --fallback-echo"\[$]/\[$]0 --fallback-echo"/'\`
+  ;;
+esac
+
 _LT_OUTPUT_LIBTOOL_INIT
 ])
 
-# _LT_GENERATED_FILE_INIT(FILE, [COMMENT])
-# ------------------------------------
-# Generate a child script FILE with all initialization necessary to
-# reuse the environment learned by the parent script, and make the
-# file executable.  If COMMENT is supplied, it is inserted after the
-# `#!' sequence but before initialization text begins.  After this
-# macro, additional text can be appended to FILE to form the body of
-# the child script.  The macro ends with non-zero status if the
-# file could not be fully written (such as if the disk is full).
-m4_ifdef([AS_INIT_GENERATED],
-[m4_defun([_LT_GENERATED_FILE_INIT],[AS_INIT_GENERATED($@)])],
-[m4_defun([_LT_GENERATED_FILE_INIT],
-[m4_require([AS_PREPARE])]dnl
-[m4_pushdef([AS_MESSAGE_LOG_FD])]dnl
-[lt_write_fail=0
-cat >$1 <<_ASEOF || lt_write_fail=1
-#! $SHELL
-# Generated by $as_me.
-$2
-SHELL=\${CONFIG_SHELL-$SHELL}
-export SHELL
-_ASEOF
-cat >>$1 <<\_ASEOF || lt_write_fail=1
-AS_SHELL_SANITIZE
-_AS_PREPARE
-exec AS_MESSAGE_FD>&1
-_ASEOF
-test $lt_write_fail = 0 && chmod +x $1[]dnl
-m4_popdef([AS_MESSAGE_LOG_FD])])])# _LT_GENERATED_FILE_INIT
 
 # LT_OUTPUT
 # ---------
@@ -624,11 +577,20 @@ m4_popdef([AS_MESSAGE_LOG_FD])])])# _LT_
 AC_DEFUN([LT_OUTPUT],
 [: ${CONFIG_LT=./config.lt}
 AC_MSG_NOTICE([creating $CONFIG_LT])
-_LT_GENERATED_FILE_INIT(["$CONFIG_LT"],
-[# Run this file to recreate a libtool stub with the current configuration.])
+cat >"$CONFIG_LT" <<_LTEOF
+#! $SHELL
+# Generated by $as_me.
+# Run this file to recreate a libtool stub with the current configuration.
 
-cat >>"$CONFIG_LT" <<\_LTEOF
 lt_cl_silent=false
+SHELL=\${CONFIG_SHELL-$SHELL}
+_LTEOF
+
+cat >>"$CONFIG_LT" <<\_LTEOF
+AS_SHELL_SANITIZE
+_AS_PREPARE
+
+exec AS_MESSAGE_FD>&1
 exec AS_MESSAGE_LOG_FD>>config.log
 {
   echo
@@ -654,7 +616,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
 m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
 configured by $[0], generated by m4_PACKAGE_STRING.
 
-Copyright (C) 2011 Free Software Foundation, Inc.
+Copyright (C) 2008 Free Software Foundation, Inc.
 This config.lt script is free software; the Free Software Foundation
 gives unlimited permision to copy, distribute and modify it."
 
@@ -699,13 +661,15 @@ chmod +x "$CONFIG_LT"
 # appending to config.log, which fails on DOS, as config.log is still kept
 # open by configure.  Here we exec the FD to /dev/null, effectively closing
 # config.log, so it can be properly (re)opened and appended to by config.lt.
-lt_cl_success=:
-test "$silent" = yes &&
-  lt_config_lt_args="$lt_config_lt_args --quiet"
-exec AS_MESSAGE_LOG_FD>/dev/null
-$SHELL "$CONFIG_LT" $lt_config_lt_args || lt_cl_success=false
-exec AS_MESSAGE_LOG_FD>>config.log
-$lt_cl_success || AS_EXIT(1)
+if test "$no_create" != yes; then
+  lt_cl_success=:
+  test "$silent" = yes &&
+    lt_config_lt_args="$lt_config_lt_args --quiet"
+  exec AS_MESSAGE_LOG_FD>/dev/null
+  $SHELL "$CONFIG_LT" $lt_config_lt_args || lt_cl_success=false
+  exec AS_MESSAGE_LOG_FD>>config.log
+  $lt_cl_success || AS_EXIT(1)
+fi
 ])# LT_OUTPUT
 
 
@@ -768,12 +732,15 @@ _LT_EOF
   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
   # text mode, it properly converts lines to CR/LF.  This bash problem
   # is reportedly fixed, but why not run on old versions too?
-  sed '$q' "$ltmain" >> "$cfgfile" \
-     || (rm -f "$cfgfile"; exit 1)
+  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cfgfile" \
+    || (rm -f "$cfgfile"; exit 1)
+
+  _LT_PROG_XSI_SHELLFNS
 
-  _LT_PROG_REPLACE_SHELLFNS
+  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+    || (rm -f "$cfgfile"; exit 1)
 
-   mv -f "$cfgfile" "$ofile" ||
+  mv -f "$cfgfile" "$ofile" ||
     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
   chmod +x "$ofile"
 ],
@@ -818,7 +785,6 @@ AC_DEFUN([LT_LANG],
 m4_case([$1],
   [C],			[_LT_LANG(C)],
   [C++],		[_LT_LANG(CXX)],
-  [Go],			[_LT_LANG(GO)],
   [Java],		[_LT_LANG(GCJ)],
   [Fortran 77],		[_LT_LANG(F77)],
   [Fortran],		[_LT_LANG(FC)],
@@ -840,29 +806,6 @@ m4_defun([_LT_LANG],
 ])# _LT_LANG
 
 
-m4_ifndef([AC_PROG_GO], [
-# NOTE: This macro has been submitted for inclusion into   #
-#  GNU Autoconf as AC_PROG_GO.  When it is available in    #
-#  a released version of Autoconf we should remove this    #
-#  macro and use it instead.                               #
-m4_defun([AC_PROG_GO],
-[AC_LANG_PUSH(Go)dnl
-AC_ARG_VAR([GOC],     [Go compiler command])dnl
-AC_ARG_VAR([GOFLAGS], [Go compiler flags])dnl
-_AC_ARG_VAR_LDFLAGS()dnl
-AC_CHECK_TOOL(GOC, gccgo)
-if test -z "$GOC"; then
-  if test -n "$ac_tool_prefix"; then
-    AC_CHECK_PROG(GOC, [${ac_tool_prefix}gccgo], [${ac_tool_prefix}gccgo])
-  fi
-fi
-if test -z "$GOC"; then
-  AC_CHECK_PROG(GOC, gccgo, gccgo, false)
-fi
-])#m4_defun
-])#m4_ifndef
-
-
 # _LT_LANG_DEFAULT_CONFIG
 # -----------------------
 m4_defun([_LT_LANG_DEFAULT_CONFIG],
@@ -893,10 +836,6 @@ AC_PROVIDE_IFELSE([AC_PROG_GCJ],
        m4_ifdef([LT_PROG_GCJ],
 	[m4_define([LT_PROG_GCJ], defn([LT_PROG_GCJ])[LT_LANG(GCJ)])])])])])
 
-AC_PROVIDE_IFELSE([AC_PROG_GO],
-  [LT_LANG(GO)],
-  [m4_define([AC_PROG_GO], defn([AC_PROG_GO])[LT_LANG(GO)])])
-
 AC_PROVIDE_IFELSE([LT_PROG_RC],
   [LT_LANG(RC)],
   [m4_define([LT_PROG_RC], defn([LT_PROG_RC])[LT_LANG(RC)])])
@@ -907,13 +846,11 @@ AU_DEFUN([AC_LIBTOOL_CXX], [LT_LANG(C++)
 AU_DEFUN([AC_LIBTOOL_F77], [LT_LANG(Fortran 77)])
 AU_DEFUN([AC_LIBTOOL_FC], [LT_LANG(Fortran)])
 AU_DEFUN([AC_LIBTOOL_GCJ], [LT_LANG(Java)])
-AU_DEFUN([AC_LIBTOOL_RC], [LT_LANG(Windows Resource)])
 dnl aclocal-1.4 backwards compatibility:
 dnl AC_DEFUN([AC_LIBTOOL_CXX], [])
 dnl AC_DEFUN([AC_LIBTOOL_F77], [])
 dnl AC_DEFUN([AC_LIBTOOL_FC], [])
 dnl AC_DEFUN([AC_LIBTOOL_GCJ], [])
-dnl AC_DEFUN([AC_LIBTOOL_RC], [])
 
 
 # _LT_TAG_COMPILER
@@ -999,13 +936,7 @@ m4_defun_once([_LT_REQUIRED_DARWIN_CHECK
 	$LTCC $LTCFLAGS $LDFLAGS -o libconftest.dylib \
 	  -dynamiclib -Wl,-single_module conftest.c 2>conftest.err
         _lt_result=$?
-	# If there is a non-empty error log, and "single_module"
-	# appears in it, assume the flag caused a linker warning
-        if test -s conftest.err && $GREP single_module conftest.err; then
-	  cat conftest.err >&AS_MESSAGE_LOG_FD
-	# Otherwise, if the output was created with a 0 exit code from
-	# the compiler, it worked.
-	elif test -f libconftest.dylib && test $_lt_result -eq 0; then
+	if test -f libconftest.dylib && test ! -s conftest.err && test $_lt_result = 0; then
 	  lt_cv_apple_cc_single_mod=yes
 	else
 	  cat conftest.err >&AS_MESSAGE_LOG_FD
@@ -1013,7 +944,6 @@ m4_defun_once([_LT_REQUIRED_DARWIN_CHECK
 	rm -rf libconftest.dylib*
 	rm -f conftest.*
       fi])
-
     AC_CACHE_CHECK([for -exported_symbols_list linker flag],
       [lt_cv_ld_exported_symbols_list],
       [lt_cv_ld_exported_symbols_list=no
@@ -1025,34 +955,6 @@ m4_defun_once([_LT_REQUIRED_DARWIN_CHECK
 	[lt_cv_ld_exported_symbols_list=no])
 	LDFLAGS="$save_LDFLAGS"
     ])
-
-    AC_CACHE_CHECK([for -force_load linker flag],[lt_cv_ld_force_load],
-      [lt_cv_ld_force_load=no
-      cat > conftest.c << _LT_EOF
-int forced_loaded() { return 2;}
-_LT_EOF
-      echo "$LTCC $LTCFLAGS -c -o conftest.o conftest.c" >&AS_MESSAGE_LOG_FD
-      $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&AS_MESSAGE_LOG_FD
-      echo "$AR cru libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
-      $AR cru libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
-      echo "$RANLIB libconftest.a" >&AS_MESSAGE_LOG_FD
-      $RANLIB libconftest.a 2>&AS_MESSAGE_LOG_FD
-      cat > conftest.c << _LT_EOF
-int main() { return 0;}
-_LT_EOF
-      echo "$LTCC $LTCFLAGS $LDFLAGS -o conftest conftest.c -Wl,-force_load,./libconftest.a" >&AS_MESSAGE_LOG_FD
-      $LTCC $LTCFLAGS $LDFLAGS -o conftest conftest.c -Wl,-force_load,./libconftest.a 2>conftest.err
-      _lt_result=$?
-      if test -s conftest.err && $GREP force_load conftest.err; then
-	cat conftest.err >&AS_MESSAGE_LOG_FD
-      elif test -f conftest && test $_lt_result -eq 0 && $GREP forced_load conftest >/dev/null 2>&1 ; then
-	lt_cv_ld_force_load=yes
-      else
-	cat conftest.err >&AS_MESSAGE_LOG_FD
-      fi
-        rm -f conftest.err libconftest.a conftest conftest.c
-        rm -rf conftest.dSYM
-    ])
     case $host_os in
     rhapsody* | darwin1.[[012]])
       _lt_dar_allow_undefined='${wl}-undefined ${wl}suppress' ;;
@@ -1080,7 +982,7 @@ _LT_EOF
     else
       _lt_dar_export_syms='~$NMEDIT -s $output_objdir/${libname}-symbols.expsym ${lib}'
     fi
-    if test "$DSYMUTIL" != ":" && test "$lt_cv_ld_force_load" = "no"; then
+    if test "$DSYMUTIL" != ":"; then
       _lt_dsymutil='~$DSYMUTIL $lib || :'
     else
       _lt_dsymutil=
@@ -1090,8 +992,8 @@ _LT_EOF
 ])
 
 
-# _LT_DARWIN_LINKER_FEATURES([TAG])
-# ---------------------------------
+# _LT_DARWIN_LINKER_FEATURES
+# --------------------------
 # Checks for linker and compiler features on darwin
 m4_defun([_LT_DARWIN_LINKER_FEATURES],
 [
@@ -1100,13 +1002,7 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
   _LT_TAGVAR(hardcode_direct, $1)=no
   _LT_TAGVAR(hardcode_automatic, $1)=yes
   _LT_TAGVAR(hardcode_shlibpath_var, $1)=unsupported
-  if test "$lt_cv_ld_force_load" = "yes"; then
-    _LT_TAGVAR(whole_archive_flag_spec, $1)='`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience ${wl}-force_load,$conv\"; done; func_echo_all \"$new_convenience\"`'
-    m4_case([$1], [F77], [_LT_TAGVAR(compiler_needs_object, $1)=yes],
-                  [FC],  [_LT_TAGVAR(compiler_needs_object, $1)=yes])
-  else
-    _LT_TAGVAR(whole_archive_flag_spec, $1)=''
-  fi
+  _LT_TAGVAR(whole_archive_flag_spec, $1)=''
   _LT_TAGVAR(link_all_deplibs, $1)=yes
   _LT_TAGVAR(allow_undefined_flag, $1)="$_lt_dar_allow_undefined"
   case $cc_basename in
@@ -1114,7 +1010,7 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
      *) _lt_dar_can_shared=$GCC ;;
   esac
   if test "$_lt_dar_can_shared" = "yes"; then
-    output_verbose_link_cmd=func_echo_all
+    output_verbose_link_cmd=echo
     _LT_TAGVAR(archive_cmds, $1)="\$CC -dynamiclib \$allow_undefined_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring $_lt_dar_single_mod${_lt_dsymutil}"
     _LT_TAGVAR(module_cmds, $1)="\$CC \$allow_undefined_flag -o \$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dsymutil}"
     _LT_TAGVAR(archive_expsym_cmds, $1)="sed 's,^,_,' < \$export_symbols > \$output_objdir/\${libname}-symbols.expsym~\$CC -dynamiclib \$allow_undefined_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring ${_lt_dar_single_mod}${_lt_dar_export_syms}${_lt_dsymutil}"
@@ -1130,141 +1026,202 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
   fi
 ])
 
-# _LT_SYS_MODULE_PATH_AIX([TAGNAME])
-# ----------------------------------
+# _LT_SYS_MODULE_PATH_AIX
+# -----------------------
 # Links a minimal program and checks the executable
 # for the system default hardcoded library path. In most cases,
 # this is /usr/lib:/lib, but when the MPI compilers are used
 # the location of the communication and MPI libs are included too.
 # If we don't find anything, use the default library path according
 # to the aix ld manual.
-# Store the results from the different compilers for each TAGNAME.
-# Allow to override them for all tags through lt_cv_aix_libpath.
 m4_defun([_LT_SYS_MODULE_PATH_AIX],
 [m4_require([_LT_DECL_SED])dnl
-if test "${lt_cv_aix_libpath+set}" = set; then
-  aix_libpath=$lt_cv_aix_libpath
-else
-  AC_CACHE_VAL([_LT_TAGVAR([lt_cv_aix_libpath_], [$1])],
-  [AC_LINK_IFELSE([AC_LANG_PROGRAM],[
-  lt_aix_libpath_sed='[
-      /Import File Strings/,/^$/ {
-	  /^0/ {
-	      s/^0  *\([^ ]*\) *$/\1/
-	      p
-	  }
-      }]'
-  _LT_TAGVAR([lt_cv_aix_libpath_], [$1])=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
-  # Check for a 64-bit object if we didn't find anything.
-  if test -z "$_LT_TAGVAR([lt_cv_aix_libpath_], [$1])"; then
-    _LT_TAGVAR([lt_cv_aix_libpath_], [$1])=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
-  fi],[])
-  if test -z "$_LT_TAGVAR([lt_cv_aix_libpath_], [$1])"; then
-    _LT_TAGVAR([lt_cv_aix_libpath_], [$1])="/usr/lib:/lib"
-  fi
-  ])
-  aix_libpath=$_LT_TAGVAR([lt_cv_aix_libpath_], [$1])
-fi
+AC_LINK_IFELSE(AC_LANG_PROGRAM,[
+lt_aix_libpath_sed='
+    /Import File Strings/,/^$/ {
+	/^0/ {
+	    s/^0  *\(.*\)$/\1/
+	    p
+	}
+    }'
+aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
+# Check for a 64-bit object if we didn't find anything.
+if test -z "$aix_libpath"; then
+  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
+fi],[])
+if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
 ])# _LT_SYS_MODULE_PATH_AIX
 
 
 # _LT_SHELL_INIT(ARG)
 # -------------------
 m4_define([_LT_SHELL_INIT],
-[m4_divert_text([M4SH-INIT], [$1
-])])# _LT_SHELL_INIT
-
+[ifdef([AC_DIVERSION_NOTICE],
+	     [AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)],
+	 [AC_DIVERT_PUSH(NOTICE)])
+$1
+AC_DIVERT_POP
+])# _LT_SHELL_INIT
 
 
 # _LT_PROG_ECHO_BACKSLASH
 # -----------------------
-# Find how we can fake an echo command that does not interpret backslash.
-# In particular, with Autoconf 2.60 or later we add some code to the start
-# of the generated configure script which will find a shell with a builtin
-# printf (which we can use as an echo command).
+# Add some code to the start of the generated configure script which
+# will find an echo command which doesn't interpret backslashes.
 m4_defun([_LT_PROG_ECHO_BACKSLASH],
-[ECHO='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
-ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO
-ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
-
-AC_MSG_CHECKING([how to print strings])
-# Test print first, because it will be a builtin if present.
-if test "X`( print -r -- -n ) 2>/dev/null`" = X-n && \
-   test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
-  ECHO='print -r --'
-elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-  ECHO='printf %s\n'
+[_LT_SHELL_INIT([
+# Check that we are running under the correct shell.
+SHELL=${CONFIG_SHELL-/bin/sh}
+
+case X$lt_ECHO in
+X*--fallback-echo)
+  # Remove one level of quotation (which was required for Make).
+  ECHO=`echo "$lt_ECHO" | sed 's,\\\\\[$]\\[$]0,'[$]0','`
+  ;;
+esac
+
+ECHO=${lt_ECHO-echo}
+if test "X[$]1" = X--no-reexec; then
+  # Discard the --no-reexec flag, and continue.
+  shift
+elif test "X[$]1" = X--fallback-echo; then
+  # Avoid inline document here, it may be left over
+  :
+elif test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t' ; then
+  # Yippee, $ECHO works!
+  :
 else
-  # Use this function as a fallback that always works.
-  func_fallback_echo ()
-  {
-    eval 'cat <<_LTECHO_EOF
-$[]1
-_LTECHO_EOF'
-  }
-  ECHO='func_fallback_echo'
+  # Restart under the correct shell.
+  exec $SHELL "[$]0" --no-reexec ${1+"[$]@"}
 fi
 
-# func_echo_all arg...
-# Invoke $ECHO with all args, space-separated.
-func_echo_all ()
-{
-    $ECHO "$*" 
-}
+if test "X[$]1" = X--fallback-echo; then
+  # used as fallback echo
+  shift
+  cat <<_LT_EOF
+[$]*
+_LT_EOF
+  exit 0
+fi
 
-case "$ECHO" in
-  printf*) AC_MSG_RESULT([printf]) ;;
-  print*) AC_MSG_RESULT([print -r]) ;;
-  *) AC_MSG_RESULT([cat]) ;;
-esac
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+(unset CDPATH) >/dev/null 2>&1 && unset CDPATH
 
-m4_ifdef([_AS_DETECT_SUGGESTED],
-[_AS_DETECT_SUGGESTED([
-  test -n "${ZSH_VERSION+set}${BASH_VERSION+set}" || (
-    ECHO='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
-    ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO
-    ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
-    PATH=/empty FPATH=/empty; export PATH FPATH
-    test "X`printf %s $ECHO`" = "X$ECHO" \
-      || test "X`print -r -- $ECHO`" = "X$ECHO" )])])
+if test -z "$lt_ECHO"; then
+  if test "X${echo_test_string+set}" != Xset; then
+    # find a string as large as possible, as long as the shell can cope with it
+    for cmd in 'sed 50q "[$]0"' 'sed 20q "[$]0"' 'sed 10q "[$]0"' 'sed 2q "[$]0"' 'echo test'; do
+      # expected sizes: less than 2Kb, 1Kb, 512 bytes, 16 bytes, ...
+      if { echo_test_string=`eval $cmd`; } 2>/dev/null &&
+	 { test "X$echo_test_string" = "X$echo_test_string"; } 2>/dev/null
+      then
+        break
+      fi
+    done
+  fi
 
-_LT_DECL([], [SHELL], [1], [Shell to use when invoking shell scripts])
-_LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
-])# _LT_PROG_ECHO_BACKSLASH
+  if test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t' &&
+     echo_testing_string=`{ $ECHO "$echo_test_string"; } 2>/dev/null` &&
+     test "X$echo_testing_string" = "X$echo_test_string"; then
+    :
+  else
+    # The Solaris, AIX, and Digital Unix default echo programs unquote
+    # backslashes.  This makes it impossible to quote backslashes using
+    #   echo "$something" | sed 's/\\/\\\\/g'
+    #
+    # So, first we look for a working echo in the user's PATH.
 
+    lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
+    for dir in $PATH /usr/ucb; do
+      IFS="$lt_save_ifs"
+      if (test -f $dir/echo || test -f $dir/echo$ac_exeext) &&
+         test "X`($dir/echo '\t') 2>/dev/null`" = 'X\t' &&
+         echo_testing_string=`($dir/echo "$echo_test_string") 2>/dev/null` &&
+         test "X$echo_testing_string" = "X$echo_test_string"; then
+        ECHO="$dir/echo"
+        break
+      fi
+    done
+    IFS="$lt_save_ifs"
 
-# _LT_WITH_SYSROOT
-# ----------------
-AC_DEFUN([_LT_WITH_SYSROOT],
-[AC_MSG_CHECKING([for sysroot])
-AC_ARG_WITH([sysroot],
-[  --with-sysroot[=DIR] Search for dependent libraries within DIR
-                        (or the compiler's sysroot if not specified).],
-[], [with_sysroot=no])
-
-dnl lt_sysroot will always be passed unquoted.  We quote it here
-dnl in case the user passed a directory name.
-lt_sysroot=
-case ${with_sysroot} in #(
- yes)
-   if test "$GCC" = yes; then
-     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
-   fi
-   ;; #(
- /*)
-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
-   ;; #(
- no|'')
-   ;; #(
- *)
-   AC_MSG_RESULT([${with_sysroot}])
-   AC_MSG_ERROR([The sysroot must be an absolute path.])
-   ;;
-esac
+    if test "X$ECHO" = Xecho; then
+      # We didn't find a better echo, so look for alternatives.
+      if test "X`{ print -r '\t'; } 2>/dev/null`" = 'X\t' &&
+         echo_testing_string=`{ print -r "$echo_test_string"; } 2>/dev/null` &&
+         test "X$echo_testing_string" = "X$echo_test_string"; then
+        # This shell has a builtin print -r that does the trick.
+        ECHO='print -r'
+      elif { test -f /bin/ksh || test -f /bin/ksh$ac_exeext; } &&
+	   test "X$CONFIG_SHELL" != X/bin/ksh; then
+        # If we have ksh, try running configure again with it.
+        ORIGINAL_CONFIG_SHELL=${CONFIG_SHELL-/bin/sh}
+        export ORIGINAL_CONFIG_SHELL
+        CONFIG_SHELL=/bin/ksh
+        export CONFIG_SHELL
+        exec $CONFIG_SHELL "[$]0" --no-reexec ${1+"[$]@"}
+      else
+        # Try using printf.
+        ECHO='printf %s\n'
+        if test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t' &&
+	   echo_testing_string=`{ $ECHO "$echo_test_string"; } 2>/dev/null` &&
+	   test "X$echo_testing_string" = "X$echo_test_string"; then
+	  # Cool, printf works
+	  :
+        elif echo_testing_string=`($ORIGINAL_CONFIG_SHELL "[$]0" --fallback-echo '\t') 2>/dev/null` &&
+	     test "X$echo_testing_string" = 'X\t' &&
+	     echo_testing_string=`($ORIGINAL_CONFIG_SHELL "[$]0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
+	     test "X$echo_testing_string" = "X$echo_test_string"; then
+	  CONFIG_SHELL=$ORIGINAL_CONFIG_SHELL
+	  export CONFIG_SHELL
+	  SHELL="$CONFIG_SHELL"
+	  export SHELL
+	  ECHO="$CONFIG_SHELL [$]0 --fallback-echo"
+        elif echo_testing_string=`($CONFIG_SHELL "[$]0" --fallback-echo '\t') 2>/dev/null` &&
+	     test "X$echo_testing_string" = 'X\t' &&
+	     echo_testing_string=`($CONFIG_SHELL "[$]0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
+	     test "X$echo_testing_string" = "X$echo_test_string"; then
+	  ECHO="$CONFIG_SHELL [$]0 --fallback-echo"
+        else
+	  # maybe with a smaller string...
+	  prev=:
+
+	  for cmd in 'echo test' 'sed 2q "[$]0"' 'sed 10q "[$]0"' 'sed 20q "[$]0"' 'sed 50q "[$]0"'; do
+	    if { test "X$echo_test_string" = "X`eval $cmd`"; } 2>/dev/null
+	    then
+	      break
+	    fi
+	    prev="$cmd"
+	  done
+
+	  if test "$prev" != 'sed 50q "[$]0"'; then
+	    echo_test_string=`eval $prev`
+	    export echo_test_string
+	    exec ${ORIGINAL_CONFIG_SHELL-${CONFIG_SHELL-/bin/sh}} "[$]0" ${1+"[$]@"}
+	  else
+	    # Oops.  We lost completely, so just stick with echo.
+	    ECHO=echo
+	  fi
+        fi
+      fi
+    fi
+  fi
+fi
+
+# Copy echo and quote the copy suitably for passing to libtool from
+# the Makefile, instead of quoting the original, which is used later.
+lt_ECHO=$ECHO
+if test "X$lt_ECHO" = "X$CONFIG_SHELL [$]0 --fallback-echo"; then
+   lt_ECHO="$CONFIG_SHELL \\\$\[$]0 --fallback-echo"
+fi
+
+AC_SUBST(lt_ECHO)
+])
+_LT_DECL([], [SHELL], [1], [Shell to use when invoking shell scripts])
+_LT_DECL([], [ECHO], [1],
+    [An echo program that does not interpret backslashes])
+])# _LT_PROG_ECHO_BACKSLASH
 
- AC_MSG_RESULT([${lt_sysroot:-no}])
-_LT_DECL([], [lt_sysroot], [0], [The root where to search for ]dnl
-[dependent libraries, and in which our libraries should be installed.])])
 
 # _LT_ENABLE_LOCK
 # ---------------
@@ -1294,7 +1251,7 @@ ia64-*-hpux*)
   ;;
 *-*-irix6*)
   # Find out which ABI we are using.
-  echo '[#]line '$LINENO' "configure"' > conftest.$ac_ext
+  echo '[#]line __oline__ "configure"' > conftest.$ac_ext
   if AC_TRY_EVAL(ac_compile); then
     if test "$lt_cv_prog_gnu_ld" = yes; then
       case `/usr/bin/file conftest.$ac_objext` in
@@ -1387,27 +1344,14 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*
     CFLAGS="$SAVE_CFLAGS"
   fi
   ;;
-*-*solaris*)
+sparc*-*solaris*)
   # Find out which ABI we are using.
   echo 'int i;' > conftest.$ac_ext
   if AC_TRY_EVAL(ac_compile); then
     case `/usr/bin/file conftest.o` in
     *64-bit*)
       case $lt_cv_prog_gnu_ld in
-      yes*)
-        case $host in
-        i?86-*-solaris*)
-          LD="${LD-ld} -m elf_x86_64"
-          ;;
-        sparc*-*-solaris*)
-          LD="${LD-ld} -m elf64_sparc"
-          ;;
-        esac
-        # GNU ld 2.21 introduced _sol2 emulations.  Use them if available.
-        if ${LD-ld} -V | grep _sol2 >/dev/null 2>&1; then
-          LD="${LD-ld}_sol2"
-        fi
-        ;;
+      yes*) LD="${LD-ld} -m elf64_sparc" ;;
       *)
 	if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; then
 	  LD="${LD-ld} -64"
@@ -1425,47 +1369,14 @@ need_locks="$enable_libtool_lock"
 ])# _LT_ENABLE_LOCK
 
 
-# _LT_PROG_AR
-# -----------
-m4_defun([_LT_PROG_AR],
-[AC_CHECK_TOOLS(AR, [ar], false)
-: ${AR=ar}
-: ${AR_FLAGS=cru}
-_LT_DECL([], [AR], [1], [The archiver])
-_LT_DECL([], [AR_FLAGS], [1], [Flags to create an archive])
-
-AC_CACHE_CHECK([for archiver @FILE support], [lt_cv_ar_at_file],
-  [lt_cv_ar_at_file=no
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM],
-     [echo conftest.$ac_objext > conftest.lst
-      lt_ar_try='$AR $AR_FLAGS libconftest.a @conftest.lst >&AS_MESSAGE_LOG_FD'
-      AC_TRY_EVAL([lt_ar_try])
-      if test "$ac_status" -eq 0; then
-	# Ensure the archiver fails upon bogus file names.
-	rm -f conftest.$ac_objext libconftest.a
-	AC_TRY_EVAL([lt_ar_try])
-	if test "$ac_status" -ne 0; then
-          lt_cv_ar_at_file=@
-        fi
-      fi
-      rm -f conftest.* libconftest.a
-     ])
-  ])
-
-if test "x$lt_cv_ar_at_file" = xno; then
-  archiver_list_spec=
-else
-  archiver_list_spec=$lt_cv_ar_at_file
-fi
-_LT_DECL([], [archiver_list_spec], [1],
-  [How to feed a file listing to the archiver])
-])# _LT_PROG_AR
-
-
 # _LT_CMD_OLD_ARCHIVE
 # -------------------
 m4_defun([_LT_CMD_OLD_ARCHIVE],
-[_LT_PROG_AR
+[AC_CHECK_TOOL(AR, ar, false)
+test -z "$AR" && AR=ar
+test -z "$AR_FLAGS" && AR_FLAGS=cru
+_LT_DECL([], [AR], [1], [The archiver])
+_LT_DECL([], [AR_FLAGS], [1])
 
 AC_CHECK_TOOL(STRIP, strip, :)
 test -z "$STRIP" && STRIP=:
@@ -1484,27 +1395,18 @@ old_postuninstall_cmds=
 if test -n "$RANLIB"; then
   case $host_os in
   openbsd*)
-    old_postinstall_cmds="$old_postinstall_cmds~\$RANLIB -t \$tool_oldlib"
+    old_postinstall_cmds="$old_postinstall_cmds~\$RANLIB -t \$oldlib"
     ;;
   *)
-    old_postinstall_cmds="$old_postinstall_cmds~\$RANLIB \$tool_oldlib"
+    old_postinstall_cmds="$old_postinstall_cmds~\$RANLIB \$oldlib"
     ;;
   esac
-  old_archive_cmds="$old_archive_cmds~\$RANLIB \$tool_oldlib"
+  old_archive_cmds="$old_archive_cmds~\$RANLIB \$oldlib"
 fi
-
-case $host_os in
-  darwin*)
-    lock_old_archive_extraction=yes ;;
-  *)
-    lock_old_archive_extraction=no ;;
-esac
 _LT_DECL([], [old_postinstall_cmds], [2])
 _LT_DECL([], [old_postuninstall_cmds], [2])
 _LT_TAGDECL([], [old_archive_cmds], [2],
     [Commands used to build an old-style archive])
-_LT_DECL([], [lock_old_archive_extraction], [0],
-    [Whether to use a lock for old archive extraction])
 ])# _LT_CMD_OLD_ARCHIVE
 
 
@@ -1529,15 +1431,15 @@ AC_CACHE_CHECK([$1], [$2],
    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
    -e 's: [[^ ]]*conftest\.: $lt_compiler_flag&:; t' \
    -e 's:$: $lt_compiler_flag:'`
-   (eval echo "\"\$as_me:$LINENO: $lt_compile\"" >&AS_MESSAGE_LOG_FD)
+   (eval echo "\"\$as_me:__oline__: $lt_compile\"" >&AS_MESSAGE_LOG_FD)
    (eval "$lt_compile" 2>conftest.err)
    ac_status=$?
    cat conftest.err >&AS_MESSAGE_LOG_FD
-   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
+   echo "$as_me:__oline__: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
    if (exit $ac_status) && test -s "$ac_outfile"; then
      # The compiler can only warn and ignore the option if not recognized
      # So say no if there are warnings other than the usual output.
-     $ECHO "$_lt_compiler_boilerplate" | $SED '/^$/d' >conftest.exp
+     $ECHO "X$_lt_compiler_boilerplate" | $Xsed -e '/^$/d' >conftest.exp
      $SED '/^$/d; /^ *+/d' conftest.err >conftest.er2
      if test ! -s conftest.er2 || diff conftest.exp conftest.er2 >/dev/null; then
        $2=yes
@@ -1577,7 +1479,7 @@ AC_CACHE_CHECK([$1], [$2],
      if test -s conftest.err; then
        # Append any errors to the config.log.
        cat conftest.err 1>&AS_MESSAGE_LOG_FD
-       $ECHO "$_lt_linker_boilerplate" | $SED '/^$/d' > conftest.exp
+       $ECHO "X$_lt_linker_boilerplate" | $Xsed -e '/^$/d' > conftest.exp
        $SED '/^$/d; /^ *+/d' conftest.err >conftest.er2
        if diff conftest.exp conftest.er2 >/dev/null; then
          $2=yes
@@ -1640,11 +1542,6 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
     lt_cv_sys_max_cmd_len=8192;
     ;;
 
-  mint*)
-    # On MiNT this can take a long time and run out of memory.
-    lt_cv_sys_max_cmd_len=8192;
-    ;;
-
   amigaos*)
     # On AmigaOS with pdksh, this test takes hours, literally.
     # So we just punt and use a minimum line length of 8192.
@@ -1670,11 +1567,6 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
     lt_cv_sys_max_cmd_len=196608
     ;;
 
-  os2*)
-    # The test takes a long time on OS/2.
-    lt_cv_sys_max_cmd_len=8192
-    ;;
-
   osf*)
     # Dr. Hans Ekkehard Plesser reports seeing a kernel panic running configure
     # due to this test when exec_disable_arg_limit is 1 on Tru64. It is not
@@ -1714,8 +1606,8 @@ AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [d
       # If test is not a shell built-in, we'll probably end up computing a
       # maximum length that is only half of the actual maximum length, but
       # we can't tell.
-      while { test "X"`env echo "$teststring$teststring" 2>/dev/null` \
-	         = "X$teststring$teststring"; } >/dev/null 2>&1 &&
+      while { test "X"`$SHELL [$]0 --fallback-echo "X$teststring$teststring" 2>/dev/null` \
+	         = "XX$teststring$teststring"; } >/dev/null 2>&1 &&
 	      test $i != 17 # 1/2 MB should be enough
       do
         i=`expr $i + 1`
@@ -1766,7 +1658,7 @@ else
   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
   lt_status=$lt_dlunknown
   cat > conftest.$ac_ext <<_LT_EOF
-[#line $LINENO "configure"
+[#line __oline__ "configure"
 #include "confdefs.h"
 
 #if HAVE_DLFCN_H
@@ -1807,13 +1699,7 @@ else
 #  endif
 #endif
 
-/* When -fvisbility=hidden is used, assume the code has been annotated
-   correspondingly for the symbols needed.  */
-#if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
-int fnord () __attribute__((visibility("default")));
-#endif
-
-int fnord () { return 42; }
+void fnord() { int i=42;}
 int main ()
 {
   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
@@ -1822,11 +1708,7 @@ int main ()
   if (self)
     {
       if (dlsym (self,"fnord"))       status = $lt_dlno_uscore;
-      else
-        {
-	  if (dlsym( self,"_fnord"))  status = $lt_dlneed_uscore;
-          else puts (dlerror ());
-	}
+      else if (dlsym( self,"_fnord")) status = $lt_dlneed_uscore;
       /* dlclose (self); */
     }
   else
@@ -2002,16 +1884,16 @@ AC_CACHE_CHECK([if $compiler supports -c
    -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
    -e 's: [[^ ]]*conftest\.: $lt_compiler_flag&:; t' \
    -e 's:$: $lt_compiler_flag:'`
-   (eval echo "\"\$as_me:$LINENO: $lt_compile\"" >&AS_MESSAGE_LOG_FD)
+   (eval echo "\"\$as_me:__oline__: $lt_compile\"" >&AS_MESSAGE_LOG_FD)
    (eval "$lt_compile" 2>out/conftest.err)
    ac_status=$?
    cat out/conftest.err >&AS_MESSAGE_LOG_FD
-   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
+   echo "$as_me:__oline__: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
    if (exit $ac_status) && test -s out/conftest2.$ac_objext
    then
      # The compiler can only warn and ignore the option if not recognized
      # So say no if there are warnings
-     $ECHO "$_lt_compiler_boilerplate" | $SED '/^$/d' > out/conftest.exp
+     $ECHO "X$_lt_compiler_boilerplate" | $Xsed -e '/^$/d' > out/conftest.exp
      $SED '/^$/d; /^ *+/d' out/conftest.err >out/conftest.er2
      if test ! -s out/conftest.er2 || diff out/conftest.exp out/conftest.er2 >/dev/null; then
        _LT_TAGVAR(lt_cv_prog_compiler_c_o, $1)=yes
@@ -2170,7 +2052,6 @@ m4_require([_LT_DECL_EGREP])dnl
 m4_require([_LT_FILEUTILS_DEFAULTS])dnl
 m4_require([_LT_DECL_OBJDUMP])dnl
 m4_require([_LT_DECL_SED])dnl
-m4_require([_LT_CHECK_SHELL_FEATURES])dnl
 AC_MSG_CHECKING([dynamic linker characteristics])
 m4_if([$1],
 	[], [
@@ -2179,23 +2060,16 @@ if test "$GCC" = yes; then
     darwin*) lt_awk_arg="/^libraries:/,/LR/" ;;
     *) lt_awk_arg="/^libraries:/" ;;
   esac
-  case $host_os in
-    mingw* | cegcc*) lt_sed_strip_eq="s,=\([[A-Za-z]]:\),\1,g" ;;
-    *) lt_sed_strip_eq="s,=/,/,g" ;;
-  esac
-  lt_search_path_spec=`$CC -print-search-dirs | awk $lt_awk_arg | $SED -e "s/^libraries://" -e $lt_sed_strip_eq`
-  case $lt_search_path_spec in
-  *\;*)
+  lt_search_path_spec=`$CC -print-search-dirs | awk $lt_awk_arg | $SED -e "s/^libraries://" -e "s,=/,/,g"`
+  if $ECHO "$lt_search_path_spec" | $GREP ';' >/dev/null ; then
     # if the path contains ";" then we assume it to be the separator
     # otherwise default to the standard path separator (i.e. ":") - it is
     # assumed that no part of a normal pathname contains ";" but that should
     # okay in the real world where ";" in dirpaths is itself problematic.
-    lt_search_path_spec=`$ECHO "$lt_search_path_spec" | $SED 's/;/ /g'`
-    ;;
-  *)
-    lt_search_path_spec=`$ECHO "$lt_search_path_spec" | $SED "s/$PATH_SEPARATOR/ /g"`
-    ;;
-  esac
+    lt_search_path_spec=`$ECHO "$lt_search_path_spec" | $SED -e 's/;/ /g'`
+  else
+    lt_search_path_spec=`$ECHO "$lt_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
+  fi
   # Ok, now we have the path, separated by spaces, we can step through it
   # and add multilib dir if necessary.
   lt_tmp_lt_search_path_spec=
@@ -2208,7 +2082,7 @@ if test "$GCC" = yes; then
 	lt_tmp_lt_search_path_spec="$lt_tmp_lt_search_path_spec $lt_sys_path"
     fi
   done
-  lt_search_path_spec=`$ECHO "$lt_tmp_lt_search_path_spec" | awk '
+  lt_search_path_spec=`$ECHO $lt_tmp_lt_search_path_spec | awk '
 BEGIN {RS=" "; FS="/|\n";} {
   lt_foo="";
   lt_count=0;
@@ -2228,13 +2102,7 @@ BEGIN {RS=" "; FS="/|\n";} {
   if (lt_foo != "") { lt_freq[[lt_foo]]++; }
   if (lt_freq[[lt_foo]] == 1) { print lt_foo; }
 }'`
-  # AWK program above erroneously prepends '/' to C:/dos/paths
-  # for these hosts.
-  case $host_os in
-    mingw* | cegcc*) lt_search_path_spec=`$ECHO "$lt_search_path_spec" |\
-      $SED 's,/\([[A-Za-z]]:\),\1,g'` ;;
-  esac
-  sys_lib_search_path_spec=`$ECHO "$lt_search_path_spec" | $lt_NL2SP`
+  sys_lib_search_path_spec=`$ECHO $lt_search_path_spec`
 else
   sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
 fi])
@@ -2260,7 +2128,7 @@ need_version=unknown
 
 case $host_os in
 aix3*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   library_names_spec='${libname}${release}${shared_ext}$versuffix $libname.a'
   shlibpath_var=LIBPATH
 
@@ -2269,7 +2137,7 @@ aix3*)
   ;;
 
 aix[[4-9]]*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   hardcode_into_libs=yes
@@ -2322,7 +2190,7 @@ amigaos*)
   m68k)
     library_names_spec='$libname.ixlibrary $libname.a'
     # Create ${libname}_ixlibrary.a entries in /sys/libs.
-    finish_eval='for lib in `ls $libdir/*.ixlibrary 2>/dev/null`; do libname=`func_echo_all "$lib" | $SED '\''s%^.*/\([[^/]]*\)\.ixlibrary$%\1%'\''`; test $RM /sys/libs/${libname}_ixlibrary.a; $show "cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a"; cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a || exit 1; done'
+    finish_eval='for lib in `ls $libdir/*.ixlibrary 2>/dev/null`; do libname=`$ECHO "X$lib" | $Xsed -e '\''s%^.*/\([[^/]]*\)\.ixlibrary$%\1%'\''`; test $RM /sys/libs/${libname}_ixlibrary.a; $show "cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a"; cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a || exit 1; done'
     ;;
   esac
   ;;
@@ -2334,7 +2202,7 @@ beos*)
   ;;
 
 bsdi[[45]]*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
   soname_spec='${libname}${release}${shared_ext}$major'
@@ -2353,9 +2221,8 @@ cygwin* | mingw* | pw32* | cegcc*)
   need_version=no
   need_lib_prefix=no
 
-  case $GCC,$cc_basename in
-  yes,*)
-    # gcc
+  case $GCC,$host_os in
+  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
     library_names_spec='$libname.dll.a'
     # DLL is installed to $(libdir)/../bin by postinstall_cmds
     postinstall_cmds='base_file=`basename \${file}`~
@@ -2376,83 +2243,36 @@ cygwin* | mingw* | pw32* | cegcc*)
     cygwin*)
       # Cygwin DLLs use 'cyg' prefix rather than 'lib'
       soname_spec='`echo ${libname} | sed -e 's/^lib/cyg/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
-m4_if([$1], [],[
-      sys_lib_search_path_spec="$sys_lib_search_path_spec /usr/lib/w32api"])
+      sys_lib_search_path_spec="/usr/lib /lib/w32api /lib /usr/local/lib"
       ;;
     mingw* | cegcc*)
       # MinGW DLLs use traditional 'lib' prefix
       soname_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
-      ;;
-    pw32*)
-      # pw32 DLLs use 'pw' prefix rather than 'lib'
-      library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
-      ;;
-    esac
-    dynamic_linker='Win32 ld.exe'
-    ;;
-
-  *,cl*)
-    # Native MSVC
-    libname_spec='$name'
-    soname_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
-    library_names_spec='${libname}.dll.lib'
-
-    case $build_os in
-    mingw*)
-      sys_lib_search_path_spec=
-      lt_save_ifs=$IFS
-      IFS=';'
-      for lt_path in $LIB
-      do
-        IFS=$lt_save_ifs
-        # Let DOS variable expansion print the short 8.3 style file name.
-        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
-        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
-      done
-      IFS=$lt_save_ifs
-      # Convert to MSYS style.
-      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([[a-zA-Z]]\\):| /\\1|g' -e 's|^ ||'`
-      ;;
-    cygwin*)
-      # Convert to unix form, then to dos form, then back to unix form
-      # but this time dos style (no spaces!) so that the unix form looks
-      # like /cygdrive/c/PROGRA~1:/cygdr...
-      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
-      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
-      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
-      ;;
-    *)
-      sys_lib_search_path_spec="$LIB"
+      sys_lib_search_path_spec=`$CC -print-search-dirs | $GREP "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
       if $ECHO "$sys_lib_search_path_spec" | [$GREP ';[c-zC-Z]:/' >/dev/null]; then
-        # It is most probably a Windows format PATH.
+        # It is most probably a Windows format PATH printed by
+        # mingw gcc, but we are running on Cygwin. Gcc prints its search
+        # path with ; separators, and with drive letters. We can handle the
+        # drive letters (cygwin fileutils understands them), so leave them,
+        # especially as we might pass files found there to a mingw objdump,
+        # which wouldn't understand a cygwinified path. Ahh.
         sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
       else
-        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
+        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
       fi
-      # FIXME: find the short name or the path components, as spaces are
-      # common. (e.g. "Program Files" -> "PROGRA~1")
+      ;;
+    pw32*)
+      # pw32 DLLs use 'pw' prefix rather than 'lib'
+      library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
       ;;
     esac
-
-    # DLL is installed to $(libdir)/../bin by postinstall_cmds
-    postinstall_cmds='base_file=`basename \${file}`~
-      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
-      dldir=$destdir/`dirname \$dlpath`~
-      test -d \$dldir || mkdir -p \$dldir~
-      $install_prog $dir/$dlname \$dldir/$dlname'
-    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
-      dlpath=$dir/\$dldll~
-       $RM \$dlpath'
-    shlibpath_overrides_runpath=yes
-    dynamic_linker='Win32 link.exe'
     ;;
 
   *)
-    # Assume MSVC wrapper
     library_names_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext} $libname.lib'
-    dynamic_linker='Win32 ld.exe'
     ;;
   esac
+  dynamic_linker='Win32 ld.exe'
   # FIXME: first we should search . and the directory the executable is in
   shlibpath_var=PATH
   ;;
@@ -2473,7 +2293,7 @@ m4_if([$1], [],[
   ;;
 
 dgux*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname$shared_ext'
@@ -2481,6 +2301,10 @@ dgux*)
   shlibpath_var=LD_LIBRARY_PATH
   ;;
 
+freebsd1*)
+  dynamic_linker=no
+  ;;
+
 freebsd* | dragonfly*)
   # DragonFly does not have aout.  When/if they implement a new
   # versioning mechanism, adjust this.
@@ -2488,7 +2312,7 @@ freebsd* | dragonfly*)
     objformat=`/usr/bin/objformat`
   else
     case $host_os in
-    freebsd[[23]].*) objformat=aout ;;
+    freebsd[[123]]*) objformat=aout ;;
     *) objformat=elf ;;
     esac
   fi
@@ -2506,7 +2330,7 @@ freebsd* | dragonfly*)
   esac
   shlibpath_var=LD_LIBRARY_PATH
   case $host_os in
-  freebsd2.*)
+  freebsd2*)
     shlibpath_overrides_runpath=yes
     ;;
   freebsd3.[[01]]* | freebsdelf3.[[01]]*)
@@ -2526,26 +2350,12 @@ freebsd* | dragonfly*)
   ;;
 
 gnu*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}${major} ${libname}${shared_ext}'
   soname_spec='${libname}${release}${shared_ext}$major'
   shlibpath_var=LD_LIBRARY_PATH
-  shlibpath_overrides_runpath=no
-  hardcode_into_libs=yes
-  ;;
-
-haiku*)
-  version_type=linux # correct to gnu/linux during the next big refactor
-  need_lib_prefix=no
-  need_version=no
-  dynamic_linker="$host_os runtime_loader"
-  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}${major} ${libname}${shared_ext}'
-  soname_spec='${libname}${release}${shared_ext}$major'
-  shlibpath_var=LIBRARY_PATH
-  shlibpath_overrides_runpath=yes
-  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/system/lib'
   hardcode_into_libs=yes
   ;;
 
@@ -2591,14 +2401,12 @@ hpux9* | hpux10* | hpux11*)
     soname_spec='${libname}${release}${shared_ext}$major'
     ;;
   esac
-  # HP-UX runs *really* slowly unless shared libraries are mode 555, ...
+  # HP-UX runs *really* slowly unless shared libraries are mode 555.
   postinstall_cmds='chmod 555 $lib'
-  # or fails outright, so override atomically:
-  install_override_mode=555
   ;;
 
 interix[[3-9]]*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
@@ -2614,7 +2422,7 @@ irix5* | irix6* | nonstopux*)
     nonstopux*) version_type=nonstopux ;;
     *)
 	if test "$lt_cv_prog_gnu_ld" = yes; then
-		version_type=linux # correct to gnu/linux during the next big refactor
+		version_type=linux
 	else
 		version_type=irix
 	fi ;;
@@ -2651,9 +2459,9 @@ linux*oldld* | linux*aout* | linux*coff*
   dynamic_linker=no
   ;;
 
-# This must be glibc/ELF.
-linux* | k*bsd*-gnu | kopensolaris*-gnu)
-  version_type=linux # correct to gnu/linux during the next big refactor
+# This must be Linux ELF.
+linux* | k*bsd*-gnu)
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
@@ -2661,35 +2469,26 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
   finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
   shlibpath_var=LD_LIBRARY_PATH
   shlibpath_overrides_runpath=no
-
   # Some binutils ld are patched to set DT_RUNPATH
-  AC_CACHE_VAL([lt_cv_shlibpath_overrides_runpath],
-    [lt_cv_shlibpath_overrides_runpath=no
-    save_LDFLAGS=$LDFLAGS
-    save_libdir=$libdir
-    eval "libdir=/foo; wl=\"$_LT_TAGVAR(lt_prog_compiler_wl, $1)\"; \
-	 LDFLAGS=\"\$LDFLAGS $_LT_TAGVAR(hardcode_libdir_flag_spec, $1)\""
-    AC_LINK_IFELSE([AC_LANG_PROGRAM([],[])],
-      [AS_IF([ ($OBJDUMP -p conftest$ac_exeext) 2>/dev/null | grep "RUNPATH.*$libdir" >/dev/null],
-	 [lt_cv_shlibpath_overrides_runpath=yes])])
-    LDFLAGS=$save_LDFLAGS
-    libdir=$save_libdir
-    ])
-  shlibpath_overrides_runpath=$lt_cv_shlibpath_overrides_runpath
+  save_LDFLAGS=$LDFLAGS
+  save_libdir=$libdir
+  eval "libdir=/foo; wl=\"$_LT_TAGVAR(lt_prog_compiler_wl, $1)\"; \
+       LDFLAGS=\"\$LDFLAGS $_LT_TAGVAR(hardcode_libdir_flag_spec, $1)\""
+  AC_LINK_IFELSE([AC_LANG_PROGRAM([],[])],
+    [AS_IF([ ($OBJDUMP -p conftest$ac_exeext) 2>/dev/null | grep "RUNPATH.*$libdir" >/dev/null],
+       [shlibpath_overrides_runpath=yes])])
+  LDFLAGS=$save_LDFLAGS
+  libdir=$save_libdir
 
   # This implies no fast_install, which is unacceptable.
   # Some rework will be needed to allow for fast_install
   # before this can be enabled.
   hardcode_into_libs=yes
 
-  # Add ABI-specific directories to the system library path.
-  sys_lib_dlsearch_path_spec="/lib64 /usr/lib64 /lib /usr/lib"
-
   # Append ld.so.conf contents to the search path
   if test -f /etc/ld.so.conf; then
-    lt_ld_extra=`awk '/^include / { system(sprintf("cd /etc; cat %s 2>/dev/null", \[$]2)); skip = 1; } { if (!skip) print \[$]0; skip = 0; }' < /etc/ld.so.conf | $SED -e 's/#.*//;/^[	 ]*hwcap[	 ]/d;s/[:,	]/ /g;s/=[^=]*$//;s/=[^= ]* / /g;s/"//g;/^$/d' | tr '\n' ' '`
-    sys_lib_dlsearch_path_spec="$sys_lib_dlsearch_path_spec $lt_ld_extra"
-
+    lt_ld_extra=`awk '/^include / { system(sprintf("cd /etc; cat %s 2>/dev/null", \[$]2)); skip = 1; } { if (!skip) print \[$]0; skip = 0; }' < /etc/ld.so.conf | $SED -e 's/#.*//;/^[	 ]*hwcap[	 ]/d;s/[:,	]/ /g;s/=[^=]*$//;s/=[^= ]* / /g;/^$/d' | tr '\n' ' '`
+    sys_lib_dlsearch_path_spec="/lib /usr/lib $lt_ld_extra"
   fi
 
   # We used to test for /lib/ld.so.1 and disable shared libraries on
@@ -2720,7 +2519,7 @@ netbsd*)
   ;;
 
 newsos6)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
   shlibpath_var=LD_LIBRARY_PATH
   shlibpath_overrides_runpath=yes
@@ -2789,7 +2588,7 @@ rdos*)
   ;;
 
 solaris*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
@@ -2814,7 +2613,7 @@ sunos4*)
   ;;
 
 sysv4 | sysv4.3*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
   soname_spec='${libname}${release}${shared_ext}$major'
   shlibpath_var=LD_LIBRARY_PATH
@@ -2838,7 +2637,7 @@ sysv4 | sysv4.3*)
 
 sysv4*MP*)
   if test -d /usr/nec ;then
-    version_type=linux # correct to gnu/linux during the next big refactor
+    version_type=linux
     library_names_spec='$libname${shared_ext}.$versuffix $libname${shared_ext}.$major $libname${shared_ext}'
     soname_spec='$libname${shared_ext}.$major'
     shlibpath_var=LD_LIBRARY_PATH
@@ -2869,7 +2668,7 @@ sysv5* | sco3.2v5* | sco5v6* | unixware*
 
 tpf*)
   # TPF is a cross-target only.  Preferred cross-host = GNU/Linux.
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   need_lib_prefix=no
   need_version=no
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
@@ -2879,7 +2678,7 @@ tpf*)
   ;;
 
 uts4*)
-  version_type=linux # correct to gnu/linux during the next big refactor
+  version_type=linux
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
   soname_spec='${libname}${release}${shared_ext}$major'
   shlibpath_var=LD_LIBRARY_PATH
@@ -2921,8 +2720,6 @@ _LT_DECL([], [library_names_spec], [1],
     The last name is the one that the linker finds with -lNAME]])
 _LT_DECL([], [soname_spec], [1],
     [[The coded name of the library, if different from the real name]])
-_LT_DECL([], [install_override_mode], [1],
-    [Permission mode override for installation of shared libraries])
 _LT_DECL([], [postinstall_cmds], [2],
     [Command to use after installation of a shared archive])
 _LT_DECL([], [postuninstall_cmds], [2],
@@ -3035,7 +2832,6 @@ AC_REQUIRE([AC_CANONICAL_HOST])dnl
 AC_REQUIRE([AC_CANONICAL_BUILD])dnl
 m4_require([_LT_DECL_SED])dnl
 m4_require([_LT_DECL_EGREP])dnl
-m4_require([_LT_PROG_ECHO_BACKSLASH])dnl
 
 AC_ARG_WITH([gnu-ld],
     [AS_HELP_STRING([--with-gnu-ld],
@@ -3157,11 +2953,6 @@ case $reload_flag in
 esac
 reload_cmds='$LD$reload_flag -o $output$reload_objs'
 case $host_os in
-  cygwin* | mingw* | pw32* | cegcc*)
-    if test "$GCC" != yes; then
-      reload_cmds=false
-    fi
-    ;;
   darwin*)
     if test "$GCC" = yes; then
       reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
@@ -3170,8 +2961,8 @@ case $host_os in
     fi
     ;;
 esac
-_LT_TAGDECL([], [reload_flag], [1], [How to create reloadable object files])dnl
-_LT_TAGDECL([], [reload_cmds], [2])dnl
+_LT_DECL([], [reload_flag], [1], [How to create reloadable object files])dnl
+_LT_DECL([], [reload_cmds], [2])dnl
 ])# _LT_CMD_RELOAD
 
 
@@ -3223,18 +3014,16 @@ mingw* | pw32*)
   # Base MSYS/MinGW do not provide the 'file' command needed by
   # func_win32_libid shell function, so use a weaker test based on 'objdump',
   # unless we find 'file', for example because we are cross-compiling.
-  # func_win32_libid assumes BSD nm, so disallow it if using MS dumpbin.
-  if ( test "$lt_cv_nm_interface" = "BSD nm" && file / ) >/dev/null 2>&1; then
+  if ( file / ) >/dev/null 2>&1; then
     lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
     lt_cv_file_magic_cmd='func_win32_libid'
   else
-    # Keep this pattern in sync with the one in func_win32_libid.
-    lt_cv_deplibs_check_method='file_magic file format (pei*-i386(.*architecture: i386)?|pe-arm-wince|pe-x86-64)'
+    lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
     lt_cv_file_magic_cmd='$OBJDUMP -f'
   fi
   ;;
 
-cegcc*)
+cegcc)
   # use the weaker test based on 'objdump'. See mingw*.
   lt_cv_deplibs_check_method='file_magic file format pe-arm-.*little(.*architecture: arm)?'
   lt_cv_file_magic_cmd='$OBJDUMP -f'
@@ -3264,10 +3053,6 @@ gnu*)
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-haiku*)
-  lt_cv_deplibs_check_method=pass_all
-  ;;
-
 hpux10.20* | hpux11*)
   lt_cv_file_magic_cmd=/usr/bin/file
   case $host_cpu in
@@ -3276,11 +3061,11 @@ hpux10.20* | hpux11*)
     lt_cv_file_magic_test_file=/usr/lib/hpux32/libc.so
     ;;
   hppa*64*)
-    [lt_cv_deplibs_check_method='file_magic (s[0-9][0-9][0-9]|ELF[ -][0-9][0-9])(-bit)?( [LM]SB)? shared object( file)?[, -]* PA-RISC [0-9]\.[0-9]']
+    [lt_cv_deplibs_check_method='file_magic (s[0-9][0-9][0-9]|ELF-[0-9][0-9]) shared object file - PA-RISC [0-9].[0-9]']
     lt_cv_file_magic_test_file=/usr/lib/pa20_64/libc.sl
     ;;
   *)
-    lt_cv_deplibs_check_method='file_magic (s[[0-9]][[0-9]][[0-9]]|PA-RISC[[0-9]]\.[[0-9]]) shared library'
+    lt_cv_deplibs_check_method='file_magic (s[[0-9]][[0-9]][[0-9]]|PA-RISC[[0-9]].[[0-9]]) shared library'
     lt_cv_file_magic_test_file=/usr/lib/libc.sl
     ;;
   esac
@@ -3301,8 +3086,8 @@ irix5* | irix6* | nonstopux*)
   lt_cv_deplibs_check_method=pass_all
   ;;
 
-# This must be glibc/ELF.
-linux* | k*bsd*-gnu | kopensolaris*-gnu)
+# This must be Linux ELF.
+linux* | k*bsd*-gnu)
   lt_cv_deplibs_check_method=pass_all
   ;;
 
@@ -3380,21 +3165,6 @@ tpf*)
   ;;
 esac
 ])
-
-file_magic_glob=
-want_nocaseglob=no
-if test "$build" = "$host"; then
-  case $host_os in
-  mingw* | pw32*)
-    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
-      want_nocaseglob=yes
-    else
-      file_magic_glob=`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[[\1]]\/[[\1]]\/g;/g"`
-    fi
-    ;;
-  esac
-fi
-
 file_magic_cmd=$lt_cv_file_magic_cmd
 deplibs_check_method=$lt_cv_deplibs_check_method
 test -z "$deplibs_check_method" && deplibs_check_method=unknown
@@ -3402,11 +3172,7 @@ test -z "$deplibs_check_method" && depli
 _LT_DECL([], [deplibs_check_method], [1],
     [Method to check whether dependent libraries are shared objects])
 _LT_DECL([], [file_magic_cmd], [1],
-    [Command to use when deplibs_check_method = "file_magic"])
-_LT_DECL([], [file_magic_glob], [1],
-    [How to find potential files when deplibs_check_method = "file_magic"])
-_LT_DECL([], [want_nocaseglob], [1],
-    [Find potential files using nocaseglob when deplibs_check_method = "file_magic"])
+    [Command to use when deplibs_check_method == "file_magic"])
 ])# _LT_CHECK_MAGIC_METHOD
 
 
@@ -3463,19 +3229,7 @@ if test "$lt_cv_path_NM" != "no"; then
   NM="$lt_cv_path_NM"
 else
   # Didn't find any BSD compatible name lister, look for dumpbin.
-  if test -n "$DUMPBIN"; then :
-    # Let the user override the test.
-  else
-    AC_CHECK_TOOLS(DUMPBIN, [dumpbin "link -dump"], :)
-    case `$DUMPBIN -symbols /dev/null 2>&1 | sed '1q'` in
-    *COFF*)
-      DUMPBIN="$DUMPBIN -symbols"
-      ;;
-    *)
-      DUMPBIN=:
-      ;;
-    esac
-  fi
+  AC_CHECK_TOOLS(DUMPBIN, ["dumpbin -symbols" "link -dump -symbols"], :)
   AC_SUBST([DUMPBIN])
   if test "$DUMPBIN" != ":"; then
     NM="$DUMPBIN"
@@ -3488,13 +3242,13 @@ _LT_DECL([], [NM], [1], [A BSD- or MS-co
 AC_CACHE_CHECK([the name lister ($NM) interface], [lt_cv_nm_interface],
   [lt_cv_nm_interface="BSD nm"
   echo "int some_variable = 0;" > conftest.$ac_ext
-  (eval echo "\"\$as_me:$LINENO: $ac_compile\"" >&AS_MESSAGE_LOG_FD)
+  (eval echo "\"\$as_me:__oline__: $ac_compile\"" >&AS_MESSAGE_LOG_FD)
   (eval "$ac_compile" 2>conftest.err)
   cat conftest.err >&AS_MESSAGE_LOG_FD
-  (eval echo "\"\$as_me:$LINENO: $NM \\\"conftest.$ac_objext\\\"\"" >&AS_MESSAGE_LOG_FD)
+  (eval echo "\"\$as_me:__oline__: $NM \\\"conftest.$ac_objext\\\"\"" >&AS_MESSAGE_LOG_FD)
   (eval "$NM \"conftest.$ac_objext\"" 2>conftest.err > conftest.out)
   cat conftest.err >&AS_MESSAGE_LOG_FD
-  (eval echo "\"\$as_me:$LINENO: output\"" >&AS_MESSAGE_LOG_FD)
+  (eval echo "\"\$as_me:__oline__: output\"" >&AS_MESSAGE_LOG_FD)
   cat conftest.out >&AS_MESSAGE_LOG_FD
   if $GREP 'External.*some_variable' conftest.out > /dev/null; then
     lt_cv_nm_interface="MS dumpbin"
@@ -3509,67 +3263,6 @@ dnl aclocal-1.4 backwards compatibility:
 dnl AC_DEFUN([AM_PROG_NM], [])
 dnl AC_DEFUN([AC_PROG_NM], [])
 
-# _LT_CHECK_SHAREDLIB_FROM_LINKLIB
-# --------------------------------
-# how to determine the name of the shared library
-# associated with a specific link library.
-#  -- PORTME fill in with the dynamic library characteristics
-m4_defun([_LT_CHECK_SHAREDLIB_FROM_LINKLIB],
-[m4_require([_LT_DECL_EGREP])
-m4_require([_LT_DECL_OBJDUMP])
-m4_require([_LT_DECL_DLLTOOL])
-AC_CACHE_CHECK([how to associate runtime and link libraries],
-lt_cv_sharedlib_from_linklib_cmd,
-[lt_cv_sharedlib_from_linklib_cmd='unknown'
-
-case $host_os in
-cygwin* | mingw* | pw32* | cegcc*)
-  # two different shell functions defined in ltmain.sh
-  # decide which to use based on capabilities of $DLLTOOL
-  case `$DLLTOOL --help 2>&1` in
-  *--identify-strict*)
-    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib
-    ;;
-  *)
-    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib_fallback
-    ;;
-  esac
-  ;;
-*)
-  # fallback: assume linklib IS sharedlib
-  lt_cv_sharedlib_from_linklib_cmd="$ECHO"
-  ;;
-esac
-])
-sharedlib_from_linklib_cmd=$lt_cv_sharedlib_from_linklib_cmd
-test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=$ECHO
-
-_LT_DECL([], [sharedlib_from_linklib_cmd], [1],
-    [Command to associate shared and link libraries])
-])# _LT_CHECK_SHAREDLIB_FROM_LINKLIB
-
-
-# _LT_PATH_MANIFEST_TOOL
-# ----------------------
-# locate the manifest tool
-m4_defun([_LT_PATH_MANIFEST_TOOL],
-[AC_CHECK_TOOL(MANIFEST_TOOL, mt, :)
-test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
-AC_CACHE_CHECK([if $MANIFEST_TOOL is a manifest tool], [lt_cv_path_mainfest_tool],
-  [lt_cv_path_mainfest_tool=no
-  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&AS_MESSAGE_LOG_FD
-  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
-  cat conftest.err >&AS_MESSAGE_LOG_FD
-  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
-    lt_cv_path_mainfest_tool=yes
-  fi
-  rm -f conftest*])
-if test "x$lt_cv_path_mainfest_tool" != xyes; then
-  MANIFEST_TOOL=:
-fi
-_LT_DECL([], [MANIFEST_TOOL], [1], [Manifest tool])dnl
-])# _LT_PATH_MANIFEST_TOOL
-
 
 # LT_LIB_M
 # --------
@@ -3578,7 +3271,7 @@ AC_DEFUN([LT_LIB_M],
 [AC_REQUIRE([AC_CANONICAL_HOST])dnl
 LIBM=
 case $host in
-*-*-beos* | *-*-cegcc* | *-*-cygwin* | *-*-haiku* | *-*-pw32* | *-*-darwin*)
+*-*-beos* | *-*-cygwin* | *-*-pw32* | *-*-darwin*)
   # These system don't have libm, or don't need it
   ;;
 *-ncr-sysv4.3*)
@@ -3606,12 +3299,7 @@ m4_defun([_LT_COMPILER_NO_RTTI],
 _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=
 
 if test "$GCC" = yes; then
-  case $cc_basename in
-  nvcc*)
-    _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=' -Xcompiler -fno-builtin' ;;
-  *)
-    _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=' -fno-builtin' ;;
-  esac
+  _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=' -fno-builtin'
 
   _LT_COMPILER_OPTION([if $compiler supports -fno-rtti -fno-exceptions],
     lt_cv_prog_compiler_rtti_exceptions,
@@ -3628,7 +3316,6 @@ _LT_TAGDECL([no_builtin_flag], [lt_prog_
 m4_defun([_LT_CMD_GLOBAL_SYMBOLS],
 [AC_REQUIRE([AC_CANONICAL_HOST])dnl
 AC_REQUIRE([AC_PROG_CC])dnl
-AC_REQUIRE([AC_PROG_AWK])dnl
 AC_REQUIRE([LT_PATH_NM])dnl
 AC_REQUIRE([LT_PATH_LD])dnl
 m4_require([_LT_DECL_SED])dnl
@@ -3696,8 +3383,8 @@ esac
 lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
 
 # Transform an extracted symbol line into symbol name and symbol address
-lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([[^ ]]*\)[[ ]]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([[^ ]]*\) \([[^ ]]*\)$/  {\"\2\", (void *) \&\2},/p'"
-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([[^ ]]*\)[[ ]]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([[^ ]]*\) \(lib[[^ ]]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([[^ ]]*\) \([[^ ]]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
+lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([[^ ]]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([[^ ]]*\) \([[^ ]]*\)$/  {\"\2\", (void *) \&\2},/p'"
+lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([[^ ]]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([[^ ]]*\) \(lib[[^ ]]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([[^ ]]*\) \([[^ ]]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
 
 # Handle CRLF in mingw tool chain
 opt_cr=
@@ -3721,7 +3408,6 @@ for ac_symprfx in "" "_"; do
     # which start with @ or ?.
     lt_cv_sys_global_symbol_pipe="$AWK ['"\
 "     {last_section=section; section=\$ 3};"\
-"     /^COFF SYMBOL TABLE/{for(i in hide) delete hide[i]};"\
 "     /Section length .*#relocs.*(pick any)/{hide[last_section]=1};"\
 "     \$ 0!~/External *\|/{next};"\
 "     / 0+ UNDEF /{next}; / UNDEF \([^|]\)*()/{next};"\
@@ -3734,7 +3420,6 @@ for ac_symprfx in "" "_"; do
   else
     lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
   fi
-  lt_cv_sys_global_symbol_pipe="$lt_cv_sys_global_symbol_pipe | sed '/ __gnu_lto/d'"
 
   # Check to see that the pipe works correctly.
   pipe_works=no
@@ -3756,7 +3441,7 @@ _LT_EOF
   if AC_TRY_EVAL(ac_compile); then
     # Now try to grab the symbols.
     nlist=conftest.nm
-    if AC_TRY_EVAL(NM conftest.$ac_objext \| "$lt_cv_sys_global_symbol_pipe" \> $nlist) && test -s "$nlist"; then
+    if AC_TRY_EVAL(NM conftest.$ac_objext \| $lt_cv_sys_global_symbol_pipe \> $nlist) && test -s "$nlist"; then
       # Try sorting and uniquifying the output.
       if sort "$nlist" | uniq > "$nlist"T; then
 	mv -f "$nlist"T "$nlist"
@@ -3768,18 +3453,6 @@ _LT_EOF
       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
 	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
 	  cat <<_LT_EOF > conftest.$ac_ext
-/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and tests.  */
-#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
-/* DATA imports from DLLs on WIN32 con't be const, because runtime
-   relocations are performed -- see ld's documentation on pseudo-relocs.  */
-# define LT@&t@_DLSYM_CONST
-#elif defined(__osf__)
-/* This system does not cope well with relocations in const data.  */
-# define LT@&t@_DLSYM_CONST
-#else
-# define LT@&t@_DLSYM_CONST const
-#endif
-
 #ifdef __cplusplus
 extern "C" {
 #endif
@@ -3791,7 +3464,7 @@ _LT_EOF
 	  cat <<_LT_EOF >> conftest.$ac_ext
 
 /* The mapping between symbol names and symbols.  */
-LT@&t@_DLSYM_CONST struct {
+const struct {
   const char *name;
   void       *address;
 }
@@ -3817,15 +3490,15 @@ static const void *lt_preloaded_setup()
 _LT_EOF
 	  # Now try linking the two files.
 	  mv conftest.$ac_objext conftstm.$ac_objext
-	  lt_globsym_save_LIBS=$LIBS
-	  lt_globsym_save_CFLAGS=$CFLAGS
+	  lt_save_LIBS="$LIBS"
+	  lt_save_CFLAGS="$CFLAGS"
 	  LIBS="conftstm.$ac_objext"
 	  CFLAGS="$CFLAGS$_LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)"
 	  if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext}; then
 	    pipe_works=yes
 	  fi
-	  LIBS=$lt_globsym_save_LIBS
-	  CFLAGS=$lt_globsym_save_CFLAGS
+	  LIBS="$lt_save_LIBS"
+	  CFLAGS="$lt_save_CFLAGS"
 	else
 	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
 	fi
@@ -3858,13 +3531,6 @@ else
   AC_MSG_RESULT(ok)
 fi
 
-# Response file support.
-if test "$lt_cv_nm_interface" = "MS dumpbin"; then
-  nm_file_list_spec='@'
-elif $NM --help 2>/dev/null | grep '[[@]]FILE' >/dev/null; then
-  nm_file_list_spec='@'
-fi
-
 _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
     [Take the output of nm and produce a listing of raw symbols and C names])
 _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
@@ -3875,8 +3541,6 @@ _LT_DECL([global_symbol_to_c_name_addres
 _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
     [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
     [Transform the output of nm in a C name address pair when lib prefix is needed])
-_LT_DECL([], [nm_file_list_spec], [1],
-    [Specify filename containing input files for $NM])
 ]) # _LT_CMD_GLOBAL_SYMBOLS
 
 
@@ -3888,6 +3552,7 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
 _LT_TAGVAR(lt_prog_compiler_pic, $1)=
 _LT_TAGVAR(lt_prog_compiler_static, $1)=
 
+AC_MSG_CHECKING([for $compiler option to produce PIC])
 m4_if([$1], [CXX], [
   # C++ specific cases for pic, static, wl, etc.
   if test "$GXX" = yes; then
@@ -3938,11 +3603,6 @@ m4_if([$1], [CXX], [
       # DJGPP does not support shared libraries at all
       _LT_TAGVAR(lt_prog_compiler_pic, $1)=
       ;;
-    haiku*)
-      # PIC is the default for Haiku.
-      # The "-static" flag exists, but is broken.
-      _LT_TAGVAR(lt_prog_compiler_static, $1)=
-      ;;
     interix[[3-9]]*)
       # Interix 3.x gcc -fpic/-fPIC options generate broken code.
       # Instead, we relocate shared libraries at runtime.
@@ -3992,12 +3652,6 @@ m4_if([$1], [CXX], [
 	  ;;
 	esac
 	;;
-      mingw* | cygwin* | os2* | pw32* | cegcc*)
-	# This hack is so that the source file can tell whether it is being
-	# built for inclusion in a dll (and should export symbols for example).
-	m4_if([$1], [GCJ], [],
-	  [_LT_TAGVAR(lt_prog_compiler_pic, $1)='-DDLL_EXPORT'])
-	;;
       dgux*)
 	case $cc_basename in
 	  ec++*)
@@ -4054,7 +3708,7 @@ m4_if([$1], [CXX], [
 	    ;;
 	esac
 	;;
-      linux* | k*bsd*-gnu | kopensolaris*-gnu)
+      linux* | k*bsd*-gnu)
 	case $cc_basename in
 	  KCC*)
 	    # KAI C++ Compiler
@@ -4087,8 +3741,8 @@ m4_if([$1], [CXX], [
 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)=
 	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
 	    ;;
-	  xlc* | xlC* | bgxl[[cC]]* | mpixl[[cC]]*)
-	    # IBM XL 8.0, 9.0 on PPC and BlueGene
+	  xlc* | xlC*)
+	    # IBM XL 8.0 on PPC
 	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-qpic'
 	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-qstaticlink'
@@ -4150,7 +3804,7 @@ m4_if([$1], [CXX], [
 	;;
       solaris*)
 	case $cc_basename in
-	  CC* | sunCC*)
+	  CC*)
 	    # Sun C++ 4.2, 5.x and Centerline C++
 	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
 	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
@@ -4254,12 +3908,6 @@ m4_if([$1], [CXX], [
       _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fno-common'
       ;;
 
-    haiku*)
-      # PIC is the default for Haiku.
-      # The "-static" flag exists, but is broken.
-      _LT_TAGVAR(lt_prog_compiler_static, $1)=
-      ;;
-
     hpux*)
       # PIC is the default for 64-bit PA HP-UX, but not for 32-bit
       # PA HP-UX.  On IA64 HP-UX, PIC is the default but the pic flag
@@ -4302,15 +3950,6 @@ m4_if([$1], [CXX], [
       _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
       ;;
     esac
-
-    case $cc_basename in
-    nvcc*) # Cuda Compiler Driver 2.2
-      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Xlinker '
-      if test -n "$_LT_TAGVAR(lt_prog_compiler_pic, $1)"; then
-        _LT_TAGVAR(lt_prog_compiler_pic, $1)="-Xcompiler $_LT_TAGVAR(lt_prog_compiler_pic, $1)"
-      fi
-      ;;
-    esac
   else
     # PORTME Check for flag to pass linker flags through the system compiler.
     case $host_os in
@@ -4353,7 +3992,7 @@ m4_if([$1], [CXX], [
       _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
       ;;
 
-    linux* | k*bsd*-gnu | kopensolaris*-gnu)
+    linux* | k*bsd*-gnu)
       case $cc_basename in
       # old Intel for x86_64 which still supported -KPIC.
       ecc*)
@@ -4374,13 +4013,7 @@ m4_if([$1], [CXX], [
 	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
 	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
 	;;
-      nagfor*)
-	# NAG Fortran compiler
-	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,-Wl,,'
-	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-PIC'
-	_LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-	;;
-      pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
+      pgcc* | pgf77* | pgf90* | pgf95*)
         # Portland Group compilers (*not* the Pentium gcc compiler,
 	# which looks to be a dead project)
 	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
@@ -4392,40 +4025,25 @@ m4_if([$1], [CXX], [
         # All Alpha code is PIC.
         _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
         ;;
-      xl* | bgxl* | bgf* | mpixl*)
-	# IBM XL C 8.0/Fortran 10.1, 11.1 on PPC and BlueGene
+      xl*)
+	# IBM XL C 8.0/Fortran 10.1 on PPC
 	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
 	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-qpic'
 	_LT_TAGVAR(lt_prog_compiler_static, $1)='-qstaticlink'
 	;;
       *)
 	case `$CC -V 2>&1 | sed 5q` in
-	*Sun\ Ceres\ Fortran* | *Sun*Fortran*\ [[1-7]].* | *Sun*Fortran*\ 8.[[0-3]]*)
-	  # Sun Fortran 8.3 passes all unrecognized flags to the linker
-	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
-	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-	  _LT_TAGVAR(lt_prog_compiler_wl, $1)=''
-	  ;;
-	*Sun\ F* | *Sun*Fortran*)
-	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
-	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-	  _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld '
-	  ;;
 	*Sun\ C*)
 	  # Sun C 5.9
 	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
 	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
 	  _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
 	  ;;
-        *Intel*\ [[CF]]*Compiler*)
-	  _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
-	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
-	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
-	  ;;
-	*Portland\ Group*)
-	  _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
-	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fpic'
+	*Sun\ F*)
+	  # Sun Fortran 8.3 passes all unrecognized flags to the linker
+	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
 	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
+	  _LT_TAGVAR(lt_prog_compiler_wl, $1)=''
 	  ;;
 	esac
 	;;
@@ -4457,7 +4075,7 @@ m4_if([$1], [CXX], [
       _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
       _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
       case $cc_basename in
-      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
+      f77* | f90* | f95*)
 	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
       *)
 	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
@@ -4514,11 +4132,9 @@ case $host_os in
     _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
     ;;
 esac
-
-AC_CACHE_CHECK([for $compiler option to produce PIC],
-  [_LT_TAGVAR(lt_cv_prog_compiler_pic, $1)],
-  [_LT_TAGVAR(lt_cv_prog_compiler_pic, $1)=$_LT_TAGVAR(lt_prog_compiler_pic, $1)])
-_LT_TAGVAR(lt_prog_compiler_pic, $1)=$_LT_TAGVAR(lt_cv_prog_compiler_pic, $1)
+AC_MSG_RESULT([$_LT_TAGVAR(lt_prog_compiler_pic, $1)])
+_LT_TAGDECL([wl], [lt_prog_compiler_wl], [1],
+	[How to pass a linker flag through the compiler])
 
 #
 # Check to make sure the PIC flag actually works.
@@ -4537,8 +4153,6 @@ fi
 _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
 	[Additional compiler flags for building library objects])
 
-_LT_TAGDECL([wl], [lt_prog_compiler_wl], [1],
-	[How to pass a linker flag through the compiler])
 #
 # Check to make sure the static flag actually works.
 #
@@ -4559,7 +4173,6 @@ _LT_TAGDECL([link_static_flag], [lt_prog
 m4_defun([_LT_LINKER_SHLIBS],
 [AC_REQUIRE([LT_PATH_LD])dnl
 AC_REQUIRE([LT_PATH_NM])dnl
-m4_require([_LT_PATH_MANIFEST_TOOL])dnl
 m4_require([_LT_FILEUTILS_DEFAULTS])dnl
 m4_require([_LT_DECL_EGREP])dnl
 m4_require([_LT_DECL_SED])dnl
@@ -4568,37 +4181,27 @@ m4_require([_LT_TAG_COMPILER])dnl
 AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
 m4_if([$1], [CXX], [
   _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
-  _LT_TAGVAR(exclude_expsyms, $1)=['_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*']
   case $host_os in
   aix[[4-9]]*)
     # If we're using GNU nm, then we don't want the "-C" option.
     # -C means demangle to AIX nm, but means don't demangle with GNU nm
-    # Also, AIX nm treats weak defined symbols like other global defined
-    # symbols, whereas GNU nm marks them as "W".
     if $NM -V 2>&1 | $GREP 'GNU' > /dev/null; then
-      _LT_TAGVAR(export_symbols_cmds, $1)='$NM -Bpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B") || (\$ 2 == "W")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
+      _LT_TAGVAR(export_symbols_cmds, $1)='$NM -Bpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
     else
       _LT_TAGVAR(export_symbols_cmds, $1)='$NM -BCpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
     fi
     ;;
   pw32*)
     _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
-    ;;
+  ;;
   cygwin* | mingw* | cegcc*)
-    case $cc_basename in
-    cl*)
-      _LT_TAGVAR(exclude_expsyms, $1)='_NULL_IMPORT_DESCRIPTOR|_IMPORT_DESCRIPTOR_.*'
-      ;;
-    *)
-      _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/;s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
-      _LT_TAGVAR(exclude_expsyms, $1)=['[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname']
-      ;;
-    esac
-    ;;
+    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/;/^.*[[ ]]__nm__/s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
+  ;;
   *)
     _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
-    ;;
+  ;;
   esac
+  _LT_TAGVAR(exclude_expsyms, $1)=['_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*']
 ], [
   runpath_var=
   _LT_TAGVAR(allow_undefined_flag, $1)=
@@ -4613,6 +4216,7 @@ m4_if([$1], [CXX], [
   _LT_TAGVAR(hardcode_direct, $1)=no
   _LT_TAGVAR(hardcode_direct_absolute, $1)=no
   _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
+  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
   _LT_TAGVAR(hardcode_libdir_separator, $1)=
   _LT_TAGVAR(hardcode_minus_L, $1)=no
   _LT_TAGVAR(hardcode_shlibpath_var, $1)=unsupported
@@ -4660,33 +4264,7 @@ dnl Note also adjust exclude_expsyms for
   esac
 
   _LT_TAGVAR(ld_shlibs, $1)=yes
-
-  # On some targets, GNU ld is compatible enough with the native linker
-  # that we're better off using the native interface for both.
-  lt_use_gnu_ld_interface=no
   if test "$with_gnu_ld" = yes; then
-    case $host_os in
-      aix*)
-	# The AIX port of GNU ld has always aspired to compatibility
-	# with the native linker.  However, as the warning in the GNU ld
-	# block says, versions before 2.19.5* couldn't really create working
-	# shared libraries, regardless of the interface used.
-	case `$LD -v 2>&1` in
-	  *\ \(GNU\ Binutils\)\ 2.19.5*) ;;
-	  *\ \(GNU\ Binutils\)\ 2.[[2-9]]*) ;;
-	  *\ \(GNU\ Binutils\)\ [[3-9]]*) ;;
-	  *)
-	    lt_use_gnu_ld_interface=yes
-	    ;;
-	esac
-	;;
-      *)
-	lt_use_gnu_ld_interface=yes
-	;;
-    esac
-  fi
-
-  if test "$lt_use_gnu_ld_interface" = yes; then
     # If archive_cmds runs LD, not CC, wlarc should be empty
     wlarc='${wl}'
 
@@ -4704,7 +4282,6 @@ dnl Note also adjust exclude_expsyms for
     fi
     supports_anon_versioning=no
     case `$LD -v 2>&1` in
-      *GNU\ gold*) supports_anon_versioning=yes ;;
       *\ [[01]].* | *\ 2.[[0-9]].* | *\ 2.10.*) ;; # catch versions < 2.11
       *\ 2.11.93.0.2\ *) supports_anon_versioning=yes ;; # RH7.3 ...
       *\ 2.11.92.0.12\ *) supports_anon_versioning=yes ;; # Mandrake 8.2 ...
@@ -4720,12 +4297,11 @@ dnl Note also adjust exclude_expsyms for
 	_LT_TAGVAR(ld_shlibs, $1)=no
 	cat <<_LT_EOF 1>&2
 
-*** Warning: the GNU linker, at least up to release 2.19, is reported
+*** Warning: the GNU linker, at least up to release 2.9.1, is reported
 *** to be unable to reliably create shared libraries on AIX.
 *** Therefore, libtool is disabling shared libraries support.  If you
-*** really care for shared libraries, you may want to install binutils
-*** 2.20 or above, or modify your PATH so that a non-GNU linker is found.
-*** You will then need to restart the configuration process.
+*** really care for shared libraries, you may want to modify your PATH
+*** so that a non-GNU linker is found, and then restart.
 
 _LT_EOF
       fi
@@ -4761,12 +4337,10 @@ _LT_EOF
       # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
       # as there is no search path for DLLs.
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
-      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-all-symbols'
       _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
       _LT_TAGVAR(always_export_symbols, $1)=no
       _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
-      _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/;s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
-      _LT_TAGVAR(exclude_expsyms, $1)=['[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname']
+      _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/'\'' | $SED -e '\''/^[[AITW]][[ ]]/s/.*[[ ]]//'\'' | sort | uniq > $export_symbols'
 
       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
         _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
@@ -4784,11 +4358,6 @@ _LT_EOF
       fi
       ;;
 
-    haiku*)
-      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
-      _LT_TAGVAR(link_all_deplibs, $1)=yes
-      ;;
-
     interix[[3-9]]*)
       _LT_TAGVAR(hardcode_direct, $1)=no
       _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
@@ -4804,7 +4373,7 @@ _LT_EOF
       _LT_TAGVAR(archive_expsym_cmds, $1)='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
       ;;
 
-    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu)
+    gnu* | linux* | tpf* | k*bsd*-gnu)
       tmp_diet=no
       if test "$host_os" = linux-dietlibc; then
 	case $cc_basename in
@@ -4814,16 +4383,15 @@ _LT_EOF
       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
 	 && test "$tmp_diet" = no
       then
-	tmp_addflag=' $pic_flag'
+	tmp_addflag=
 	tmp_sharedflag='-shared'
 	case $cc_basename,$host_cpu in
         pgcc*)				# Portland Group C compiler
-	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; func_echo_all \"$new_convenience\"` ${wl}--no-whole-archive'
+	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
 	  tmp_addflag=' $pic_flag'
 	  ;;
-	pgf77* | pgf90* | pgf95* | pgfortran*)
-					# Portland Group f77 and f90 compilers
-	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; func_echo_all \"$new_convenience\"` ${wl}--no-whole-archive'
+	pgf77* | pgf90* | pgf95*)	# Portland Group f77 and f90 compilers
+	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
 	  tmp_addflag=' $pic_flag -Mnomain' ;;
 	ecc*,ia64* | icc*,ia64*)	# Intel C compiler on ia64
 	  tmp_addflag=' -i_dynamic' ;;
@@ -4834,17 +4402,13 @@ _LT_EOF
 	lf95*)				# Lahey Fortran 8.1
 	  _LT_TAGVAR(whole_archive_flag_spec, $1)=
 	  tmp_sharedflag='--shared' ;;
-	xl[[cC]]* | bgxl[[cC]]* | mpixl[[cC]]*) # IBM XL C 8.0 on PPC (deal with xlf below)
+	xl[[cC]]*)			# IBM XL C 8.0 on PPC (deal with xlf below)
 	  tmp_sharedflag='-qmkshrobj'
 	  tmp_addflag= ;;
-	nvcc*)	# Cuda Compiler Driver 2.2
-	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; func_echo_all \"$new_convenience\"` ${wl}--no-whole-archive'
-	  _LT_TAGVAR(compiler_needs_object, $1)=yes
-	  ;;
 	esac
 	case `$CC -V 2>&1 | sed 5q` in
 	*Sun\ C*)			# Sun C 5.9
-	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`new_convenience=; for conv in $convenience\"\"; do test -z \"$conv\" || new_convenience=\"$new_convenience,$conv\"; done; func_echo_all \"$new_convenience\"` ${wl}--no-whole-archive'
+	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`new_convenience=; for conv in $convenience\"\"; do test -z \"$conv\" || new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
 	  _LT_TAGVAR(compiler_needs_object, $1)=yes
 	  tmp_sharedflag='-G' ;;
 	*Sun\ F*)			# Sun Fortran 8.3
@@ -4860,16 +4424,17 @@ _LT_EOF
         fi
 
 	case $cc_basename in
-	xlf* | bgf* | bgxlf* | mpixlf*)
+	xlf*)
 	  # IBM XL Fortran 10.1 on PPC cannot create shared libs itself
 	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
-	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
-	  _LT_TAGVAR(archive_cmds, $1)='$LD -shared $libobjs $deplibs $linker_flags -soname $soname -o $lib'
+	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
+	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
+	  _LT_TAGVAR(archive_cmds, $1)='$LD -shared $libobjs $deplibs $compiler_flags -soname $soname -o $lib'
 	  if test "x$supports_anon_versioning" = xyes; then
 	    _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $output_objdir/$libname.ver~
 	      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
 	      echo "local: *; };" >> $output_objdir/$libname.ver~
-	      $LD -shared $libobjs $deplibs $linker_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
+	      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
 	  fi
 	  ;;
 	esac
@@ -4883,8 +4448,8 @@ _LT_EOF
 	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
 	wlarc=
       else
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
-	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
       fi
       ;;
 
@@ -4902,8 +4467,8 @@ _LT_EOF
 
 _LT_EOF
       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
-	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
       else
 	_LT_TAGVAR(ld_shlibs, $1)=no
       fi
@@ -4949,8 +4514,8 @@ _LT_EOF
 
     *)
       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
-	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
       else
 	_LT_TAGVAR(ld_shlibs, $1)=no
       fi
@@ -4990,10 +4555,8 @@ _LT_EOF
       else
 	# If we're using GNU nm, then we don't want the "-C" option.
 	# -C means demangle to AIX nm, but means don't demangle with GNU nm
-	# Also, AIX nm treats weak defined symbols like other global
-	# defined symbols, whereas GNU nm marks them as "W".
 	if $NM -V 2>&1 | $GREP 'GNU' > /dev/null; then
-	  _LT_TAGVAR(export_symbols_cmds, $1)='$NM -Bpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B") || (\$ 2 == "W")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
+	  _LT_TAGVAR(export_symbols_cmds, $1)='$NM -Bpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
 	else
 	  _LT_TAGVAR(export_symbols_cmds, $1)='$NM -BCpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
 	fi
@@ -5080,9 +4643,9 @@ _LT_EOF
 	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
         # Determine the default libpath from the value encoded in an
         # empty executable.
-        _LT_SYS_MODULE_PATH_AIX([$1])
+        _LT_SYS_MODULE_PATH_AIX
         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
-        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
+        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then $ECHO "X${wl}${allow_undefined_flag}" | $Xsed; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
       else
 	if test "$host_cpu" = ia64; then
 	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R $libdir:/usr/lib:/lib'
@@ -5091,19 +4654,14 @@ _LT_EOF
 	else
 	 # Determine the default libpath from the value encoded in an
 	 # empty executable.
-	 _LT_SYS_MODULE_PATH_AIX([$1])
+	 _LT_SYS_MODULE_PATH_AIX
 	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
 	  # Warning - without using the other run time loading flags,
 	  # -berok will link without error, but may produce a broken library.
 	  _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-bernotok'
 	  _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-berok'
-	  if test "$with_gnu_ld" = yes; then
-	    # We only use this code for GNU lds that support --whole-archive.
-	    _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive$convenience ${wl}--no-whole-archive'
-	  else
-	    # Exported symbols can be pulled into shared objects from archives
-	    _LT_TAGVAR(whole_archive_flag_spec, $1)='$convenience'
-	  fi
+	  # Exported symbols can be pulled into shared objects from archives
+	  _LT_TAGVAR(whole_archive_flag_spec, $1)='$convenience'
 	  _LT_TAGVAR(archive_cmds_need_lc, $1)=yes
 	  # This is similar to how AIX traditionally builds its shared libraries.
 	  _LT_TAGVAR(archive_expsym_cmds, $1)="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs ${wl}-bnoentry $compiler_flags ${wl}-bE:$export_symbols${allow_undefined_flag}~$AR $AR_FLAGS $output_objdir/$libname$release.a $output_objdir/$soname'
@@ -5135,64 +4693,20 @@ _LT_EOF
       # Microsoft Visual C++.
       # hardcode_libdir_flag_spec is actually meaningless, as there is
       # no search path for DLLs.
-      case $cc_basename in
-      cl*)
-	# Native MSVC
-	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)=' '
-	_LT_TAGVAR(allow_undefined_flag, $1)=unsupported
-	_LT_TAGVAR(always_export_symbols, $1)=yes
-	_LT_TAGVAR(file_list_spec, $1)='@'
-	# Tell ltmain to make .lib files, not .a files.
-	libext=lib
-	# Tell ltmain to make .dll files, not .so files.
-	shrext_cmds=".dll"
-	# FIXME: Setting linknames here is a bad hack.
-	_LT_TAGVAR(archive_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
-	_LT_TAGVAR(archive_expsym_cmds, $1)='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
-	    sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
-	  else
-	    sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
-	  fi~
-	  $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
-	  linknames='
-	# The linker will not automatically build a static lib if we build a DLL.
-	# _LT_TAGVAR(old_archive_from_new_cmds, $1)='true'
-	_LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
-	_LT_TAGVAR(exclude_expsyms, $1)='_NULL_IMPORT_DESCRIPTOR|_IMPORT_DESCRIPTOR_.*'
-	_LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1,DATA/'\'' | $SED -e '\''/^[[AITW]][[ ]]/s/.*[[ ]]//'\'' | sort | uniq > $export_symbols'
-	# Don't use ranlib
-	_LT_TAGVAR(old_postinstall_cmds, $1)='chmod 644 $oldlib'
-	_LT_TAGVAR(postlink_cmds, $1)='lt_outputfile="@OUTPUT@"~
-	  lt_tool_outputfile="@TOOL_OUTPUT@"~
-	  case $lt_outputfile in
-	    *.exe|*.EXE) ;;
-	    *)
-	      lt_outputfile="$lt_outputfile.exe"
-	      lt_tool_outputfile="$lt_tool_outputfile.exe"
-	      ;;
-	  esac~
-	  if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
-	    $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
-	    $RM "$lt_outputfile.manifest";
-	  fi'
-	;;
-      *)
-	# Assume MSVC wrapper
-	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)=' '
-	_LT_TAGVAR(allow_undefined_flag, $1)=unsupported
-	# Tell ltmain to make .lib files, not .a files.
-	libext=lib
-	# Tell ltmain to make .dll files, not .so files.
-	shrext_cmds=".dll"
-	# FIXME: Setting linknames here is a bad hack.
-	_LT_TAGVAR(archive_cmds, $1)='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
-	# The linker will automatically build a .lib file if we build a DLL.
-	_LT_TAGVAR(old_archive_from_new_cmds, $1)='true'
-	# FIXME: Should let the user specify the lib program.
-	_LT_TAGVAR(old_archive_cmds, $1)='lib -OUT:$oldlib$oldobjs$old_deplibs'
-	_LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
-	;;
-      esac
+      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=' '
+      _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
+      # Tell ltmain to make .lib files, not .a files.
+      libext=lib
+      # Tell ltmain to make .dll files, not .so files.
+      shrext_cmds=".dll"
+      # FIXME: Setting linknames here is a bad hack.
+      _LT_TAGVAR(archive_cmds, $1)='$CC -o $lib $libobjs $compiler_flags `$ECHO "X$deplibs" | $Xsed -e '\''s/ -lc$//'\''` -link -dll~linknames='
+      # The linker will automatically build a .lib file if we build a DLL.
+      _LT_TAGVAR(old_archive_from_new_cmds, $1)='true'
+      # FIXME: Should let the user specify the lib program.
+      _LT_TAGVAR(old_archive_cmds, $1)='lib -OUT:$oldlib$oldobjs$old_deplibs'
+      _LT_TAGVAR(fix_srcfile_path, $1)='`cygpath -w "$srcfile"`'
+      _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
       ;;
 
     darwin* | rhapsody*)
@@ -5205,6 +4719,10 @@ _LT_EOF
       _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
       ;;
 
+    freebsd1*)
+      _LT_TAGVAR(ld_shlibs, $1)=no
+      ;;
+
     # FreeBSD 2.2.[012] allows us to include c++rt0.o to get C++ constructor
     # support.  Future versions do this automatically, but an explicit c++rt0.o
     # does not break anything, and helps significantly (at the cost of a little
@@ -5217,7 +4735,7 @@ _LT_EOF
       ;;
 
     # Unfortunately, older versions of FreeBSD 2 do not have this feature.
-    freebsd2.*)
+    freebsd2*)
       _LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
       _LT_TAGVAR(hardcode_direct, $1)=yes
       _LT_TAGVAR(hardcode_minus_L, $1)=yes
@@ -5226,7 +4744,7 @@ _LT_EOF
 
     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
     freebsd* | dragonfly*)
-      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
+      _LT_TAGVAR(archive_cmds, $1)='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
       _LT_TAGVAR(hardcode_direct, $1)=yes
       _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
@@ -5234,7 +4752,7 @@ _LT_EOF
 
     hpux9*)
       if test "$GCC" = yes; then
-	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -shared $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
       else
 	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
       fi
@@ -5249,13 +4767,14 @@ _LT_EOF
       ;;
 
     hpux10*)
-      if test "$GCC" = yes && test "$with_gnu_ld" = no; then
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
+      if test "$GCC" = yes -a "$with_gnu_ld" = no; then
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
       else
 	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
       fi
       if test "$with_gnu_ld" = no; then
 	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
+	_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='+b $libdir'
 	_LT_TAGVAR(hardcode_libdir_separator, $1)=:
 	_LT_TAGVAR(hardcode_direct, $1)=yes
 	_LT_TAGVAR(hardcode_direct_absolute, $1)=yes
@@ -5267,16 +4786,16 @@ _LT_EOF
       ;;
 
     hpux11*)
-      if test "$GCC" = yes && test "$with_gnu_ld" = no; then
+      if test "$GCC" = yes -a "$with_gnu_ld" = no; then
 	case $host_cpu in
 	hppa*64*)
 	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
 	  ;;
 	ia64*)
-	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
+	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
 	  ;;
 	*)
-	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
+	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
 	  ;;
 	esac
       else
@@ -5288,14 +4807,7 @@ _LT_EOF
 	  _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
 	  ;;
 	*)
-	m4_if($1, [], [
-	  # Older versions of the 11.00 compiler do not understand -b yet
-	  # (HP92453-01 A.11.01.20 doesn't, HP92453-01 B.11.X.35175-35176.GP does)
-	  _LT_LINKER_OPTION([if $CC understands -b],
-	    _LT_TAGVAR(lt_cv_prog_compiler__b, $1), [-b],
-	    [_LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'],
-	    [_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'])],
-	  [_LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'])
+	  _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
 	  ;;
 	esac
       fi
@@ -5323,34 +4835,19 @@ _LT_EOF
 
     irix5* | irix6* | nonstopux*)
       if test "$GCC" = yes; then
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
 	# Try to use the -exported_symbol ld option, if it does not
 	# work, assume that -exports_file does not work either and
 	# implicitly export all symbols.
-	# This should be the same for all languages, so no per-tag cache variable.
-	AC_CACHE_CHECK([whether the $host_os linker accepts -exported_symbol],
-	  [lt_cv_irix_exported_symbol],
-	  [save_LDFLAGS="$LDFLAGS"
-	   LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
-	   AC_LINK_IFELSE(
-	     [AC_LANG_SOURCE(
-	        [AC_LANG_CASE([C], [[int foo (void) { return 0; }]],
-			      [C++], [[int foo (void) { return 0; }]],
-			      [Fortran 77], [[
-      subroutine foo
-      end]],
-			      [Fortran], [[
-      subroutine foo
-      end]])])],
-	      [lt_cv_irix_exported_symbol=yes],
-	      [lt_cv_irix_exported_symbol=no])
-           LDFLAGS="$save_LDFLAGS"])
-	if test "$lt_cv_irix_exported_symbol" = yes; then
-          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
-	fi
+        save_LDFLAGS="$LDFLAGS"
+        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
+        AC_LINK_IFELSE(int foo(void) {},
+          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
+        )
+        LDFLAGS="$save_LDFLAGS"
       else
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
-	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
+	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
       fi
       _LT_TAGVAR(archive_cmds_need_lc, $1)='no'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
@@ -5412,17 +4909,17 @@ _LT_EOF
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
       _LT_TAGVAR(hardcode_minus_L, $1)=yes
       _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
-      _LT_TAGVAR(archive_cmds, $1)='$ECHO "LIBRARY $libname INITINSTANCE" > $output_objdir/$libname.def~$ECHO "DESCRIPTION \"$libname\"" >> $output_objdir/$libname.def~echo DATA >> $output_objdir/$libname.def~echo " SINGLE NONSHARED" >> $output_objdir/$libname.def~echo EXPORTS >> $output_objdir/$libname.def~emxexp $libobjs >> $output_objdir/$libname.def~$CC -Zdll -Zcrtdll -o $lib $libobjs $deplibs $compiler_flags $output_objdir/$libname.def'
+      _LT_TAGVAR(archive_cmds, $1)='$ECHO "LIBRARY $libname INITINSTANCE" > $output_objdir/$libname.def~$ECHO "DESCRIPTION \"$libname\"" >> $output_objdir/$libname.def~$ECHO DATA >> $output_objdir/$libname.def~$ECHO " SINGLE NONSHARED" >> $output_objdir/$libname.def~$ECHO EXPORTS >> $output_objdir/$libname.def~emxexp $libobjs >> $output_objdir/$libname.def~$CC -Zdll -Zcrtdll -o $lib $libobjs $deplibs $compiler_flags $output_objdir/$libname.def'
       _LT_TAGVAR(old_archive_from_new_cmds, $1)='emximp -o $output_objdir/$libname.a $output_objdir/$libname.def'
       ;;
 
     osf3*)
       if test "$GCC" = yes; then
 	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
       else
 	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
       fi
       _LT_TAGVAR(archive_cmds_need_lc, $1)='no'
       _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
@@ -5432,13 +4929,13 @@ _LT_EOF
     osf4* | osf5*)	# as osf3* with the addition of -msym flag
       if test "$GCC" = yes; then
 	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $pic_flag $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
 	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
       else
 	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags -msym -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags -msym -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
 	_LT_TAGVAR(archive_expsym_cmds, $1)='for i in `cat $export_symbols`; do printf "%s %s\\n" -exported_symbol "\$i" >> $lib.exp; done; printf "%s\\n" "-hidden">> $lib.exp~
-	$CC -shared${allow_undefined_flag} ${wl}-input ${wl}$lib.exp $compiler_flags $libobjs $deplibs -soname $soname `test -n "$verstring" && $ECHO "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib~$RM $lib.exp'
+	$CC -shared${allow_undefined_flag} ${wl}-input ${wl}$lib.exp $compiler_flags $libobjs $deplibs -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib~$RM $lib.exp'
 
 	# Both c and cxx compiler support -rpath directly
 	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-rpath $libdir'
@@ -5451,9 +4948,9 @@ _LT_EOF
       _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
       if test "$GCC" = yes; then
 	wlarc='${wl}'
-	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+	_LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
 	_LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
-	  $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
+	  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
       else
 	case `$CC -V 2>&1` in
 	*"Compilers 5.0"*)
@@ -5629,38 +5126,36 @@ x|xyes)
       # Test whether the compiler implicitly links with -lc since on some
       # systems, -lgcc has to come before -lc. If gcc already passes -lc
       # to ld, don't add -lc before -lgcc.
-      AC_CACHE_CHECK([whether -lc should be explicitly linked in],
-	[lt_cv_]_LT_TAGVAR(archive_cmds_need_lc, $1),
-	[$RM conftest*
-	echo "$lt_simple_compile_test_code" > conftest.$ac_ext
-
-	if AC_TRY_EVAL(ac_compile) 2>conftest.err; then
-	  soname=conftest
-	  lib=conftest
-	  libobjs=conftest.$ac_objext
-	  deplibs=
-	  wl=$_LT_TAGVAR(lt_prog_compiler_wl, $1)
-	  pic_flag=$_LT_TAGVAR(lt_prog_compiler_pic, $1)
-	  compiler_flags=-v
-	  linker_flags=-v
-	  verstring=
-	  output_objdir=.
-	  libname=conftest
-	  lt_save_allow_undefined_flag=$_LT_TAGVAR(allow_undefined_flag, $1)
-	  _LT_TAGVAR(allow_undefined_flag, $1)=
-	  if AC_TRY_EVAL(_LT_TAGVAR(archive_cmds, $1) 2\>\&1 \| $GREP \" -lc \" \>/dev/null 2\>\&1)
-	  then
-	    lt_cv_[]_LT_TAGVAR(archive_cmds_need_lc, $1)=no
-	  else
-	    lt_cv_[]_LT_TAGVAR(archive_cmds_need_lc, $1)=yes
-	  fi
-	  _LT_TAGVAR(allow_undefined_flag, $1)=$lt_save_allow_undefined_flag
-	else
-	  cat conftest.err 1>&5
-	fi
-	$RM conftest*
-	])
-      _LT_TAGVAR(archive_cmds_need_lc, $1)=$lt_cv_[]_LT_TAGVAR(archive_cmds_need_lc, $1)
+      AC_MSG_CHECKING([whether -lc should be explicitly linked in])
+      $RM conftest*
+      echo "$lt_simple_compile_test_code" > conftest.$ac_ext
+
+      if AC_TRY_EVAL(ac_compile) 2>conftest.err; then
+        soname=conftest
+        lib=conftest
+        libobjs=conftest.$ac_objext
+        deplibs=
+        wl=$_LT_TAGVAR(lt_prog_compiler_wl, $1)
+	pic_flag=$_LT_TAGVAR(lt_prog_compiler_pic, $1)
+        compiler_flags=-v
+        linker_flags=-v
+        verstring=
+        output_objdir=.
+        libname=conftest
+        lt_save_allow_undefined_flag=$_LT_TAGVAR(allow_undefined_flag, $1)
+        _LT_TAGVAR(allow_undefined_flag, $1)=
+        if AC_TRY_EVAL(_LT_TAGVAR(archive_cmds, $1) 2\>\&1 \| $GREP \" -lc \" \>/dev/null 2\>\&1)
+        then
+	  _LT_TAGVAR(archive_cmds_need_lc, $1)=no
+        else
+	  _LT_TAGVAR(archive_cmds_need_lc, $1)=yes
+        fi
+        _LT_TAGVAR(allow_undefined_flag, $1)=$lt_save_allow_undefined_flag
+      else
+        cat conftest.err 1>&5
+      fi
+      $RM conftest*
+      AC_MSG_RESULT([$_LT_TAGVAR(archive_cmds_need_lc, $1)])
       ;;
     esac
   fi
@@ -5697,6 +5192,9 @@ _LT_TAGDECL([], [no_undefined_flag], [1]
 _LT_TAGDECL([], [hardcode_libdir_flag_spec], [1],
     [Flag to hardcode $libdir into a binary during linking.
     This must work even if $libdir does not exist])
+_LT_TAGDECL([], [hardcode_libdir_flag_spec_ld], [1],
+    [[If ld is used when linking, flag to hardcode $libdir into a binary
+    during linking.  This must work even if $libdir does not exist]])
 _LT_TAGDECL([], [hardcode_libdir_separator], [1],
     [Whether we need a single "-rpath" flag with a separated argument])
 _LT_TAGDECL([], [hardcode_direct], [0],
@@ -5722,6 +5220,8 @@ _LT_TAGDECL([], [inherit_rpath], [0],
     to runtime path list])
 _LT_TAGDECL([], [link_all_deplibs], [0],
     [Whether libtool must link a program against all its dependency libraries])
+_LT_TAGDECL([], [fix_srcfile_path], [1],
+    [Fix the shell variable $srcfile for the compiler])
 _LT_TAGDECL([], [always_export_symbols], [0],
     [Set to "yes" if exported symbols are required])
 _LT_TAGDECL([], [export_symbols_cmds], [2],
@@ -5732,8 +5232,6 @@ _LT_TAGDECL([], [include_expsyms], [1],
     [Symbols that must always be exported])
 _LT_TAGDECL([], [prelink_cmds], [2],
     [Commands necessary for linking programs (against libraries) with templates])
-_LT_TAGDECL([], [postlink_cmds], [2],
-    [Commands necessary for finishing linking programs])
 _LT_TAGDECL([], [file_list_spec], [1],
     [Specify filename containing input files])
 dnl FIXME: Not yet implemented
@@ -5823,15 +5321,14 @@ CC="$lt_save_CC"
 ])# _LT_LANG_C_CONFIG
 
 
-# _LT_LANG_CXX_CONFIG([TAG])
-# --------------------------
-# Ensure that the configuration variables for a C++ compiler are suitably
-# defined.  These variables are subsequently used by _LT_CONFIG to write
-# the compiler configuration to `libtool'.
-m4_defun([_LT_LANG_CXX_CONFIG],
-[m4_require([_LT_FILEUTILS_DEFAULTS])dnl
-m4_require([_LT_DECL_EGREP])dnl
-m4_require([_LT_PATH_MANIFEST_TOOL])dnl
+# _LT_PROG_CXX
+# ------------
+# Since AC_PROG_CXX is broken, in that it returns g++ if there is no c++
+# compiler, we have our own version here.
+m4_defun([_LT_PROG_CXX],
+[
+pushdef([AC_MSG_ERROR], [_lt_caught_CXX_error=yes])
+AC_PROG_CXX
 if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
     ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
     (test "X$CXX" != "Xg++"))) ; then
@@ -5839,6 +5336,22 @@ if test -n "$CXX" && ( test "X$CXX" != "
 else
   _lt_caught_CXX_error=yes
 fi
+popdef([AC_MSG_ERROR])
+])# _LT_PROG_CXX
+
+dnl aclocal-1.4 backwards compatibility:
+dnl AC_DEFUN([_LT_PROG_CXX], [])
+
+
+# _LT_LANG_CXX_CONFIG([TAG])
+# --------------------------
+# Ensure that the configuration variables for a C++ compiler are suitably
+# defined.  These variables are subsequently used by _LT_CONFIG to write
+# the compiler configuration to `libtool'.
+m4_defun([_LT_LANG_CXX_CONFIG],
+[AC_REQUIRE([_LT_PROG_CXX])dnl
+m4_require([_LT_FILEUTILS_DEFAULTS])dnl
+m4_require([_LT_DECL_EGREP])dnl
 
 AC_LANG_PUSH(C++)
 _LT_TAGVAR(archive_cmds_need_lc, $1)=no
@@ -5850,6 +5363,7 @@ _LT_TAGVAR(export_dynamic_flag_spec, $1)
 _LT_TAGVAR(hardcode_direct, $1)=no
 _LT_TAGVAR(hardcode_direct_absolute, $1)=no
 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
+_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
 _LT_TAGVAR(hardcode_libdir_separator, $1)=
 _LT_TAGVAR(hardcode_minus_L, $1)=no
 _LT_TAGVAR(hardcode_shlibpath_var, $1)=unsupported
@@ -5859,8 +5373,6 @@ _LT_TAGVAR(module_cmds, $1)=
 _LT_TAGVAR(module_expsym_cmds, $1)=
 _LT_TAGVAR(link_all_deplibs, $1)=unknown
 _LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
-_LT_TAGVAR(reload_flag, $1)=$reload_flag
-_LT_TAGVAR(reload_cmds, $1)=$reload_cmds
 _LT_TAGVAR(no_undefined_flag, $1)=
 _LT_TAGVAR(whole_archive_flag_spec, $1)=
 _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no
@@ -5892,7 +5404,6 @@ if test "$_lt_caught_CXX_error" != yes;
 
   # Allow CC to be a program name with arguments.
   lt_save_CC=$CC
-  lt_save_CFLAGS=$CFLAGS
   lt_save_LD=$LD
   lt_save_GCC=$GCC
   GCC=$GXX
@@ -5910,7 +5421,6 @@ if test "$_lt_caught_CXX_error" != yes;
   fi
   test -z "${LDCXX+set}" || LD=$LDCXX
   CC=${CXX-"c++"}
-  CFLAGS=$CXXFLAGS
   compiler=$CC
   _LT_TAGVAR(compiler, $1)=$CC
   _LT_CC_BASENAME([$compiler])
@@ -5932,8 +5442,8 @@ if test "$_lt_caught_CXX_error" != yes;
       # Check if GNU C++ uses GNU ld as the underlying linker, since the
       # archiving commands below assume that GNU ld is being used.
       if test "$with_gnu_ld" = yes; then
-        _LT_TAGVAR(archive_cmds, $1)='$CC $pic_flag -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
-        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC $pic_flag -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
+        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
 
         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
         _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
@@ -5965,7 +5475,7 @@ if test "$_lt_caught_CXX_error" != yes;
       # Commands to make compiler produce verbose output that lists
       # what "hidden" libraries, object files and flags are used when
       # linking a shared library.
-      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP -v "^Configured with:" | $GREP "\-L"'
+      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'
 
     else
       GXX=no
@@ -6074,10 +5584,10 @@ if test "$_lt_caught_CXX_error" != yes;
           _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
           # Determine the default libpath from the value encoded in an empty
           # executable.
-          _LT_SYS_MODULE_PATH_AIX([$1])
+          _LT_SYS_MODULE_PATH_AIX
           _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
 
-          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
+          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then $ECHO "X${wl}${allow_undefined_flag}" | $Xsed; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
         else
           if test "$host_cpu" = ia64; then
 	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R $libdir:/usr/lib:/lib'
@@ -6086,19 +5596,14 @@ if test "$_lt_caught_CXX_error" != yes;
           else
 	    # Determine the default libpath from the value encoded in an
 	    # empty executable.
-	    _LT_SYS_MODULE_PATH_AIX([$1])
+	    _LT_SYS_MODULE_PATH_AIX
 	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
 	    # Warning - without using the other run time loading flags,
 	    # -berok will link without error, but may produce a broken library.
 	    _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-bernotok'
 	    _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-berok'
-	    if test "$with_gnu_ld" = yes; then
-	      # We only use this code for GNU lds that support --whole-archive.
-	      _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive$convenience ${wl}--no-whole-archive'
-	    else
-	      # Exported symbols can be pulled into shared objects from archives
-	      _LT_TAGVAR(whole_archive_flag_spec, $1)='$convenience'
-	    fi
+	    # Exported symbols can be pulled into shared objects from archives
+	    _LT_TAGVAR(whole_archive_flag_spec, $1)='$convenience'
 	    _LT_TAGVAR(archive_cmds_need_lc, $1)=yes
 	    # This is similar to how AIX traditionally builds its shared
 	    # libraries.
@@ -6128,75 +5633,28 @@ if test "$_lt_caught_CXX_error" != yes;
         ;;
 
       cygwin* | mingw* | pw32* | cegcc*)
-	case $GXX,$cc_basename in
-	,cl* | no,cl*)
-	  # Native MSVC
-	  # hardcode_libdir_flag_spec is actually meaningless, as there is
-	  # no search path for DLLs.
-	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=' '
-	  _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
-	  _LT_TAGVAR(always_export_symbols, $1)=yes
-	  _LT_TAGVAR(file_list_spec, $1)='@'
-	  # Tell ltmain to make .lib files, not .a files.
-	  libext=lib
-	  # Tell ltmain to make .dll files, not .so files.
-	  shrext_cmds=".dll"
-	  # FIXME: Setting linknames here is a bad hack.
-	  _LT_TAGVAR(archive_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
-	  _LT_TAGVAR(archive_expsym_cmds, $1)='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
-	      $SED -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
-	    else
-	      $SED -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
-	    fi~
-	    $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
-	    linknames='
-	  # The linker will not automatically build a static lib if we build a DLL.
-	  # _LT_TAGVAR(old_archive_from_new_cmds, $1)='true'
-	  _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
-	  # Don't use ranlib
-	  _LT_TAGVAR(old_postinstall_cmds, $1)='chmod 644 $oldlib'
-	  _LT_TAGVAR(postlink_cmds, $1)='lt_outputfile="@OUTPUT@"~
-	    lt_tool_outputfile="@TOOL_OUTPUT@"~
-	    case $lt_outputfile in
-	      *.exe|*.EXE) ;;
-	      *)
-		lt_outputfile="$lt_outputfile.exe"
-		lt_tool_outputfile="$lt_tool_outputfile.exe"
-		;;
-	    esac~
-	    func_to_tool_file "$lt_outputfile"~
-	    if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
-	      $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
-	      $RM "$lt_outputfile.manifest";
-	    fi'
-	  ;;
-	*)
-	  # g++
-	  # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
-	  # as there is no search path for DLLs.
-	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
-	  _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-all-symbols'
-	  _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
-	  _LT_TAGVAR(always_export_symbols, $1)=no
-	  _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
-
-	  if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
-	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-	    # If the export-symbols file already is a .def file (1st line
-	    # is EXPORTS), use it as is; otherwise, prepend...
-	    _LT_TAGVAR(archive_expsym_cmds, $1)='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
-	      cp $export_symbols $output_objdir/$soname.def;
-	    else
-	      echo EXPORTS > $output_objdir/$soname.def;
-	      cat $export_symbols >> $output_objdir/$soname.def;
-	    fi~
-	    $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-	  else
-	    _LT_TAGVAR(ld_shlibs, $1)=no
-	  fi
-	  ;;
-	esac
-	;;
+        # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
+        # as there is no search path for DLLs.
+        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
+        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
+        _LT_TAGVAR(always_export_symbols, $1)=no
+        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
+
+        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
+          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
+          # If the export-symbols file already is a .def file (1st line
+          # is EXPORTS), use it as is; otherwise, prepend...
+          _LT_TAGVAR(archive_expsym_cmds, $1)='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
+	    cp $export_symbols $output_objdir/$soname.def;
+          else
+	    echo EXPORTS > $output_objdir/$soname.def;
+	    cat $export_symbols >> $output_objdir/$soname.def;
+          fi~
+          $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
+        else
+          _LT_TAGVAR(ld_shlibs, $1)=no
+        fi
+        ;;
       darwin* | rhapsody*)
         _LT_DARWIN_LINKER_FEATURES($1)
 	;;
@@ -6219,7 +5677,7 @@ if test "$_lt_caught_CXX_error" != yes;
         esac
         ;;
 
-      freebsd2.*)
+      freebsd[[12]]*)
         # C++ shared libraries reported to be fairly broken before
 	# switch to ELF
         _LT_TAGVAR(ld_shlibs, $1)=no
@@ -6238,11 +5696,6 @@ if test "$_lt_caught_CXX_error" != yes;
       gnu*)
         ;;
 
-      haiku*)
-        _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
-        _LT_TAGVAR(link_all_deplibs, $1)=yes
-        ;;
-
       hpux9*)
         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
         _LT_TAGVAR(hardcode_libdir_separator, $1)=:
@@ -6267,11 +5720,11 @@ if test "$_lt_caught_CXX_error" != yes;
             # explicitly linking system object files so we need to strip them
             # from the output so that they don't get included in the library
             # dependencies.
-            output_verbose_link_cmd='templist=`($CC -b $CFLAGS -v conftest.$objext 2>&1) | $EGREP "\-L"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; func_echo_all "$list"'
+            output_verbose_link_cmd='templist=`($CC -b $CFLAGS -v conftest.$objext 2>&1) | $EGREP "\-L"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
             ;;
           *)
             if test "$GXX" = yes; then
-              _LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -shared -nostdlib $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
+              _LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -shared -nostdlib -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
             else
               # FIXME: insert proper C++ library support
               _LT_TAGVAR(ld_shlibs, $1)=no
@@ -6332,7 +5785,7 @@ if test "$_lt_caught_CXX_error" != yes;
 	    # explicitly linking system object files so we need to strip them
 	    # from the output so that they don't get included in the library
 	    # dependencies.
-	    output_verbose_link_cmd='templist=`($CC -b $CFLAGS -v conftest.$objext 2>&1) | $GREP "\-L"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; func_echo_all "$list"'
+	    output_verbose_link_cmd='templist=`($CC -b $CFLAGS -v conftest.$objext 2>&1) | $GREP "\-L"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
 	    ;;
           *)
 	    if test "$GXX" = yes; then
@@ -6342,10 +5795,10 @@ if test "$_lt_caught_CXX_error" != yes;
 	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
 	            ;;
 	          ia64*)
-	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
+	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
 	            ;;
 	          *)
-	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
+	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
 	            ;;
 	        esac
 	      fi
@@ -6375,7 +5828,7 @@ if test "$_lt_caught_CXX_error" != yes;
         case $cc_basename in
           CC*)
 	    # SGI C++
-	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared -all -multigot $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
+	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared -all -multigot $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
 
 	    # Archives containing C++ object files must be created using
 	    # "CC -ar", where "CC" is the IRIX C++ compiler.  This is
@@ -6386,9 +5839,9 @@ if test "$_lt_caught_CXX_error" != yes;
           *)
 	    if test "$GXX" = yes; then
 	      if test "$with_gnu_ld" = no; then
-	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
 	      else
-	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` -o $lib'
+	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` -o $lib'
 	      fi
 	    fi
 	    _LT_TAGVAR(link_all_deplibs, $1)=yes
@@ -6399,7 +5852,7 @@ if test "$_lt_caught_CXX_error" != yes;
         _LT_TAGVAR(inherit_rpath, $1)=yes
         ;;
 
-      linux* | k*bsd*-gnu | kopensolaris*-gnu)
+      linux* | k*bsd*-gnu)
         case $cc_basename in
           KCC*)
 	    # Kuck and Associates, Inc. (KAI) C++ Compiler
@@ -6417,7 +5870,7 @@ if test "$_lt_caught_CXX_error" != yes;
 	    # explicitly linking system object files so we need to strip them
 	    # from the output so that they don't get included in the library
 	    # dependencies.
-	    output_verbose_link_cmd='templist=`$CC $CFLAGS -v conftest.$objext -o libconftest$shared_ext 2>&1 | $GREP "ld"`; rm -f libconftest$shared_ext; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; func_echo_all "$list"'
+	    output_verbose_link_cmd='templist=`$CC $CFLAGS -v conftest.$objext -o libconftest$shared_ext 2>&1 | $GREP "ld"`; rm -f libconftest$shared_ext; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
 
 	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
 	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
@@ -6454,26 +5907,26 @@ if test "$_lt_caught_CXX_error" != yes;
           pgCC* | pgcpp*)
             # Portland Group C++ compiler
 	    case `$CC -V` in
-	    *pgCC\ [[1-5]].* | *pgcpp\ [[1-5]].*)
+	    *pgCC\ [[1-5]]* | *pgcpp\ [[1-5]]*)
 	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
 		rm -rf $tpldir~
 		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
-		compile_command="$compile_command `find $tpldir -name \*.o | sort | $NL2SP`"'
+		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
 	      _LT_TAGVAR(old_archive_cmds, $1)='tpldir=Template.dir~
 		rm -rf $tpldir~
 		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
-		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | sort | $NL2SP`~
+		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
 		$RANLIB $oldlib'
 	      _LT_TAGVAR(archive_cmds, $1)='tpldir=Template.dir~
 		rm -rf $tpldir~
 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
-		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
 	      _LT_TAGVAR(archive_expsym_cmds, $1)='tpldir=Template.dir~
 		rm -rf $tpldir~
 		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
-		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | sort | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
+		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
 	      ;;
-	    *) # Version 6 and above use weak symbols
+	    *) # Version 6 will use weak symbols
 	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
 	      _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
 	      ;;
@@ -6481,7 +5934,7 @@ if test "$_lt_caught_CXX_error" != yes;
 
 	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}--rpath ${wl}$libdir'
 	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
-	    _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; func_echo_all \"$new_convenience\"` ${wl}--no-whole-archive'
+	    _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
             ;;
 	  cxx*)
 	    # Compaq C++
@@ -6500,9 +5953,9 @@ if test "$_lt_caught_CXX_error" != yes;
 	    # explicitly linking system object files so we need to strip them
 	    # from the output so that they don't get included in the library
 	    # dependencies.
-	    output_verbose_link_cmd='templist=`$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "ld"`; templist=`func_echo_all "$templist" | $SED "s/\(^.*ld.*\)\( .*ld .*$\)/\1/"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; func_echo_all "X$list" | $Xsed'
+	    output_verbose_link_cmd='templist=`$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "ld"`; templist=`$ECHO "X$templist" | $Xsed -e "s/\(^.*ld.*\)\( .*ld .*$\)/\1/"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
 	    ;;
-	  xl* | mpixl* | bgxl*)
+	  xl*)
 	    # IBM XL 8.0 on PPC, with GNU ld
 	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
 	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
@@ -6522,13 +5975,13 @@ if test "$_lt_caught_CXX_error" != yes;
 	      _LT_TAGVAR(archive_cmds, $1)='$CC -G${allow_undefined_flag} -h$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
 	      _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G${allow_undefined_flag} -h$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-retain-symbols-file ${wl}$export_symbols'
 	      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
-	      _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`new_convenience=; for conv in $convenience\"\"; do test -z \"$conv\" || new_convenience=\"$new_convenience,$conv\"; done; func_echo_all \"$new_convenience\"` ${wl}--no-whole-archive'
+	      _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`new_convenience=; for conv in $convenience\"\"; do test -z \"$conv\" || new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
 	      _LT_TAGVAR(compiler_needs_object, $1)=yes
 
 	      # Not sure whether something based on
 	      # $CC $CFLAGS -v conftest.$objext -o libconftest$shared_ext 2>&1
 	      # would be better.
-	      output_verbose_link_cmd='func_echo_all'
+	      output_verbose_link_cmd='echo'
 
 	      # Archives containing C++ object files must be created using
 	      # "CC -xar", where "CC" is the Sun C++ compiler.  This is
@@ -6597,7 +6050,7 @@ if test "$_lt_caught_CXX_error" != yes;
 	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
 	    _LT_TAGVAR(whole_archive_flag_spec, $1)="$wlarc"'--whole-archive$convenience '"$wlarc"'--no-whole-archive'
 	  fi
-	  output_verbose_link_cmd=func_echo_all
+	  output_verbose_link_cmd=echo
 	else
 	  _LT_TAGVAR(ld_shlibs, $1)=no
 	fi
@@ -6632,15 +6085,15 @@ if test "$_lt_caught_CXX_error" != yes;
 	    case $host in
 	      osf3*)
 	        _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
-	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $soname `test -n "$verstring" && func_echo_all "${wl}-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
+	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $soname `test -n "$verstring" && $ECHO "X${wl}-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
 	        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
 		;;
 	      *)
 	        _LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -msym -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
+	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -msym -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
 	        _LT_TAGVAR(archive_expsym_cmds, $1)='for i in `cat $export_symbols`; do printf "%s %s\\n" -exported_symbol "\$i" >> $lib.exp; done~
 	          echo "-hidden">> $lib.exp~
-	          $CC -shared$allow_undefined_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -msym -soname $soname ${wl}-input ${wl}$lib.exp  `test -n "$verstring" && $ECHO "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib~
+	          $CC -shared$allow_undefined_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -msym -soname $soname ${wl}-input ${wl}$lib.exp  `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib~
 	          $RM $lib.exp'
 	        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-rpath $libdir'
 		;;
@@ -6656,17 +6109,17 @@ if test "$_lt_caught_CXX_error" != yes;
 	    # explicitly linking system object files so we need to strip them
 	    # from the output so that they don't get included in the library
 	    # dependencies.
-	    output_verbose_link_cmd='templist=`$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "ld" | $GREP -v "ld:"`; templist=`func_echo_all "$templist" | $SED "s/\(^.*ld.*\)\( .*ld.*$\)/\1/"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; func_echo_all "$list"'
+	    output_verbose_link_cmd='templist=`$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "ld" | $GREP -v "ld:"`; templist=`$ECHO "X$templist" | $Xsed -e "s/\(^.*ld.*\)\( .*ld.*$\)/\1/"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
 	    ;;
 	  *)
 	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
 	      _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
 	      case $host in
 	        osf3*)
-	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
 		  ;;
 	        *)
-	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
 		  ;;
 	      esac
 
@@ -6676,7 +6129,7 @@ if test "$_lt_caught_CXX_error" != yes;
 	      # Commands to make compiler produce verbose output that lists
 	      # what "hidden" libraries, object files and flags are used when
 	      # linking a shared library.
-	      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP -v "^Configured with:" | $GREP "\-L"'
+	      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'
 
 	    else
 	      # FIXME: insert proper C++ library support
@@ -6712,7 +6165,7 @@ if test "$_lt_caught_CXX_error" != yes;
 
       solaris*)
         case $cc_basename in
-          CC* | sunCC*)
+          CC*)
 	    # Sun C++ 4.2, 5.x and Centerline C++
             _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
 	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
@@ -6733,7 +6186,7 @@ if test "$_lt_caught_CXX_error" != yes;
 	    esac
 	    _LT_TAGVAR(link_all_deplibs, $1)=yes
 
-	    output_verbose_link_cmd='func_echo_all'
+	    output_verbose_link_cmd='echo'
 
 	    # Archives containing C++ object files must be created using
 	    # "CC -xar", where "CC" is the Sun C++ compiler.  This is
@@ -6753,14 +6206,14 @@ if test "$_lt_caught_CXX_error" != yes;
 	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
 	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
 	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
-	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
+	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
 	        _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
-		  $CC -shared $pic_flag -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'
+		  $CC -shared -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'
 
 	        # Commands to make compiler produce verbose output that lists
 	        # what "hidden" libraries, object files and flags are used when
 	        # linking a shared library.
-	        output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP -v "^Configured with:" | $GREP "\-L"'
+	        output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'
 	      else
 	        # g++ 2.7 appears to require `-G' NOT `-shared' on this
 	        # platform.
@@ -6771,7 +6224,7 @@ if test "$_lt_caught_CXX_error" != yes;
 	        # Commands to make compiler produce verbose output that lists
 	        # what "hidden" libraries, object files and flags are used when
 	        # linking a shared library.
-	        output_verbose_link_cmd='$CC -G $CFLAGS -v conftest.$objext 2>&1 | $GREP -v "^Configured with:" | $GREP "\-L"'
+	        output_verbose_link_cmd='$CC -G $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'
 	      fi
 
 	      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R $wl$libdir'
@@ -6825,10 +6278,6 @@ if test "$_lt_caught_CXX_error" != yes;
           CC*)
 	    _LT_TAGVAR(archive_cmds, $1)='$CC -G ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
 	    _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
-	    _LT_TAGVAR(old_archive_cmds, $1)='$CC -Tprelink_objects $oldobjs~
-	      '"$_LT_TAGVAR(old_archive_cmds, $1)"
-	    _LT_TAGVAR(reload_cmds, $1)='$CC -Tprelink_objects $reload_objs~
-	      '"$_LT_TAGVAR(reload_cmds, $1)"
 	    ;;
 	  *)
 	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
@@ -6884,7 +6333,6 @@ if test "$_lt_caught_CXX_error" != yes;
   fi # test -n "$compiler"
 
   CC=$lt_save_CC
-  CFLAGS=$lt_save_CFLAGS
   LDCXX=$LD
   LD=$lt_save_LD
   GCC=$lt_save_GCC
@@ -6899,29 +6347,6 @@ AC_LANG_POP
 ])# _LT_LANG_CXX_CONFIG
 
 
-# _LT_FUNC_STRIPNAME_CNF
-# ----------------------
-# func_stripname_cnf prefix suffix name
-# strip PREFIX and SUFFIX off of NAME.
-# PREFIX and SUFFIX must not contain globbing or regex special
-# characters, hashes, percent signs, but SUFFIX may contain a leading
-# dot (in which case that matches only a dot).
-#
-# This function is identical to the (non-XSI) version of func_stripname,
-# except this one can be used by m4 code that may be executed by configure,
-# rather than the libtool script.
-m4_defun([_LT_FUNC_STRIPNAME_CNF],[dnl
-AC_REQUIRE([_LT_DECL_SED])
-AC_REQUIRE([_LT_PROG_ECHO_BACKSLASH])
-func_stripname_cnf ()
-{
-  case ${2} in
-  .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
-  *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
-  esac
-} # func_stripname_cnf
-])# _LT_FUNC_STRIPNAME_CNF
-
 # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
 # ---------------------------------
 # Figure out "hidden" library dependencies from verbose
@@ -6930,7 +6355,6 @@ func_stripname_cnf ()
 # objects, libraries and library flags.
 m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
 [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
-AC_REQUIRE([_LT_FUNC_STRIPNAME_CNF])dnl
 # Dependencies to place before and after the object being linked:
 _LT_TAGVAR(predep_objects, $1)=
 _LT_TAGVAR(postdep_objects, $1)=
@@ -6980,20 +6404,7 @@ public class foo {
   }
 };
 _LT_EOF
-], [$1], [GO], [cat > conftest.$ac_ext <<_LT_EOF
-package foo
-func foo() {
-}
-_LT_EOF
 ])
-
-_lt_libdeps_save_CFLAGS=$CFLAGS
-case "$CC $CFLAGS " in #(
-*\ -flto*\ *) CFLAGS="$CFLAGS -fno-lto" ;;
-*\ -fwhopr*\ *) CFLAGS="$CFLAGS -fno-whopr" ;;
-*\ -fuse-linker-plugin*\ *) CFLAGS="$CFLAGS -fno-use-linker-plugin" ;;
-esac
-
 dnl Parse the compiler output and extract the necessary
 dnl objects, libraries and library flags.
 if AC_TRY_EVAL(ac_compile); then
@@ -7005,7 +6416,7 @@ if AC_TRY_EVAL(ac_compile); then
   pre_test_object_deps_done=no
 
   for p in `eval "$output_verbose_link_cmd"`; do
-    case ${prev}${p} in
+    case $p in
 
     -L* | -R* | -l*)
        # Some compilers place space between "-{L,R}" and the path.
@@ -7014,22 +6425,13 @@ if AC_TRY_EVAL(ac_compile); then
           test $p = "-R"; then
 	 prev=$p
 	 continue
+       else
+	 prev=
        fi
 
-       # Expand the sysroot to ease extracting the directories later.
-       if test -z "$prev"; then
-         case $p in
-         -L*) func_stripname_cnf '-L' '' "$p"; prev=-L; p=$func_stripname_result ;;
-         -R*) func_stripname_cnf '-R' '' "$p"; prev=-R; p=$func_stripname_result ;;
-         -l*) func_stripname_cnf '-l' '' "$p"; prev=-l; p=$func_stripname_result ;;
-         esac
-       fi
-       case $p in
-       =*) func_stripname_cnf '=' '' "$p"; p=$lt_sysroot$func_stripname_result ;;
-       esac
        if test "$pre_test_object_deps_done" = no; then
-	 case ${prev} in
-	 -L | -R)
+	 case $p in
+	 -L* | -R*)
 	   # Internal compiler library paths should come after those
 	   # provided the user.  The postdeps already come after the
 	   # user supplied libs so there is no need to process them.
@@ -7049,10 +6451,8 @@ if AC_TRY_EVAL(ac_compile); then
 	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
 	 fi
        fi
-       prev=
        ;;
 
-    *.lto.$objext) ;; # Ignore GCC LTO objects
     *.$objext)
        # This assumes that the test object file only shows up
        # once in the compiler output.
@@ -7088,7 +6488,6 @@ else
 fi
 
 $RM -f confest.$objext
-CFLAGS=$_lt_libdeps_save_CFLAGS
 
 # PORTME: override above test on systems where it is broken
 m4_if([$1], [CXX],
@@ -7125,7 +6524,7 @@ linux*)
 
 solaris*)
   case $cc_basename in
-  CC* | sunCC*)
+  CC*)
     # The more standards-conforming stlport4 library is
     # incompatible with the Cstd library. Avoid specifying
     # it if it's in CXXFLAGS. Ignore libCrun as
@@ -7169,16 +6568,32 @@ _LT_TAGDECL([], [compiler_lib_search_pat
 ])# _LT_SYS_HIDDEN_LIBDEPS
 
 
+# _LT_PROG_F77
+# ------------
+# Since AC_PROG_F77 is broken, in that it returns the empty string
+# if there is no fortran compiler, we have our own version here.
+m4_defun([_LT_PROG_F77],
+[
+pushdef([AC_MSG_ERROR], [_lt_disable_F77=yes])
+AC_PROG_F77
+if test -z "$F77" || test "X$F77" = "Xno"; then
+  _lt_disable_F77=yes
+fi
+popdef([AC_MSG_ERROR])
+])# _LT_PROG_F77
+
+dnl aclocal-1.4 backwards compatibility:
+dnl AC_DEFUN([_LT_PROG_F77], [])
+
+
 # _LT_LANG_F77_CONFIG([TAG])
 # --------------------------
 # Ensure that the configuration variables for a Fortran 77 compiler are
 # suitably defined.  These variables are subsequently used by _LT_CONFIG
 # to write the compiler configuration to `libtool'.
 m4_defun([_LT_LANG_F77_CONFIG],
-[AC_LANG_PUSH(Fortran 77)
-if test -z "$F77" || test "X$F77" = "Xno"; then
-  _lt_disable_F77=yes
-fi
+[AC_REQUIRE([_LT_PROG_F77])dnl
+AC_LANG_PUSH(Fortran 77)
 
 _LT_TAGVAR(archive_cmds_need_lc, $1)=no
 _LT_TAGVAR(allow_undefined_flag, $1)=
@@ -7188,6 +6603,7 @@ _LT_TAGVAR(export_dynamic_flag_spec, $1)
 _LT_TAGVAR(hardcode_direct, $1)=no
 _LT_TAGVAR(hardcode_direct_absolute, $1)=no
 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
+_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
 _LT_TAGVAR(hardcode_libdir_separator, $1)=
 _LT_TAGVAR(hardcode_minus_L, $1)=no
 _LT_TAGVAR(hardcode_automatic, $1)=no
@@ -7196,8 +6612,6 @@ _LT_TAGVAR(module_cmds, $1)=
 _LT_TAGVAR(module_expsym_cmds, $1)=
 _LT_TAGVAR(link_all_deplibs, $1)=unknown
 _LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
-_LT_TAGVAR(reload_flag, $1)=$reload_flag
-_LT_TAGVAR(reload_cmds, $1)=$reload_cmds
 _LT_TAGVAR(no_undefined_flag, $1)=
 _LT_TAGVAR(whole_archive_flag_spec, $1)=
 _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no
@@ -7237,9 +6651,7 @@ if test "$_lt_disable_F77" != yes; then
   # Allow CC to be a program name with arguments.
   lt_save_CC="$CC"
   lt_save_GCC=$GCC
-  lt_save_CFLAGS=$CFLAGS
   CC=${F77-"f77"}
-  CFLAGS=$FFLAGS
   compiler=$CC
   _LT_TAGVAR(compiler, $1)=$CC
   _LT_CC_BASENAME([$compiler])
@@ -7293,24 +6705,38 @@ if test "$_lt_disable_F77" != yes; then
 
   GCC=$lt_save_GCC
   CC="$lt_save_CC"
-  CFLAGS="$lt_save_CFLAGS"
 fi # test "$_lt_disable_F77" != yes
 
 AC_LANG_POP
 ])# _LT_LANG_F77_CONFIG
 
 
+# _LT_PROG_FC
+# -----------
+# Since AC_PROG_FC is broken, in that it returns the empty string
+# if there is no fortran compiler, we have our own version here.
+m4_defun([_LT_PROG_FC],
+[
+pushdef([AC_MSG_ERROR], [_lt_disable_FC=yes])
+AC_PROG_FC
+if test -z "$FC" || test "X$FC" = "Xno"; then
+  _lt_disable_FC=yes
+fi
+popdef([AC_MSG_ERROR])
+])# _LT_PROG_FC
+
+dnl aclocal-1.4 backwards compatibility:
+dnl AC_DEFUN([_LT_PROG_FC], [])
+
+
 # _LT_LANG_FC_CONFIG([TAG])
 # -------------------------
 # Ensure that the configuration variables for a Fortran compiler are
 # suitably defined.  These variables are subsequently used by _LT_CONFIG
 # to write the compiler configuration to `libtool'.
 m4_defun([_LT_LANG_FC_CONFIG],
-[AC_LANG_PUSH(Fortran)
-
-if test -z "$FC" || test "X$FC" = "Xno"; then
-  _lt_disable_FC=yes
-fi
+[AC_REQUIRE([_LT_PROG_FC])dnl
+AC_LANG_PUSH(Fortran)
 
 _LT_TAGVAR(archive_cmds_need_lc, $1)=no
 _LT_TAGVAR(allow_undefined_flag, $1)=
@@ -7320,6 +6746,7 @@ _LT_TAGVAR(export_dynamic_flag_spec, $1)
 _LT_TAGVAR(hardcode_direct, $1)=no
 _LT_TAGVAR(hardcode_direct_absolute, $1)=no
 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
+_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
 _LT_TAGVAR(hardcode_libdir_separator, $1)=
 _LT_TAGVAR(hardcode_minus_L, $1)=no
 _LT_TAGVAR(hardcode_automatic, $1)=no
@@ -7328,8 +6755,6 @@ _LT_TAGVAR(module_cmds, $1)=
 _LT_TAGVAR(module_expsym_cmds, $1)=
 _LT_TAGVAR(link_all_deplibs, $1)=unknown
 _LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
-_LT_TAGVAR(reload_flag, $1)=$reload_flag
-_LT_TAGVAR(reload_cmds, $1)=$reload_cmds
 _LT_TAGVAR(no_undefined_flag, $1)=
 _LT_TAGVAR(whole_archive_flag_spec, $1)=
 _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no
@@ -7369,9 +6794,7 @@ if test "$_lt_disable_FC" != yes; then
   # Allow CC to be a program name with arguments.
   lt_save_CC="$CC"
   lt_save_GCC=$GCC
-  lt_save_CFLAGS=$CFLAGS
   CC=${FC-"f95"}
-  CFLAGS=$FCFLAGS
   compiler=$CC
   GCC=$ac_cv_fc_compiler_gnu
 
@@ -7427,8 +6850,7 @@ if test "$_lt_disable_FC" != yes; then
   fi # test -n "$compiler"
 
   GCC=$lt_save_GCC
-  CC=$lt_save_CC
-  CFLAGS=$lt_save_CFLAGS
+  CC="$lt_save_CC"
 fi # test "$_lt_disable_FC" != yes
 
 AC_LANG_POP
@@ -7465,12 +6887,10 @@ _LT_COMPILER_BOILERPLATE
 _LT_LINKER_BOILERPLATE
 
 # Allow CC to be a program name with arguments.
-lt_save_CC=$CC
-lt_save_CFLAGS=$CFLAGS
+lt_save_CC="$CC"
 lt_save_GCC=$GCC
 GCC=yes
 CC=${GCJ-"gcj"}
-CFLAGS=$GCJFLAGS
 compiler=$CC
 _LT_TAGVAR(compiler, $1)=$CC
 _LT_TAGVAR(LD, $1)="$LD"
@@ -7480,8 +6900,6 @@ _LT_CC_BASENAME([$compiler])
 _LT_TAGVAR(archive_cmds_need_lc, $1)=no
 
 _LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
-_LT_TAGVAR(reload_flag, $1)=$reload_flag
-_LT_TAGVAR(reload_cmds, $1)=$reload_cmds
 
 if test -n "$compiler"; then
   _LT_COMPILER_NO_RTTI($1)
@@ -7497,78 +6915,10 @@ fi
 AC_LANG_RESTORE
 
 GCC=$lt_save_GCC
-CC=$lt_save_CC
-CFLAGS=$lt_save_CFLAGS
+CC="$lt_save_CC"
 ])# _LT_LANG_GCJ_CONFIG
 
 
-# _LT_LANG_GO_CONFIG([TAG])
-# --------------------------
-# Ensure that the configuration variables for the GNU Go compiler
-# are suitably defined.  These variables are subsequently used by _LT_CONFIG
-# to write the compiler configuration to `libtool'.
-m4_defun([_LT_LANG_GO_CONFIG],
-[AC_REQUIRE([LT_PROG_GO])dnl
-AC_LANG_SAVE
-
-# Source file extension for Go test sources.
-ac_ext=go
-
-# Object file extension for compiled Go test sources.
-objext=o
-_LT_TAGVAR(objext, $1)=$objext
-
-# Code to be used in simple compile tests
-lt_simple_compile_test_code="package main; func main() { }"
-
-# Code to be used in simple link tests
-lt_simple_link_test_code='package main; func main() { }'
-
-# ltmain only uses $CC for tagged configurations so make sure $CC is set.
-_LT_TAG_COMPILER
-
-# save warnings/boilerplate of simple test code
-_LT_COMPILER_BOILERPLATE
-_LT_LINKER_BOILERPLATE
-
-# Allow CC to be a program name with arguments.
-lt_save_CC=$CC
-lt_save_CFLAGS=$CFLAGS
-lt_save_GCC=$GCC
-GCC=yes
-CC=${GOC-"gccgo"}
-CFLAGS=$GOFLAGS
-compiler=$CC
-_LT_TAGVAR(compiler, $1)=$CC
-_LT_TAGVAR(LD, $1)="$LD"
-_LT_CC_BASENAME([$compiler])
-
-# Go did not exist at the time GCC didn't implicitly link libc in.
-_LT_TAGVAR(archive_cmds_need_lc, $1)=no
-
-_LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
-_LT_TAGVAR(reload_flag, $1)=$reload_flag
-_LT_TAGVAR(reload_cmds, $1)=$reload_cmds
-
-if test -n "$compiler"; then
-  _LT_COMPILER_NO_RTTI($1)
-  _LT_COMPILER_PIC($1)
-  _LT_COMPILER_C_O($1)
-  _LT_COMPILER_FILE_LOCKS($1)
-  _LT_LINKER_SHLIBS($1)
-  _LT_LINKER_HARDCODE_LIBPATH($1)
-
-  _LT_CONFIG($1)
-fi
-
-AC_LANG_RESTORE
-
-GCC=$lt_save_GCC
-CC=$lt_save_CC
-CFLAGS=$lt_save_CFLAGS
-])# _LT_LANG_GO_CONFIG
-
-
 # _LT_LANG_RC_CONFIG([TAG])
 # -------------------------
 # Ensure that the configuration variables for the Windows resource compiler
@@ -7600,11 +6950,9 @@ _LT_LINKER_BOILERPLATE
 
 # Allow CC to be a program name with arguments.
 lt_save_CC="$CC"
-lt_save_CFLAGS=$CFLAGS
 lt_save_GCC=$GCC
 GCC=
 CC=${RC-"windres"}
-CFLAGS=
 compiler=$CC
 _LT_TAGVAR(compiler, $1)=$CC
 _LT_CC_BASENAME([$compiler])
@@ -7617,8 +6965,7 @@ fi
 
 GCC=$lt_save_GCC
 AC_LANG_RESTORE
-CC=$lt_save_CC
-CFLAGS=$lt_save_CFLAGS
+CC="$lt_save_CC"
 ])# _LT_LANG_RC_CONFIG
 
 
@@ -7638,13 +6985,6 @@ dnl aclocal-1.4 backwards compatibility:
 dnl AC_DEFUN([LT_AC_PROG_GCJ], [])
 
 
-# LT_PROG_GO
-# ----------
-AC_DEFUN([LT_PROG_GO],
-[AC_CHECK_TOOL(GOC, gccgo,)
-])
-
-
 # LT_PROG_RC
 # ----------
 AC_DEFUN([LT_PROG_RC],
@@ -7684,15 +7024,6 @@ _LT_DECL([], [OBJDUMP], [1], [An object
 AC_SUBST([OBJDUMP])
 ])
 
-# _LT_DECL_DLLTOOL
-# ----------------
-# Ensure DLLTOOL variable is set.
-m4_defun([_LT_DECL_DLLTOOL],
-[AC_CHECK_TOOL(DLLTOOL, dlltool, false)
-test -z "$DLLTOOL" && DLLTOOL=dlltool
-_LT_DECL([], [DLLTOOL], [1], [DLL creation program])
-AC_SUBST([DLLTOOL])
-])
 
 # _LT_DECL_SED
 # ------------
@@ -7784,8 +7115,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
 # Try some XSI features
 xsi_shell=no
 ( _lt_dummy="a/b/c"
-  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%"$_lt_dummy"}, \
-      = c,a/b,b/c, \
+  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
+      = c,a/b,, \
     && eval 'test $(( 1 + 1 )) -eq 2 \
     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
   && xsi_shell=yes
@@ -7824,177 +7155,222 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
 ])# _LT_CHECK_SHELL_FEATURES
 
 
-# _LT_PROG_FUNCTION_REPLACE (FUNCNAME, REPLACEMENT-BODY)
-# ------------------------------------------------------
-# In `$cfgfile', look for function FUNCNAME delimited by `^FUNCNAME ()$' and
-# '^} FUNCNAME ', and replace its body with REPLACEMENT-BODY.
-m4_defun([_LT_PROG_FUNCTION_REPLACE],
-[dnl {
-sed -e '/^$1 ()$/,/^} # $1 /c\
-$1 ()\
-{\
-m4_bpatsubsts([$2], [$], [\\], [^\([	 ]\)], [\\\1])
-} # Extended-shell $1 implementation' "$cfgfile" > $cfgfile.tmp \
-  && mv -f "$cfgfile.tmp" "$cfgfile" \
-    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
-test 0 -eq $? || _lt_function_replace_fail=:
-])
+# _LT_PROG_XSI_SHELLFNS
+# ---------------------
+# Bourne and XSI compatible variants of some useful shell functions.
+m4_defun([_LT_PROG_XSI_SHELLFNS],
+[case $xsi_shell in
+  yes)
+    cat << \_LT_EOF >> "$cfgfile"
+
+# func_dirname file append nondir_replacement
+# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
+# otherwise set result to NONDIR_REPLACEMENT.
+func_dirname ()
+{
+  case ${1} in
+    */*) func_dirname_result="${1%/*}${2}" ;;
+    *  ) func_dirname_result="${3}" ;;
+  esac
+}
 
+# func_basename file
+func_basename ()
+{
+  func_basename_result="${1##*/}"
+}
 
-# _LT_PROG_REPLACE_SHELLFNS
-# -------------------------
-# Replace existing portable implementations of several shell functions with
-# equivalent extended shell implementations where those features are available..
-m4_defun([_LT_PROG_REPLACE_SHELLFNS],
-[if test x"$xsi_shell" = xyes; then
-  _LT_PROG_FUNCTION_REPLACE([func_dirname], [dnl
-    case ${1} in
-      */*) func_dirname_result="${1%/*}${2}" ;;
-      *  ) func_dirname_result="${3}" ;;
-    esac])
-
-  _LT_PROG_FUNCTION_REPLACE([func_basename], [dnl
-    func_basename_result="${1##*/}"])
-
-  _LT_PROG_FUNCTION_REPLACE([func_dirname_and_basename], [dnl
-    case ${1} in
-      */*) func_dirname_result="${1%/*}${2}" ;;
-      *  ) func_dirname_result="${3}" ;;
-    esac
-    func_basename_result="${1##*/}"])
+# func_dirname_and_basename file append nondir_replacement
+# perform func_basename and func_dirname in a single function
+# call:
+#   dirname:  Compute the dirname of FILE.  If nonempty,
+#             add APPEND to the result, otherwise set result
+#             to NONDIR_REPLACEMENT.
+#             value returned in "$func_dirname_result"
+#   basename: Compute filename of FILE.
+#             value retuned in "$func_basename_result"
+# Implementation must be kept synchronized with func_dirname
+# and func_basename. For efficiency, we do not delegate to
+# those functions but instead duplicate the functionality here.
+func_dirname_and_basename ()
+{
+  case ${1} in
+    */*) func_dirname_result="${1%/*}${2}" ;;
+    *  ) func_dirname_result="${3}" ;;
+  esac
+  func_basename_result="${1##*/}"
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_stripname], [dnl
-    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
-    # positional parameters, so assign one to ordinary parameter first.
-    func_stripname_result=${3}
-    func_stripname_result=${func_stripname_result#"${1}"}
-    func_stripname_result=${func_stripname_result%"${2}"}])
+# func_stripname prefix suffix name
+# strip PREFIX and SUFFIX off of NAME.
+# PREFIX and SUFFIX must not contain globbing or regex special
+# characters, hashes, percent signs, but SUFFIX may contain a leading
+# dot (in which case that matches only a dot).
+func_stripname ()
+{
+  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
+  # positional parameters, so assign one to ordinary parameter first.
+  func_stripname_result=${3}
+  func_stripname_result=${func_stripname_result#"${1}"}
+  func_stripname_result=${func_stripname_result%"${2}"}
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_split_long_opt], [dnl
-    func_split_long_opt_name=${1%%=*}
-    func_split_long_opt_arg=${1#*=}])
+# func_opt_split
+func_opt_split ()
+{
+  func_opt_split_opt=${1%%=*}
+  func_opt_split_arg=${1#*=}
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_split_short_opt], [dnl
-    func_split_short_opt_arg=${1#??}
-    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}])
+# func_lo2o object
+func_lo2o ()
+{
+  case ${1} in
+    *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
+    *)    func_lo2o_result=${1} ;;
+  esac
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_lo2o], [dnl
-    case ${1} in
-      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
-      *)    func_lo2o_result=${1} ;;
-    esac])
+# func_xform libobj-or-source
+func_xform ()
+{
+  func_xform_result=${1%.*}.lo
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_xform], [    func_xform_result=${1%.*}.lo])
+# func_arith arithmetic-term...
+func_arith ()
+{
+  func_arith_result=$(( $[*] ))
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_arith], [    func_arith_result=$(( $[*] ))])
+# func_len string
+# STRING may not start with a hyphen.
+func_len ()
+{
+  func_len_result=${#1}
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_len], [    func_len_result=${#1}])
-fi
+_LT_EOF
+    ;;
+  *) # Bourne compatible functions.
+    cat << \_LT_EOF >> "$cfgfile"
 
-if test x"$lt_shell_append" = xyes; then
-  _LT_PROG_FUNCTION_REPLACE([func_append], [    eval "${1}+=\\${2}"])
+# func_dirname file append nondir_replacement
+# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
+# otherwise set result to NONDIR_REPLACEMENT.
+func_dirname ()
+{
+  # Extract subdirectory from the argument.
+  func_dirname_result=`$ECHO "X${1}" | $Xsed -e "$dirname"`
+  if test "X$func_dirname_result" = "X${1}"; then
+    func_dirname_result="${3}"
+  else
+    func_dirname_result="$func_dirname_result${2}"
+  fi
+}
 
-  _LT_PROG_FUNCTION_REPLACE([func_append_quoted], [dnl
-    func_quote_for_eval "${2}"
-dnl m4 expansion turns \\\\ into \\, and then the shell eval turns that into \
-    eval "${1}+=\\\\ \\$func_quote_for_eval_result"])
+# func_basename file
+func_basename ()
+{
+  func_basename_result=`$ECHO "X${1}" | $Xsed -e "$basename"`
+}
 
-  # Save a `func_append' function call where possible by direct use of '+='
-  sed -e 's%func_append \([[a-zA-Z_]]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
-    && mv -f "$cfgfile.tmp" "$cfgfile" \
-      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
-  test 0 -eq $? || _lt_function_replace_fail=:
-else
-  # Save a `func_append' function call even when '+=' is not available
-  sed -e 's%func_append \([[a-zA-Z_]]\{1,\}\) "%\1="$\1%g' $cfgfile > $cfgfile.tmp \
-    && mv -f "$cfgfile.tmp" "$cfgfile" \
-      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
-  test 0 -eq $? || _lt_function_replace_fail=:
-fi
+dnl func_dirname_and_basename
+dnl A portable version of this function is already defined in general.m4sh
+dnl so there is no need for it here.
 
-if test x"$_lt_function_replace_fail" = x":"; then
-  AC_MSG_WARN([Unable to substitute extended shell functions in $ofile])
-fi
-])
+# func_stripname prefix suffix name
+# strip PREFIX and SUFFIX off of NAME.
+# PREFIX and SUFFIX must not contain globbing or regex special
+# characters, hashes, percent signs, but SUFFIX may contain a leading
+# dot (in which case that matches only a dot).
+# func_strip_suffix prefix name
+func_stripname ()
+{
+  case ${2} in
+    .*) func_stripname_result=`$ECHO "X${3}" \
+           | $Xsed -e "s%^${1}%%" -e "s%\\\\${2}\$%%"`;;
+    *)  func_stripname_result=`$ECHO "X${3}" \
+           | $Xsed -e "s%^${1}%%" -e "s%${2}\$%%"`;;
+  esac
+}
 
-# _LT_PATH_CONVERSION_FUNCTIONS
-# -----------------------------
-# Determine which file name conversion functions should be used by
-# func_to_host_file (and, implicitly, by func_to_host_path).  These are needed
-# for certain cross-compile configurations and native mingw.
-m4_defun([_LT_PATH_CONVERSION_FUNCTIONS],
-[AC_REQUIRE([AC_CANONICAL_HOST])dnl
-AC_REQUIRE([AC_CANONICAL_BUILD])dnl
-AC_MSG_CHECKING([how to convert $build file names to $host format])
-AC_CACHE_VAL(lt_cv_to_host_file_cmd,
-[case $host in
-  *-*-mingw* )
-    case $build in
-      *-*-mingw* ) # actually msys
-        lt_cv_to_host_file_cmd=func_convert_file_msys_to_w32
-        ;;
-      *-*-cygwin* )
-        lt_cv_to_host_file_cmd=func_convert_file_cygwin_to_w32
-        ;;
-      * ) # otherwise, assume *nix
-        lt_cv_to_host_file_cmd=func_convert_file_nix_to_w32
-        ;;
-    esac
-    ;;
-  *-*-cygwin* )
-    case $build in
-      *-*-mingw* ) # actually msys
-        lt_cv_to_host_file_cmd=func_convert_file_msys_to_cygwin
-        ;;
-      *-*-cygwin* )
-        lt_cv_to_host_file_cmd=func_convert_file_noop
-        ;;
-      * ) # otherwise, assume *nix
-        lt_cv_to_host_file_cmd=func_convert_file_nix_to_cygwin
-        ;;
-    esac
-    ;;
-  * ) # unhandled hosts (and "normal" native builds)
-    lt_cv_to_host_file_cmd=func_convert_file_noop
-    ;;
+# sed scripts:
+my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
+my_sed_long_arg='1s/^-[[^=]]*=//'
+
+# func_opt_split
+func_opt_split ()
+{
+  func_opt_split_opt=`$ECHO "X${1}" | $Xsed -e "$my_sed_long_opt"`
+  func_opt_split_arg=`$ECHO "X${1}" | $Xsed -e "$my_sed_long_arg"`
+}
+
+# func_lo2o object
+func_lo2o ()
+{
+  func_lo2o_result=`$ECHO "X${1}" | $Xsed -e "$lo2o"`
+}
+
+# func_xform libobj-or-source
+func_xform ()
+{
+  func_xform_result=`$ECHO "X${1}" | $Xsed -e 's/\.[[^.]]*$/.lo/'`
+}
+
+# func_arith arithmetic-term...
+func_arith ()
+{
+  func_arith_result=`expr "$[@]"`
+}
+
+# func_len string
+# STRING may not start with a hyphen.
+func_len ()
+{
+  func_len_result=`expr "$[1]" : ".*" 2>/dev/null || echo $max_cmd_len`
+}
+
+_LT_EOF
 esac
-])
-to_host_file_cmd=$lt_cv_to_host_file_cmd
-AC_MSG_RESULT([$lt_cv_to_host_file_cmd])
-_LT_DECL([to_host_file_cmd], [lt_cv_to_host_file_cmd],
-         [0], [convert $build file names to $host format])dnl
-
-AC_MSG_CHECKING([how to convert $build file names to toolchain format])
-AC_CACHE_VAL(lt_cv_to_tool_file_cmd,
-[#assume ordinary cross tools, or native build.
-lt_cv_to_tool_file_cmd=func_convert_file_noop
-case $host in
-  *-*-mingw* )
-    case $build in
-      *-*-mingw* ) # actually msys
-        lt_cv_to_tool_file_cmd=func_convert_file_msys_to_w32
-        ;;
-    esac
+
+case $lt_shell_append in
+  yes)
+    cat << \_LT_EOF >> "$cfgfile"
+
+# func_append var value
+# Append VALUE to the end of shell variable VAR.
+func_append ()
+{
+  eval "$[1]+=\$[2]"
+}
+_LT_EOF
     ;;
-esac
+  *)
+    cat << \_LT_EOF >> "$cfgfile"
+
+# func_append var value
+# Append VALUE to the end of shell variable VAR.
+func_append ()
+{
+  eval "$[1]=\$$[1]\$[2]"
+}
+
+_LT_EOF
+    ;;
+  esac
 ])
-to_tool_file_cmd=$lt_cv_to_tool_file_cmd
-AC_MSG_RESULT([$lt_cv_to_tool_file_cmd])
-_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
-         [0], [convert $build files to toolchain format])dnl
-])# _LT_PATH_CONVERSION_FUNCTIONS
 
 # Helper functions for option handling.                    -*- Autoconf -*-
 #
-#   Copyright (C) 2004, 2005, 2007, 2008, 2009 Free Software Foundation,
-#   Inc.
+#   Copyright (C) 2004, 2005, 2007, 2008 Free Software Foundation, Inc.
 #   Written by Gary V. Vaughan, 2004
 #
 # This file is free software; the Free Software Foundation gives
 # unlimited permission to copy and/or distribute it, with or without
 # modifications, as long as this notice is preserved.
 
-# serial 7 ltoptions.m4
+# serial 6 ltoptions.m4
 
 # This is to help aclocal find these macros, as it can't see m4_define.
 AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
@@ -8109,7 +7485,7 @@ LT_OPTION_DEFINE([LT_INIT], [win32-dll],
 [enable_win32_dll=yes
 
 case $host in
-*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-cegcc*)
+*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-cegcc*)
   AC_CHECK_TOOL(AS, as, false)
   AC_CHECK_TOOL(DLLTOOL, dlltool, false)
   AC_CHECK_TOOL(OBJDUMP, objdump, false)
@@ -8117,13 +7493,13 @@ case $host in
 esac
 
 test -z "$AS" && AS=as
-_LT_DECL([], [AS],      [1], [Assembler program])dnl
+_LT_DECL([], [AS],      [0], [Assembler program])dnl
 
 test -z "$DLLTOOL" && DLLTOOL=dlltool
-_LT_DECL([], [DLLTOOL], [1], [DLL creation program])dnl
+_LT_DECL([], [DLLTOOL], [0], [DLL creation program])dnl
 
 test -z "$OBJDUMP" && OBJDUMP=objdump
-_LT_DECL([], [OBJDUMP], [1], [Object dumper program])dnl
+_LT_DECL([], [OBJDUMP], [0], [Object dumper program])dnl
 ])# win32-dll
 
 AU_DEFUN([AC_LIBTOOL_WIN32_DLL],
@@ -8309,24 +7685,9 @@ dnl AC_DEFUN([AM_DISABLE_FAST_INSTALL],
 # MODE is either `yes' or `no'.  If omitted, it defaults to `both'.
 m4_define([_LT_WITH_PIC],
 [AC_ARG_WITH([pic],
-    [AS_HELP_STRING([--with-pic@<:@=PKGS@:>@],
+    [AS_HELP_STRING([--with-pic],
 	[try to use only PIC/non-PIC objects @<:@default=use both@:>@])],
-    [lt_p=${PACKAGE-default}
-    case $withval in
-    yes|no) pic_mode=$withval ;;
-    *)
-      pic_mode=default
-      # Look at the argument we got.  We use all the common list separators.
-      lt_save_ifs="$IFS"; IFS="${IFS}$PATH_SEPARATOR,"
-      for lt_pkg in $withval; do
-	IFS="$lt_save_ifs"
-	if test "X$lt_pkg" = "X$lt_p"; then
-	  pic_mode=yes
-	fi
-      done
-      IFS="$lt_save_ifs"
-      ;;
-    esac],
+    [pic_mode="$withval"],
     [pic_mode=default])
 
 test -z "$pic_mode" && pic_mode=m4_default([$1], [default])
@@ -8496,31 +7857,31 @@ m4_define([lt_dict_filter],
 # unlimited permission to copy and/or distribute it, with or without
 # modifications, as long as this notice is preserved.
 
-# @configure_input@
+# Generated from ltversion.in.
 
-# serial 3337 ltversion.m4
+# serial 3017 ltversion.m4
 # This file is part of GNU Libtool
 
-m4_define([LT_PACKAGE_VERSION], [2.4.2])
-m4_define([LT_PACKAGE_REVISION], [1.3337])
+m4_define([LT_PACKAGE_VERSION], [2.2.6b])
+m4_define([LT_PACKAGE_REVISION], [1.3017])
 
 AC_DEFUN([LTVERSION_VERSION],
-[macro_version='2.4.2'
-macro_revision='1.3337'
+[macro_version='2.2.6b'
+macro_revision='1.3017'
 _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
 _LT_DECL(, macro_revision, 0)
 ])
 
 # lt~obsolete.m4 -- aclocal satisfying obsolete definitions.    -*-Autoconf-*-
 #
-#   Copyright (C) 2004, 2005, 2007, 2009 Free Software Foundation, Inc.
+#   Copyright (C) 2004, 2005, 2007 Free Software Foundation, Inc.
 #   Written by Scott James Remnant, 2004.
 #
 # This file is free software; the Free Software Foundation gives
 # unlimited permission to copy and/or distribute it, with or without
 # modifications, as long as this notice is preserved.
 
-# serial 5 lt~obsolete.m4
+# serial 4 lt~obsolete.m4
 
 # These exist entirely to fool aclocal when bootstrapping libtool.
 #
@@ -8590,6 +7951,7 @@ m4_ifndef([AC_DISABLE_FAST_INSTALL],	[AC
 m4_ifndef([_LT_AC_LANG_CXX],		[AC_DEFUN([_LT_AC_LANG_CXX])])
 m4_ifndef([_LT_AC_LANG_F77],		[AC_DEFUN([_LT_AC_LANG_F77])])
 m4_ifndef([_LT_AC_LANG_GCJ],		[AC_DEFUN([_LT_AC_LANG_GCJ])])
+m4_ifndef([AC_LIBTOOL_RC],		[AC_DEFUN([AC_LIBTOOL_RC])])
 m4_ifndef([AC_LIBTOOL_LANG_C_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_C_CONFIG])])
 m4_ifndef([_LT_AC_LANG_C_CONFIG],	[AC_DEFUN([_LT_AC_LANG_C_CONFIG])])
 m4_ifndef([AC_LIBTOOL_LANG_CXX_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_CXX_CONFIG])])
@@ -8602,13 +7964,6 @@ m4_ifndef([AC_LIBTOOL_LANG_RC_CONFIG],	[
 m4_ifndef([_LT_AC_LANG_RC_CONFIG],	[AC_DEFUN([_LT_AC_LANG_RC_CONFIG])])
 m4_ifndef([AC_LIBTOOL_CONFIG],		[AC_DEFUN([AC_LIBTOOL_CONFIG])])
 m4_ifndef([_LT_AC_FILE_LTDLL_C],	[AC_DEFUN([_LT_AC_FILE_LTDLL_C])])
-m4_ifndef([_LT_REQUIRED_DARWIN_CHECKS],	[AC_DEFUN([_LT_REQUIRED_DARWIN_CHECKS])])
-m4_ifndef([_LT_AC_PROG_CXXCPP],		[AC_DEFUN([_LT_AC_PROG_CXXCPP])])
-m4_ifndef([_LT_PREPARE_SED_QUOTE_VARS],	[AC_DEFUN([_LT_PREPARE_SED_QUOTE_VARS])])
-m4_ifndef([_LT_PROG_ECHO_BACKSLASH],	[AC_DEFUN([_LT_PROG_ECHO_BACKSLASH])])
-m4_ifndef([_LT_PROG_F77],		[AC_DEFUN([_LT_PROG_F77])])
-m4_ifndef([_LT_PROG_FC],		[AC_DEFUN([_LT_PROG_FC])])
-m4_ifndef([_LT_PROG_CXX],		[AC_DEFUN([_LT_PROG_CXX])])
 
 # pkg.m4 - Macros to locate and utilise pkg-config.            -*- Autoconf -*-
 # serial 1 (pkg-config-0.24)
@@ -8816,8 +8171,6 @@ m4_popdef([pkg_description])
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 8
-
 # AM_AUTOMAKE_VERSION(VERSION)
 # ----------------------------
 # Automake X.Y traces this macro to ensure aclocal.m4 has been
@@ -8827,7 +8180,7 @@ AC_DEFUN([AM_AUTOMAKE_VERSION],
 [am__api_version='1.12'
 dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
 dnl require some minimum version.  Point them to the right macro.
-m4_if([$1], [1.12.2], [],
+m4_if([$1], [1.12.6], [],
       [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
 ])
 
@@ -8843,7 +8196,7 @@ m4_define([_AM_AUTOCONF_VERSION], [])
 # Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
 # This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
 AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
-[AM_AUTOMAKE_VERSION([1.12.2])dnl
+[AM_AUTOMAKE_VERSION([1.12.6])dnl
 m4_ifndef([AC_AUTOCONF_VERSION],
   [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
 _AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])
@@ -8856,8 +8209,6 @@ _AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCON
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 2
-
 # For projects using AC_CONFIG_AUX_DIR([foo]), Autoconf sets
 # $ac_aux_dir to '$srcdir/foo'.  In other projects, it is set to
 # '$srcdir', '$srcdir/..', or '$srcdir/../..'.
@@ -8911,8 +8262,6 @@ am_aux_dir=`cd $ac_aux_dir && pwd`
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 10
-
 # AM_CONDITIONAL(NAME, SHELL-CONDITION)
 # -------------------------------------
 # Define a conditional.
@@ -8944,7 +8293,6 @@ fi])])
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 17
 
 # There are a few dirty hacks below to avoid letting 'AC_PROG_CC' be
 # written in clear, in which case automake, when reading aclocal.m4,
@@ -9136,7 +8484,6 @@ _AM_SUBST_NOTMAKE([am__nodep])dnl
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 6
 
 # _AM_OUTPUT_DEPENDENCY_COMMANDS
 # ------------------------------
@@ -9211,8 +8558,6 @@ AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS]
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 8
-
 # AM_CONFIG_HEADER is obsolete.  It has been replaced by AC_CONFIG_HEADERS.
 AU_DEFUN([AM_CONFIG_HEADER], [AC_CONFIG_HEADERS($@)])
 
@@ -9224,8 +8569,6 @@ AU_DEFUN([AM_CONFIG_HEADER], [AC_CONFIG_
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 19
-
 # This macro actually does too much.  Some checks are only needed if
 # your package does certain things.  But this isn't really a big deal.
 
@@ -9377,8 +8720,6 @@ echo "timestamp for $_am_arg" >`AS_DIRNA
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 8
-
 # AM_PROG_INSTALL_SH
 # ------------------
 # Define $install_sh.
@@ -9400,8 +8741,6 @@ AC_SUBST([install_sh])])
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 2
-
 # Check whether the underlying file-system supports filenames
 # with a leading dot.  For instance MS-DOS doesn't.
 AC_DEFUN([AM_SET_LEADING_DOT],
@@ -9423,8 +8762,6 @@ AC_SUBST([am__leading_dot])])
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 5
-
 # AM_MAKE_INCLUDE()
 # -----------------
 # Check to see how make treats includes.
@@ -9475,8 +8812,6 @@ rm -f confinc confmf
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 7
-
 # AM_MISSING_PROG(NAME, PROGRAM)
 # ------------------------------
 AC_DEFUN([AM_MISSING_PROG],
@@ -9484,7 +8819,6 @@ AC_DEFUN([AM_MISSING_PROG],
 $1=${$1-"${am_missing_run}$2"}
 AC_SUBST($1)])
 
-
 # AM_MISSING_HAS_RUN
 # ------------------
 # Define MISSING if not defined so far and test if it supports --run.
@@ -9517,8 +8851,6 @@ fi
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 6
-
 # _AM_MANGLE_OPTION(NAME)
 # -----------------------
 AC_DEFUN([_AM_MANGLE_OPTION],
@@ -9550,8 +8882,6 @@ AC_DEFUN([_AM_IF_OPTION],
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 9
-
 # AM_SANITY_CHECK
 # ---------------
 AC_DEFUN([AM_SANITY_CHECK],
@@ -9633,8 +8963,6 @@ rm -f conftest.file
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 3
-
 # AM_SILENT_RULES([DEFAULT])
 # --------------------------
 # Enable less verbose build rules; with the default set to DEFAULT
@@ -9695,8 +9023,6 @@ _AM_SUBST_NOTMAKE([AM_BACKSLASH])dnl
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 2
-
 # AM_PROG_INSTALL_STRIP
 # ---------------------
 # One issue with vendor 'install' (even GNU) is that you can't
@@ -9725,8 +9051,6 @@ AC_SUBST([INSTALL_STRIP_PROGRAM])])
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 3
-
 # _AM_SUBST_NOTMAKE(VARIABLE)
 # ---------------------------
 # Prevent Automake from outputting VARIABLE = @VARIABLE@ in Makefile.in.
@@ -9746,8 +9070,6 @@ AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_
 # gives unlimited permission to copy and/or distribute it,
 # with or without modifications, as long as this notice is preserved.
 
-# serial 3
-
 # _AM_PROG_TAR(FORMAT)
 # --------------------
 # Check how to create a tarball in format FORMAT.
