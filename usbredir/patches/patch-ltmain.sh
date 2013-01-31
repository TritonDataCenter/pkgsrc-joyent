$NetBSD$

--- ltmain.sh.orig	2013-01-22 18:11:37.943656430 +0000
+++ ltmain.sh
@@ -1,9 +1,9 @@
+# Generated from ltmain.m4sh.
 
-# libtool (GNU libtool) 2.4.2
+# ltmain.sh (GNU libtool) 2.2.6b
 # Written by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 
-# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005, 2006,
-# 2007, 2008, 2009, 2010, 2011 Free Software Foundation, Inc.
+# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005, 2006, 2007 2008 Free Software Foundation, Inc.
 # This is free software; see the source for copying conditions.  There is NO
 # warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 
@@ -32,57 +32,50 @@
 #
 # Provide generalized library-building support services.
 #
-#       --config             show all configuration variables
-#       --debug              enable verbose shell tracing
-#   -n, --dry-run            display commands without modifying any files
-#       --features           display basic configuration information and exit
-#       --mode=MODE          use operation mode MODE
-#       --preserve-dup-deps  don't remove duplicate dependency libraries
-#       --quiet, --silent    don't print informational messages
-#       --no-quiet, --no-silent
-#                            print informational messages (default)
-#       --no-warn            don't display warning messages
-#       --tag=TAG            use configuration variables from tag TAG
-#   -v, --verbose            print more informational messages than default
-#       --no-verbose         don't print the extra informational messages
-#       --version            print version information
-#   -h, --help, --help-all   print short, long, or detailed help message
+#     --config             show all configuration variables
+#     --debug              enable verbose shell tracing
+# -n, --dry-run            display commands without modifying any files
+#     --features           display basic configuration information and exit
+#     --mode=MODE          use operation mode MODE
+#     --preserve-dup-deps  don't remove duplicate dependency libraries
+#     --quiet, --silent    don't print informational messages
+#     --tag=TAG            use configuration variables from tag TAG
+# -v, --verbose            print informational messages (default)
+#     --version            print version information
+# -h, --help               print short or long help message
 #
 # MODE must be one of the following:
 #
-#         clean              remove files from the build directory
-#         compile            compile a source file into a libtool object
-#         execute            automatically set library path, then run a program
-#         finish             complete the installation of libtool libraries
-#         install            install libraries or executables
-#         link               create a library or an executable
-#         uninstall          remove libraries from an installed directory
+#       clean              remove files from the build directory
+#       compile            compile a source file into a libtool object
+#       execute            automatically set library path, then run a program
+#       finish             complete the installation of libtool libraries
+#       install            install libraries or executables
+#       link               create a library or an executable
+#       uninstall          remove libraries from an installed directory
 #
-# MODE-ARGS vary depending on the MODE.  When passed as first option,
-# `--mode=MODE' may be abbreviated as `MODE' or a unique abbreviation of that.
+# MODE-ARGS vary depending on the MODE.
 # Try `$progname --help --mode=MODE' for a more detailed description of MODE.
 #
 # When reporting a bug, please describe a test case to reproduce it and
 # include the following information:
 #
-#         host-triplet:	$host
-#         shell:		$SHELL
-#         compiler:		$LTCC
-#         compiler flags:		$LTCFLAGS
-#         linker:		$LD (gnu? $with_gnu_ld)
-#         $progname:	(GNU libtool) 2.4.2
-#         automake:	$automake_version
-#         autoconf:	$autoconf_version
+#       host-triplet:	$host
+#       shell:		$SHELL
+#       compiler:		$LTCC
+#       compiler flags:		$LTCFLAGS
+#       linker:		$LD (gnu? $with_gnu_ld)
+#       $progname:		(GNU libtool) 2.2.6b
+#       automake:		$automake_version
+#       autoconf:		$autoconf_version
 #
 # Report bugs to <bug-libtool@gnu.org>.
-# GNU libtool home page: <http://www.gnu.org/software/libtool/>.
-# General help using GNU software: <http://www.gnu.org/gethelp/>.
 
-PROGRAM=libtool
+PROGRAM=ltmain.sh
 PACKAGE=libtool
-VERSION=2.4.2
+VERSION=2.2.6b
 TIMESTAMP=""
-package_revision=1.3337
+package_revision=1.3017
 
 # Be Bourne compatible
 if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
@@ -98,15 +91,10 @@ fi
 BIN_SH=xpg4; export BIN_SH # for Tru64
 DUALCASE=1; export DUALCASE # for MKS sh
 
-# A function that is used when there is no print builtin or printf.
-func_fallback_echo ()
-{
-  eval 'cat <<_LTECHO_EOF
-$1
-_LTECHO_EOF'
-}
-
 # NLS nuisances: We save the old values to restore during execute mode.
+# Only set LANG and LC_ALL to C if already set.
+# These must not be set unconditionally because not all systems understand
+# e.g. LANG=C (notably SCO).
 lt_user_locale=
 lt_safe_locale=
 for lt_var in LANG LANGUAGE LC_ALL LC_CTYPE LC_COLLATE LC_MESSAGES
@@ -119,28 +107,24 @@ do
 	  lt_safe_locale=\"$lt_var=C; \$lt_safe_locale\"
 	fi"
 done
-LC_ALL=C
-LANGUAGE=C
-export LANGUAGE LC_ALL
 
 $lt_unset CDPATH
 
 
-# Work around backward compatibility issue on IRIX 6.5. On IRIX 6.4+, sh
-# is ksh but when the shell is invoked as "sh" and the current value of
-# the _XPG environment variable is not equal to 1 (one), the special
-# positional parameter $0, within a function call, is the name of the
-# function.
-progpath="$0"
-
-
-
+unset CP
+unset MV
+unset RM
 : ${CP="cp -f"}
-test "${ECHO+set}" = set || ECHO=${as_echo-'printf %s\n'}
+: ${ECHO="echo"}
+: ${EGREP="/bin/grep -E"}
+: ${FGREP="/bin/grep -F"}
+: ${GREP="/bin/grep"}
+: ${LN_S="ln -s"}
 : ${MAKE="make"}
 : ${MKDIR="mkdir"}
 : ${MV="mv -f"}
 : ${RM="rm -f"}
+: ${SED="/bin/sed"}
 : ${SHELL="${CONFIG_SHELL-/bin/sh}"}
 : ${Xsed="$SED -e 1s/^X//"}
 
@@ -160,27 +144,6 @@ IFS=" 	$lt_nl"
 dirname="s,/[^/]*$,,"
 basename="s,^.*/,,"
 
-# func_dirname file append nondir_replacement
-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
-# otherwise set result to NONDIR_REPLACEMENT.
-func_dirname ()
-{
-    func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
-    if test "X$func_dirname_result" = "X${1}"; then
-      func_dirname_result="${3}"
-    else
-      func_dirname_result="$func_dirname_result${2}"
-    fi
-} # func_dirname may be replaced by extended shell implementation
-
-
-# func_basename file
-func_basename ()
-{
-    func_basename_result=`$ECHO "${1}" | $SED "$basename"`
-} # func_basename may be replaced by extended shell implementation
-
-
 # func_dirname_and_basename file append nondir_replacement
 # perform func_basename and func_dirname in a single function
 # call:
@@ -195,183 +158,33 @@ func_basename ()
 # those functions but instead duplicate the functionality here.
 func_dirname_and_basename ()
 {
-    # Extract subdirectory from the argument.
-    func_dirname_result=`$ECHO "${1}" | $SED -e "$dirname"`
-    if test "X$func_dirname_result" = "X${1}"; then
-      func_dirname_result="${3}"
-    else
-      func_dirname_result="$func_dirname_result${2}"
-    fi
-    func_basename_result=`$ECHO "${1}" | $SED -e "$basename"`
-} # func_dirname_and_basename may be replaced by extended shell implementation
-
-
-# func_stripname prefix suffix name
-# strip PREFIX and SUFFIX off of NAME.
-# PREFIX and SUFFIX must not contain globbing or regex special
-# characters, hashes, percent signs, but SUFFIX may contain a leading
-# dot (in which case that matches only a dot).
-# func_strip_suffix prefix name
-func_stripname ()
-{
-    case ${2} in
-      .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
-      *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
-    esac
-} # func_stripname may be replaced by extended shell implementation
-
-
-# These SED scripts presuppose an absolute path with a trailing slash.
-pathcar='s,^/\([^/]*\).*$,\1,'
-pathcdr='s,^/[^/]*,,'
-removedotparts=':dotsl
-		s@/\./@/@g
-		t dotsl
-		s,/\.$,/,'
-collapseslashes='s@/\{1,\}@/@g'
-finalslash='s,/*$,/,'
-
-# func_normal_abspath PATH
-# Remove doubled-up and trailing slashes, "." path components,
-# and cancel out any ".." path components in PATH after making
-# it an absolute path.
-#             value returned in "$func_normal_abspath_result"
-func_normal_abspath ()
-{
-  # Start from root dir and reassemble the path.
-  func_normal_abspath_result=
-  func_normal_abspath_tpath=$1
-  func_normal_abspath_altnamespace=
-  case $func_normal_abspath_tpath in
-    "")
-      # Empty path, that just means $cwd.
-      func_stripname '' '/' "`pwd`"
-      func_normal_abspath_result=$func_stripname_result
-      return
-    ;;
-    # The next three entries are used to spot a run of precisely
-    # two leading slashes without using negated character classes;
-    # we take advantage of case's first-match behaviour.
-    ///*)
-      # Unusual form of absolute path, do nothing.
-    ;;
-    //*)
-      # Not necessarily an ordinary path; POSIX reserves leading '//'
-      # and for example Cygwin uses it to access remote file shares
-      # over CIFS/SMB, so we conserve a leading double slash if found.
-      func_normal_abspath_altnamespace=/
-    ;;
-    /*)
-      # Absolute path, do nothing.
-    ;;
-    *)
-      # Relative path, prepend $cwd.
-      func_normal_abspath_tpath=`pwd`/$func_normal_abspath_tpath
-    ;;
-  esac
-  # Cancel out all the simple stuff to save iterations.  We also want
-  # the path to end with a slash for ease of parsing, so make sure
-  # there is one (and only one) here.
-  func_normal_abspath_tpath=`$ECHO "$func_normal_abspath_tpath" | $SED \
-        -e "$removedotparts" -e "$collapseslashes" -e "$finalslash"`
-  while :; do
-    # Processed it all yet?
-    if test "$func_normal_abspath_tpath" = / ; then
-      # If we ascended to the root using ".." the result may be empty now.
-      if test -z "$func_normal_abspath_result" ; then
-        func_normal_abspath_result=/
-      fi
-      break
-    fi
-    func_normal_abspath_tcomponent=`$ECHO "$func_normal_abspath_tpath" | $SED \
-        -e "$pathcar"`
-    func_normal_abspath_tpath=`$ECHO "$func_normal_abspath_tpath" | $SED \
-        -e "$pathcdr"`
-    # Figure out what to do with it
-    case $func_normal_abspath_tcomponent in
-      "")
-        # Trailing empty path component, ignore it.
-      ;;
-      ..)
-        # Parent dir; strip last assembled component from result.
-        func_dirname "$func_normal_abspath_result"
-        func_normal_abspath_result=$func_dirname_result
-      ;;
-      *)
-        # Actual path component, append it.
-        func_normal_abspath_result=$func_normal_abspath_result/$func_normal_abspath_tcomponent
-      ;;
-    esac
-  done
-  # Restore leading double-slash if one was found on entry.
-  func_normal_abspath_result=$func_normal_abspath_altnamespace$func_normal_abspath_result
+  # Extract subdirectory from the argument.
+  func_dirname_result=`$ECHO "X${1}" | $Xsed -e "$dirname"`
+  if test "X$func_dirname_result" = "X${1}"; then
+    func_dirname_result="${3}"
+  else
+    func_dirname_result="$func_dirname_result${2}"
+  fi
+  func_basename_result=`$ECHO "X${1}" | $Xsed -e "$basename"`
 }
 
-# func_relative_path SRCDIR DSTDIR
-# generates a relative path from SRCDIR to DSTDIR, with a trailing
-# slash if non-empty, suitable for immediately appending a filename
-# without needing to append a separator.
-#             value returned in "$func_relative_path_result"
-func_relative_path ()
-{
-  func_relative_path_result=
-  func_normal_abspath "$1"
-  func_relative_path_tlibdir=$func_normal_abspath_result
-  func_normal_abspath "$2"
-  func_relative_path_tbindir=$func_normal_abspath_result
-
-  # Ascend the tree starting from libdir
-  while :; do
-    # check if we have found a prefix of bindir
-    case $func_relative_path_tbindir in
-      $func_relative_path_tlibdir)
-        # found an exact match
-        func_relative_path_tcancelled=
-        break
-        ;;
-      $func_relative_path_tlibdir*)
-        # found a matching prefix
-        func_stripname "$func_relative_path_tlibdir" '' "$func_relative_path_tbindir"
-        func_relative_path_tcancelled=$func_stripname_result
-        if test -z "$func_relative_path_result"; then
-          func_relative_path_result=.
-        fi
-        break
-        ;;
-      *)
-        func_dirname $func_relative_path_tlibdir
-        func_relative_path_tlibdir=${func_dirname_result}
-        if test "x$func_relative_path_tlibdir" = x ; then
-          # Have to descend all the way to the root!
-          func_relative_path_result=../$func_relative_path_result
-          func_relative_path_tcancelled=$func_relative_path_tbindir
-          break
-        fi
-        func_relative_path_result=../$func_relative_path_result
-        ;;
-    esac
-  done
-
-  # Now calculate path; take care to avoid doubling-up slashes.
-  func_stripname '' '/' "$func_relative_path_result"
-  func_relative_path_result=$func_stripname_result
-  func_stripname '/' '/' "$func_relative_path_tcancelled"
-  if test "x$func_stripname_result" != x ; then
-    func_relative_path_result=${func_relative_path_result}/${func_stripname_result}
-  fi
+# Generated shell functions inserted here.
 
-  # Normalisation. If bindir is libdir, return empty string,
-  # else relative path ending with a slash; either way, target
-  # file name can be directly appended.
-  if test ! -z "$func_relative_path_result"; then
-    func_stripname './' '' "$func_relative_path_result/"
-    func_relative_path_result=$func_stripname_result
-  fi
-}
+# Work around backward compatibility issue on IRIX 6.5. On IRIX 6.4+, sh
+# is ksh but when the shell is invoked as "sh" and the current value of
+# the _XPG environment variable is not equal to 1 (one), the special
+# positional parameter $0, within a function call, is the name of the
+# function.
+progpath="$0"
 
 # The name of this program:
+# In the unlikely event $progname began with a '-', it would play havoc with
+# func_echo (imagine progname=-n), so we prepend ./ in that case:
 func_dirname_and_basename "$progpath"
 progname=$func_basename_result
+case $progname in
+  -*) progname=./$progname ;;
+esac
 
 # Make sure we have an absolute path for reexecution:
 case $progpath in
@@ -383,7 +196,7 @@ case $progpath in
      ;;
   *)
      save_IFS="$IFS"
-     IFS=${PATH_SEPARATOR-:}
+     IFS=:
      for progdir in $PATH; do
        IFS="$save_IFS"
        test -x "$progdir/$progname" && break
@@ -402,15 +215,6 @@ sed_quote_subst='s/\([`"$\\]\)/\\\1/g'
 # Same as above, but do not quote variable references.
 double_quote_subst='s/\(["`\\]\)/\\\1/g'
 
-# Sed substitution that turns a string into a regex matching for the
-# string literally.
-sed_make_literal_regex='s,[].[^$\\*\/],\\&,g'
-
-# Sed substitution that converts a w32 file name or path
-# which contains forward slashes, into one that contains
-# (escaped) backslashes.  A very naive implementation.
-lt_sed_naive_backslashify='s|\\\\*|\\|g;s|/|\\|g;s|\\|\\\\|g'
-
 # Re-`\' parameter expansions in output of double_quote_subst that were
 # `\'-ed in input to the same.  If an odd number of `\' preceded a '$'
 # in input to double_quote_subst, that '$' was protected from expansion.
@@ -439,7 +243,7 @@ opt_warning=:
 # name if it has been set yet.
 func_echo ()
 {
-    $ECHO "$progname: ${opt_mode+$opt_mode: }$*"
+    $ECHO "$progname${mode+: }$mode: $*"
 }
 
 # func_verbose arg...
@@ -454,25 +258,18 @@ func_verbose ()
     :
 }
 
-# func_echo_all arg...
-# Invoke $ECHO with all args, space-separated.
-func_echo_all ()
-{
-    $ECHO "$*"
-}
-
 # func_error arg...
 # Echo program name prefixed message to standard error.
 func_error ()
 {
-    $ECHO "$progname: ${opt_mode+$opt_mode: }"${1+"$@"} 1>&2
+    $ECHO "$progname${mode+: }$mode: "${1+"$@"} 1>&2
 }
 
 # func_warning arg...
 # Echo program name prefixed warning message to standard error.
 func_warning ()
 {
-    $opt_warning && $ECHO "$progname: ${opt_mode+$opt_mode: }warning: "${1+"$@"} 1>&2
+    $opt_warning && $ECHO "$progname${mode+: }$mode: warning: "${1+"$@"} 1>&2
 
     # bash bug again:
     :
@@ -529,9 +326,9 @@ func_mkdir_p ()
         case $my_directory_path in */*) ;; *) break ;; esac
 
         # ...otherwise throw away the child directory and loop
-        my_directory_path=`$ECHO "$my_directory_path" | $SED -e "$dirname"`
+        my_directory_path=`$ECHO "X$my_directory_path" | $Xsed -e "$dirname"`
       done
-      my_dir_list=`$ECHO "$my_dir_list" | $SED 's,:*$,,'`
+      my_dir_list=`$ECHO "X$my_dir_list" | $Xsed -e 's,:*$,,'`
 
       save_mkdir_p_IFS="$IFS"; IFS=':'
       for my_dir in $my_dir_list; do
@@ -581,7 +378,7 @@ func_mktempdir ()
         func_fatal_error "cannot create temporary directory \`$my_tmpdir'"
     fi
 
-    $ECHO "$my_tmpdir"
+    $ECHO "X$my_tmpdir" | $Xsed
 }
 
 
@@ -595,7 +392,7 @@ func_quote_for_eval ()
 {
     case $1 in
       *[\\\`\"\$]*)
-	func_quote_for_eval_unquoted_result=`$ECHO "$1" | $SED "$sed_quote_subst"` ;;
+	func_quote_for_eval_unquoted_result=`$ECHO "X$1" | $Xsed -e "$sed_quote_subst"` ;;
       *)
         func_quote_for_eval_unquoted_result="$1" ;;
     esac
@@ -622,7 +419,7 @@ func_quote_for_expand ()
 {
     case $1 in
       *[\\\`\"]*)
-	my_arg=`$ECHO "$1" | $SED \
+	my_arg=`$ECHO "X$1" | $Xsed \
 	    -e "$double_quote_subst" -e "$sed_double_backslash"` ;;
       *)
         my_arg="$1" ;;
@@ -691,39 +488,15 @@ func_show_eval_locale ()
     fi
 }
 
-# func_tr_sh
-# Turn $1 into a string suitable for a shell variable name.
-# Result is stored in $func_tr_sh_result.  All characters
-# not in the set a-zA-Z0-9_ are replaced with '_'. Further,
-# if $1 begins with a digit, a '_' is prepended as well.
-func_tr_sh ()
-{
-  case $1 in
-  [0-9]* | *[!a-zA-Z0-9_]*)
-    func_tr_sh_result=`$ECHO "$1" | $SED 's/^\([0-9]\)/_\1/; s/[^a-zA-Z0-9_]/_/g'`
-    ;;
-  * )
-    func_tr_sh_result=$1
-    ;;
-  esac
-}
+
+
 
 
 # func_version
 # Echo version message to standard output and exit.
 func_version ()
 {
-    $opt_debug
-
-    $SED -n '/(C)/!b go
-	:more
-	/\./!{
-	  N
-	  s/\n# / /
-	  b more
-	}
-	:go
-	/^# '$PROGRAM' (GNU /,/# warranty; / {
+    $SED -n '/^# '$PROGRAM' (GNU /,/# warranty; / {
         s/^# //
 	s/^# *$//
         s/\((C)\)[ 0-9,-]*\( [1-9][0-9]*\)/\1\2/
@@ -736,28 +509,22 @@ func_version ()
 # Echo short help message to standard output and exit.
 func_usage ()
 {
-    $opt_debug
-
-    $SED -n '/^# Usage:/,/^#  *.*--help/ {
+    $SED -n '/^# Usage:/,/# -h/ {
         s/^# //
 	s/^# *$//
 	s/\$progname/'$progname'/
 	p
     }' < "$progpath"
-    echo
+    $ECHO
     $ECHO "run \`$progname --help | more' for full usage"
     exit $?
 }
 
-# func_help [NOEXIT]
-# Echo long help message to standard output and exit,
-# unless 'noexit' is passed as argument.
+# func_help
+# Echo long help message to standard output and exit.
 func_help ()
 {
-    $opt_debug
-
     $SED -n '/^# Usage:/,/# Report bugs to/ {
-	:print
         s/^# //
 	s/^# *$//
 	s*\$progname*'$progname'*
@@ -767,18 +534,11 @@ func_help ()
 	s*\$LTCFLAGS*'"$LTCFLAGS"'*
 	s*\$LD*'"$LD"'*
 	s/\$with_gnu_ld/'"$with_gnu_ld"'/
-	s/\$automake_version/'"`(${AUTOMAKE-automake} --version) 2>/dev/null |$SED 1q`"'/
-	s/\$autoconf_version/'"`(${AUTOCONF-autoconf} --version) 2>/dev/null |$SED 1q`"'/
+	s/\$automake_version/'"`(automake --version) 2>/dev/null |$SED 1q`"'/
+	s/\$autoconf_version/'"`(autoconf --version) 2>/dev/null |$SED 1q`"'/
 	p
-	d
-     }
-     /^# .* home page:/b print
-     /^# General help using/b print
-     ' < "$progpath"
-    ret=$?
-    if test -z "$1"; then
-      exit $ret
-    fi
+     }' < "$progpath"
+    exit $?
 }
 
 # func_missing_arg argname
@@ -786,106 +546,63 @@ func_help ()
 # exit_cmd.
 func_missing_arg ()
 {
-    $opt_debug
-
-    func_error "missing argument for $1."
+    func_error "missing argument for $1"
     exit_cmd=exit
 }
 
+exit_cmd=:
 
-# func_split_short_opt shortopt
-# Set func_split_short_opt_name and func_split_short_opt_arg shell
-# variables after splitting SHORTOPT after the 2nd character.
-func_split_short_opt ()
-{
-    my_sed_short_opt='1s/^\(..\).*$/\1/;q'
-    my_sed_short_rest='1s/^..\(.*\)$/\1/;q'
-
-    func_split_short_opt_name=`$ECHO "$1" | $SED "$my_sed_short_opt"`
-    func_split_short_opt_arg=`$ECHO "$1" | $SED "$my_sed_short_rest"`
-} # func_split_short_opt may be replaced by extended shell implementation
-
-
-# func_split_long_opt longopt
-# Set func_split_long_opt_name and func_split_long_opt_arg shell
-# variables after splitting LONGOPT at the `=' sign.
-func_split_long_opt ()
-{
-    my_sed_long_opt='1s/^\(--[^=]*\)=.*/\1/;q'
-    my_sed_long_arg='1s/^--[^=]*=//'
-
-    func_split_long_opt_name=`$ECHO "$1" | $SED "$my_sed_long_opt"`
-    func_split_long_opt_arg=`$ECHO "$1" | $SED "$my_sed_long_arg"`
-} # func_split_long_opt may be replaced by extended shell implementation
 
-exit_cmd=:
 
 
 
+# Check that we have a working $ECHO.
+if test "X$1" = X--no-reexec; then
+  # Discard the --no-reexec flag, and continue.
+  shift
+elif test "X$1" = X--fallback-echo; then
+  # Avoid inline document here, it may be left over
+  :
+elif test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t'; then
+  # Yippee, $ECHO works!
+  :
+else
+  # Restart under the correct shell, and then maybe $ECHO will work.
+  exec $SHELL "$progpath" --no-reexec ${1+"$@"}
+fi
 
+if test "X$1" = X--fallback-echo; then
+  # used as fallback echo
+  shift
+  cat <<EOF
+$*
+EOF
+  exit $EXIT_SUCCESS
+fi
 
 magic="%%%MAGIC variable%%%"
 magic_exe="%%%MAGIC EXE variable%%%"
 
 # Global variables.
+# $mode is unset
 nonopt=
+execute_dlfiles=
 preserve_args=
 lo2o="s/\\.lo\$/.${objext}/"
 o2lo="s/\\.${objext}\$/.lo/"
 extracted_archives=
 extracted_serial=0
 
+opt_dry_run=false
+opt_duplicate_deps=false
+opt_silent=false
+opt_debug=:
+
 # If this variable is set in any of the actions, the command in it
 # will be execed at the end.  This prevents here-documents from being
 # left over by shells.
 exec_cmd=
 
-# func_append var value
-# Append VALUE to the end of shell variable VAR.
-func_append ()
-{
-    eval "${1}=\$${1}\${2}"
-} # func_append may be replaced by extended shell implementation
-
-# func_append_quoted var value
-# Quote VALUE and append to the end of shell variable VAR, separated
-# by a space.
-func_append_quoted ()
-{
-    func_quote_for_eval "${2}"
-    eval "${1}=\$${1}\\ \$func_quote_for_eval_result"
-} # func_append_quoted may be replaced by extended shell implementation
-
-
-# func_arith arithmetic-term...
-func_arith ()
-{
-    func_arith_result=`expr "${@}"`
-} # func_arith may be replaced by extended shell implementation
-
-
-# func_len string
-# STRING may not start with a hyphen.
-func_len ()
-{
-    func_len_result=`expr "${1}" : ".*" 2>/dev/null || echo $max_cmd_len`
-} # func_len may be replaced by extended shell implementation
-
-
-# func_lo2o object
-func_lo2o ()
-{
-    func_lo2o_result=`$ECHO "${1}" | $SED "$lo2o"`
-} # func_lo2o may be replaced by extended shell implementation
-
-
-# func_xform libobj-or-source
-func_xform ()
-{
-    func_xform_result=`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
-} # func_xform may be replaced by extended shell implementation
-
-
 # func_fatal_configuration arg...
 # Echo program name prefixed message to standard error, followed by
 # a configuration failure hint, and exit.
@@ -919,16 +636,16 @@ func_config ()
 # Display the features supported by this script.
 func_features ()
 {
-    echo "host: $host"
+    $ECHO "host: $host"
     if test "$build_libtool_libs" = yes; then
-      echo "enable shared libraries"
+      $ECHO "enable shared libraries"
     else
-      echo "disable shared libraries"
+      $ECHO "disable shared libraries"
     fi
     if test "$build_old_libs" = yes; then
-      echo "enable static libraries"
+      $ECHO "enable static libraries"
     else
-      echo "disable static libraries"
+      $ECHO "disable static libraries"
     fi
 
     exit $?
@@ -975,209 +692,117 @@ func_enable_tag ()
   esac
 }
 
-# func_check_version_match
-# Ensure that we are using m4 macros, and libtool script from the same
-# release of libtool.
-func_check_version_match ()
+# Parse options once, thoroughly.  This comes as soon as possible in
+# the script to make things like `libtool --version' happen quickly.
 {
-  if test "$package_revision" != "$macro_revision"; then
-    if test "$VERSION" != "$macro_version"; then
-      if test -z "$macro_version"; then
-        cat >&2 <<_LT_EOF
-$progname: Version mismatch error.  This is $PACKAGE $VERSION, but the
-$progname: definition of this LT_INIT comes from an older release.
-$progname: You should recreate aclocal.m4 with macros from $PACKAGE $VERSION
-$progname: and run autoconf again.
-_LT_EOF
-      else
-        cat >&2 <<_LT_EOF
-$progname: Version mismatch error.  This is $PACKAGE $VERSION, but the
-$progname: definition of this LT_INIT comes from $PACKAGE $macro_version.
-$progname: You should recreate aclocal.m4 with macros from $PACKAGE $VERSION
-$progname: and run autoconf again.
-_LT_EOF
-      fi
-    else
-      cat >&2 <<_LT_EOF
-$progname: Version mismatch error.  This is $PACKAGE $VERSION, revision $package_revision,
-$progname: but the definition of this LT_INIT comes from revision $macro_revision.
-$progname: You should recreate aclocal.m4 with macros from revision $package_revision
-$progname: of $PACKAGE $VERSION and run autoconf again.
-_LT_EOF
-    fi
-
-    exit $EXIT_MISMATCH
-  fi
-}
-
-
-# Shorthand for --mode=foo, only valid as the first argument
-case $1 in
-clean|clea|cle|cl)
-  shift; set dummy --mode clean ${1+"$@"}; shift
-  ;;
-compile|compil|compi|comp|com|co|c)
-  shift; set dummy --mode compile ${1+"$@"}; shift
-  ;;
-execute|execut|execu|exec|exe|ex|e)
-  shift; set dummy --mode execute ${1+"$@"}; shift
-  ;;
-finish|finis|fini|fin|fi|f)
-  shift; set dummy --mode finish ${1+"$@"}; shift
-  ;;
-install|instal|insta|inst|ins|in|i)
-  shift; set dummy --mode install ${1+"$@"}; shift
-  ;;
-link|lin|li|l)
-  shift; set dummy --mode link ${1+"$@"}; shift
-  ;;
-uninstall|uninstal|uninsta|uninst|unins|unin|uni|un|u)
-  shift; set dummy --mode uninstall ${1+"$@"}; shift
-  ;;
-esac
-
-
-
-# Option defaults:
-opt_debug=:
-opt_dry_run=false
-opt_config=false
-opt_preserve_dup_deps=false
-opt_features=false
-opt_finish=false
-opt_help=false
-opt_help_all=false
-opt_silent=:
-opt_warning=:
-opt_verbose=:
-opt_silent=false
-opt_verbose=false
 
+  # Shorthand for --mode=foo, only valid as the first argument
+  case $1 in
+  clean|clea|cle|cl)
+    shift; set dummy --mode clean ${1+"$@"}; shift
+    ;;
+  compile|compil|compi|comp|com|co|c)
+    shift; set dummy --mode compile ${1+"$@"}; shift
+    ;;
+  execute|execut|execu|exec|exe|ex|e)
+    shift; set dummy --mode execute ${1+"$@"}; shift
+    ;;
+  finish|finis|fini|fin|fi|f)
+    shift; set dummy --mode finish ${1+"$@"}; shift
+    ;;
+  install|instal|insta|inst|ins|in|i)
+    shift; set dummy --mode install ${1+"$@"}; shift
+    ;;
+  link|lin|li|l)
+    shift; set dummy --mode link ${1+"$@"}; shift
+    ;;
+  uninstall|uninstal|uninsta|uninst|unins|unin|uni|un|u)
+    shift; set dummy --mode uninstall ${1+"$@"}; shift
+    ;;
+  esac
 
-# Parse options once, thoroughly.  This comes as soon as possible in the
-# script to make things like `--version' happen as quickly as we can.
-{
-  # this just eases exit handling
-  while test $# -gt 0; do
+  # Parse non-mode specific arguments:
+  while test "$#" -gt 0; do
     opt="$1"
     shift
+
     case $opt in
-      --debug|-x)	opt_debug='set -x'
+      --config)		func_config					;;
+
+      --debug)		preserve_args="$preserve_args $opt"
 			func_echo "enabling shell trace mode"
+			opt_debug='set -x'
 			$opt_debug
 			;;
-      --dry-run|--dryrun|-n)
-			opt_dry_run=:
-			;;
-      --config)
-			opt_config=:
-func_config
-			;;
-      --dlopen|-dlopen)
-			optarg="$1"
-			opt_dlopen="${opt_dlopen+$opt_dlopen
-}$optarg"
+
+      -dlopen)		test "$#" -eq 0 && func_missing_arg "$opt" && break
+			execute_dlfiles="$execute_dlfiles $1"
 			shift
 			;;
-      --preserve-dup-deps)
-			opt_preserve_dup_deps=:
-			;;
-      --features)
-			opt_features=:
-func_features
-			;;
-      --finish)
-			opt_finish=:
-set dummy --mode finish ${1+"$@"}; shift
-			;;
-      --help)
-			opt_help=:
-			;;
-      --help-all)
-			opt_help_all=:
-opt_help=': help-all'
-			;;
-      --mode)
-			test $# = 0 && func_missing_arg $opt && break
-			optarg="$1"
-			opt_mode="$optarg"
-case $optarg in
-  # Valid mode arguments:
-  clean|compile|execute|finish|install|link|relink|uninstall) ;;
-
-  # Catch anything else as an error
-  *) func_error "invalid argument for $opt"
-     exit_cmd=exit
-     break
-     ;;
-esac
+
+      --dry-run | -n)	opt_dry_run=:					;;
+      --features)       func_features					;;
+      --finish)		mode="finish"					;;
+
+      --mode)		test "$#" -eq 0 && func_missing_arg "$opt" && break
+			case $1 in
+			  # Valid mode arguments:
+			  clean)	;;
+			  compile)	;;
+			  execute)	;;
+			  finish)	;;
+			  install)	;;
+			  link)		;;
+			  relink)	;;
+			  uninstall)	;;
+
+			  # Catch anything else as an error
+			  *) func_error "invalid argument for $opt"
+			     exit_cmd=exit
+			     break
+			     ;;
+		        esac
+
+			mode="$1"
 			shift
 			;;
-      --no-silent|--no-quiet)
-			opt_silent=false
-func_append preserve_args " $opt"
-			;;
-      --no-warning|--no-warn)
-			opt_warning=false
-func_append preserve_args " $opt"
-			;;
-      --no-verbose)
-			opt_verbose=false
-func_append preserve_args " $opt"
-			;;
-      --silent|--quiet)
+
+      --preserve-dup-deps)
+			opt_duplicate_deps=:				;;
+
+      --quiet|--silent)	preserve_args="$preserve_args $opt"
 			opt_silent=:
-func_append preserve_args " $opt"
-        opt_verbose=false
 			;;
-      --verbose|-v)
-			opt_verbose=:
-func_append preserve_args " $opt"
-opt_silent=false
+
+      --verbose| -v)	preserve_args="$preserve_args $opt"
+			opt_silent=false
 			;;
-      --tag)
-			test $# = 0 && func_missing_arg $opt && break
-			optarg="$1"
-			opt_tag="$optarg"
-func_append preserve_args " $opt $optarg"
-func_enable_tag "$optarg"
+
+      --tag)		test "$#" -eq 0 && func_missing_arg "$opt" && break
+			preserve_args="$preserve_args $opt $1"
+			func_enable_tag "$1"	# tagname is set here
 			shift
 			;;
 
-      -\?|-h)		func_usage				;;
-      --help)		func_help				;;
-      --version)	func_version				;;
-
       # Separate optargs to long options:
-      --*=*)
-			func_split_long_opt "$opt"
-			set dummy "$func_split_long_opt_name" "$func_split_long_opt_arg" ${1+"$@"}
+      -dlopen=*|--mode=*|--tag=*)
+			func_opt_split "$opt"
+			set dummy "$func_opt_split_opt" "$func_opt_split_arg" ${1+"$@"}
 			shift
 			;;
 
-      # Separate non-argument short options:
-      -\?*|-h*|-n*|-v*)
-			func_split_short_opt "$opt"
-			set dummy "$func_split_short_opt_name" "-$func_split_short_opt_arg" ${1+"$@"}
-			shift
-			;;
+      -\?|-h)		func_usage					;;
+      --help)		opt_help=:					;;
+      --version)	func_version					;;
+
+      -*)		func_fatal_help "unrecognized option \`$opt'"	;;
 
-      --)		break					;;
-      -*)		func_fatal_help "unrecognized option \`$opt'" ;;
-      *)		set dummy "$opt" ${1+"$@"};	shift; break  ;;
+      *)		nonopt="$opt"
+			break
+			;;
     esac
   done
 
-  # Validate options:
-
-  # save first non-option argument
-  if test "$#" -gt 0; then
-    nonopt="$opt"
-    shift
-  fi
-
-  # preserve --debug
-  test "$opt_debug" = : || func_append preserve_args " --debug"
 
   case $host in
     *cygwin* | *mingw* | *pw32* | *cegcc*)
@@ -1185,44 +810,82 @@ func_enable_tag "$optarg"
       opt_duplicate_compiler_generated_deps=:
       ;;
     *)
-      opt_duplicate_compiler_generated_deps=$opt_preserve_dup_deps
+      opt_duplicate_compiler_generated_deps=$opt_duplicate_deps
       ;;
   esac
 
-  $opt_help || {
-    # Sanity checks first:
-    func_check_version_match
+  # Having warned about all mis-specified options, bail out if
+  # anything was wrong.
+  $exit_cmd $EXIT_FAILURE
+}
 
-    if test "$build_libtool_libs" != yes && test "$build_old_libs" != yes; then
-      func_fatal_configuration "not configured to build any kind of library"
+# func_check_version_match
+# Ensure that we are using m4 macros, and libtool script from the same
+# release of libtool.
+func_check_version_match ()
+{
+  if test "$package_revision" != "$macro_revision"; then
+    if test "$VERSION" != "$macro_version"; then
+      if test -z "$macro_version"; then
+        cat >&2 <<_LT_EOF
+$progname: Version mismatch error.  This is $PACKAGE $VERSION, but the
+$progname: definition of this LT_INIT comes from an older release.
+$progname: You should recreate aclocal.m4 with macros from $PACKAGE $VERSION
+$progname: and run autoconf again.
+_LT_EOF
+      else
+        cat >&2 <<_LT_EOF
+$progname: Version mismatch error.  This is $PACKAGE $VERSION, but the
+$progname: definition of this LT_INIT comes from $PACKAGE $macro_version.
+$progname: You should recreate aclocal.m4 with macros from $PACKAGE $VERSION
+$progname: and run autoconf again.
+_LT_EOF
+      fi
+    else
+      cat >&2 <<_LT_EOF
+$progname: Version mismatch error.  This is $PACKAGE $VERSION, revision $package_revision,
+$progname: but the definition of this LT_INIT comes from revision $macro_revision.
+$progname: You should recreate aclocal.m4 with macros from revision $package_revision
+$progname: of $PACKAGE $VERSION and run autoconf again.
+_LT_EOF
     fi
 
-    # Darwin sucks
-    eval std_shrext=\"$shrext_cmds\"
+    exit $EXIT_MISMATCH
+  fi
+}
 
-    # Only execute mode is allowed to have -dlopen flags.
-    if test -n "$opt_dlopen" && test "$opt_mode" != execute; then
-      func_error "unrecognized option \`-dlopen'"
-      $ECHO "$help" 1>&2
-      exit $EXIT_FAILURE
-    fi
 
-    # Change the help message to a mode-specific one.
-    generic_help="$help"
-    help="Try \`$progname --help --mode=$opt_mode' for more information."
-  }
+## ----------- ##
+##    Main.    ##
+## ----------- ##
 
+$opt_help || {
+  # Sanity checks first:
+  func_check_version_match
 
-  # Bail if the options were screwed
-  $exit_cmd $EXIT_FAILURE
-}
+  if test "$build_libtool_libs" != yes && test "$build_old_libs" != yes; then
+    func_fatal_configuration "not configured to build any kind of library"
+  fi
 
+  test -z "$mode" && func_fatal_error "error: you must specify a MODE."
 
 
+  # Darwin sucks
+  eval std_shrext=\"$shrext_cmds\"
+
+
+  # Only execute mode is allowed to have -dlopen flags.
+  if test -n "$execute_dlfiles" && test "$mode" != execute; then
+    func_error "unrecognized option \`-dlopen'"
+    $ECHO "$help" 1>&2
+    exit $EXIT_FAILURE
+  fi
+
+  # Change the help message to a mode-specific one.
+  generic_help="$help"
+  help="Try \`$progname --help --mode=$mode' for more information."
+}
 
-## ----------- ##
-##    Main.    ##
-## ----------- ##
 
 # func_lalib_p file
 # True iff FILE is a libtool `.la' library or `.lo' object file.
@@ -1287,9 +950,12 @@ func_ltwrapper_executable_p ()
 # temporary ltwrapper_script.
 func_ltwrapper_scriptname ()
 {
-    func_dirname_and_basename "$1" "" "."
-    func_stripname '' '.exe' "$func_basename_result"
-    func_ltwrapper_scriptname_result="$func_dirname_result/$objdir/${func_stripname_result}_ltshwrapper"
+    func_ltwrapper_scriptname_result=""
+    if func_ltwrapper_executable_p "$1"; then
+	func_dirname_and_basename "$1" "" "."
+	func_stripname '' '.exe' "$func_basename_result"
+	func_ltwrapper_scriptname_result="$func_dirname_result/$objdir/${func_stripname_result}_ltshwrapper"
+    fi
 }
 
 # func_ltwrapper_p file
@@ -1335,37 +1001,6 @@ func_source ()
 }
 
 
-# func_resolve_sysroot PATH
-# Replace a leading = in PATH with a sysroot.  Store the result into
-# func_resolve_sysroot_result
-func_resolve_sysroot ()
-{
-  func_resolve_sysroot_result=$1
-  case $func_resolve_sysroot_result in
-  =*)
-    func_stripname '=' '' "$func_resolve_sysroot_result"
-    func_resolve_sysroot_result=$lt_sysroot$func_stripname_result
-    ;;
-  esac
-}
-
-# func_replace_sysroot PATH
-# If PATH begins with the sysroot, replace it with = and
-# store the result into func_replace_sysroot_result.
-func_replace_sysroot ()
-{
-  case "$lt_sysroot:$1" in
-  ?*:"$lt_sysroot"*)
-    func_stripname "$lt_sysroot" '' "$1"
-    func_replace_sysroot_result="=$func_stripname_result"
-    ;;
-  *)
-    # Including no sysroot.
-    func_replace_sysroot_result=$1
-    ;;
-  esac
-}
-
 # func_infer_tag arg
 # Infer tagged configuration to use if any are available and
 # if one wasn't chosen via the "--tag" command line option.
@@ -1378,15 +1013,13 @@ func_infer_tag ()
     if test -n "$available_tags" && test -z "$tagname"; then
       CC_quoted=
       for arg in $CC; do
-	func_append_quoted CC_quoted "$arg"
+        func_quote_for_eval "$arg"
+	CC_quoted="$CC_quoted $func_quote_for_eval_result"
       done
-      CC_expanded=`func_echo_all $CC`
-      CC_quoted_expanded=`func_echo_all $CC_quoted`
       case $@ in
       # Blanks in the command may have been stripped by the calling shell,
       # but not from the CC environment variable when configure was run.
-      " $CC "* | "$CC "* | " $CC_expanded "* | "$CC_expanded "* | \
-      " $CC_quoted"* | "$CC_quoted "* | " $CC_quoted_expanded "* | "$CC_quoted_expanded "*) ;;
+      " $CC "* | "$CC "* | " `$ECHO $CC` "* | "`$ECHO $CC` "* | " $CC_quoted"* | "$CC_quoted "* | " `$ECHO $CC_quoted` "* | "`$ECHO $CC_quoted` "*) ;;
       # Blanks at the start of $base_compile will cause this to fail
       # if we don't check for them as well.
       *)
@@ -1397,13 +1030,11 @@ func_infer_tag ()
 	    CC_quoted=
 	    for arg in $CC; do
 	      # Double-quote args containing other shell metacharacters.
-	      func_append_quoted CC_quoted "$arg"
+	      func_quote_for_eval "$arg"
+	      CC_quoted="$CC_quoted $func_quote_for_eval_result"
 	    done
-	    CC_expanded=`func_echo_all $CC`
-	    CC_quoted_expanded=`func_echo_all $CC_quoted`
 	    case "$@ " in
-	    " $CC "* | "$CC "* | " $CC_expanded "* | "$CC_expanded "* | \
-	    " $CC_quoted"* | "$CC_quoted "* | " $CC_quoted_expanded "* | "$CC_quoted_expanded "*)
+	      " $CC "* | "$CC "* | " `$ECHO $CC` "* | "`$ECHO $CC` "* | " $CC_quoted"* | "$CC_quoted "* | " `$ECHO $CC_quoted` "* | "`$ECHO $CC_quoted` "*)
 	      # The compiler in the base compile command matches
 	      # the one in the tagged configuration.
 	      # Assume this is the tagged configuration we want.
@@ -1466,486 +1097,6 @@ EOF
     }
 }
 
-
-##################################################
-# FILE NAME AND PATH CONVERSION HELPER FUNCTIONS #
-##################################################
-
-# func_convert_core_file_wine_to_w32 ARG
-# Helper function used by file name conversion functions when $build is *nix,
-# and $host is mingw, cygwin, or some other w32 environment. Relies on a
-# correctly configured wine environment available, with the winepath program
-# in $build's $PATH.
-#
-# ARG is the $build file name to be converted to w32 format.
-# Result is available in $func_convert_core_file_wine_to_w32_result, and will
-# be empty on error (or when ARG is empty)
-func_convert_core_file_wine_to_w32 ()
-{
-  $opt_debug
-  func_convert_core_file_wine_to_w32_result="$1"
-  if test -n "$1"; then
-    # Unfortunately, winepath does not exit with a non-zero error code, so we
-    # are forced to check the contents of stdout. On the other hand, if the
-    # command is not found, the shell will set an exit code of 127 and print
-    # *an error message* to stdout. So we must check for both error code of
-    # zero AND non-empty stdout, which explains the odd construction:
-    func_convert_core_file_wine_to_w32_tmp=`winepath -w "$1" 2>/dev/null`
-    if test "$?" -eq 0 && test -n "${func_convert_core_file_wine_to_w32_tmp}"; then
-      func_convert_core_file_wine_to_w32_result=`$ECHO "$func_convert_core_file_wine_to_w32_tmp" |
-        $SED -e "$lt_sed_naive_backslashify"`
-    else
-      func_convert_core_file_wine_to_w32_result=
-    fi
-  fi
-}
-# end: func_convert_core_file_wine_to_w32
-
-
-# func_convert_core_path_wine_to_w32 ARG
-# Helper function used by path conversion functions when $build is *nix, and
-# $host is mingw, cygwin, or some other w32 environment. Relies on a correctly
-# configured wine environment available, with the winepath program in $build's
-# $PATH. Assumes ARG has no leading or trailing path separator characters.
-#
-# ARG is path to be converted from $build format to win32.
-# Result is available in $func_convert_core_path_wine_to_w32_result.
-# Unconvertible file (directory) names in ARG are skipped; if no directory names
-# are convertible, then the result may be empty.
-func_convert_core_path_wine_to_w32 ()
-{
-  $opt_debug
-  # unfortunately, winepath doesn't convert paths, only file names
-  func_convert_core_path_wine_to_w32_result=""
-  if test -n "$1"; then
-    oldIFS=$IFS
-    IFS=:
-    for func_convert_core_path_wine_to_w32_f in $1; do
-      IFS=$oldIFS
-      func_convert_core_file_wine_to_w32 "$func_convert_core_path_wine_to_w32_f"
-      if test -n "$func_convert_core_file_wine_to_w32_result" ; then
-        if test -z "$func_convert_core_path_wine_to_w32_result"; then
-          func_convert_core_path_wine_to_w32_result="$func_convert_core_file_wine_to_w32_result"
-        else
-          func_append func_convert_core_path_wine_to_w32_result ";$func_convert_core_file_wine_to_w32_result"
-        fi
-      fi
-    done
-    IFS=$oldIFS
-  fi
-}
-# end: func_convert_core_path_wine_to_w32
-
-
-# func_cygpath ARGS...
-# Wrapper around calling the cygpath program via LT_CYGPATH. This is used when
-# when (1) $build is *nix and Cygwin is hosted via a wine environment; or (2)
-# $build is MSYS and $host is Cygwin, or (3) $build is Cygwin. In case (1) or
-# (2), returns the Cygwin file name or path in func_cygpath_result (input
-# file name or path is assumed to be in w32 format, as previously converted
-# from $build's *nix or MSYS format). In case (3), returns the w32 file name
-# or path in func_cygpath_result (input file name or path is assumed to be in
-# Cygwin format). Returns an empty string on error.
-#
-# ARGS are passed to cygpath, with the last one being the file name or path to
-# be converted.
-#
-# Specify the absolute *nix (or w32) name to cygpath in the LT_CYGPATH
-# environment variable; do not put it in $PATH.
-func_cygpath ()
-{
-  $opt_debug
-  if test -n "$LT_CYGPATH" && test -f "$LT_CYGPATH"; then
-    func_cygpath_result=`$LT_CYGPATH "$@" 2>/dev/null`
-    if test "$?" -ne 0; then
-      # on failure, ensure result is empty
-      func_cygpath_result=
-    fi
-  else
-    func_cygpath_result=
-    func_error "LT_CYGPATH is empty or specifies non-existent file: \`$LT_CYGPATH'"
-  fi
-}
-#end: func_cygpath
-
-
-# func_convert_core_msys_to_w32 ARG
-# Convert file name or path ARG from MSYS format to w32 format.  Return
-# result in func_convert_core_msys_to_w32_result.
-func_convert_core_msys_to_w32 ()
-{
-  $opt_debug
-  # awkward: cmd appends spaces to result
-  func_convert_core_msys_to_w32_result=`( cmd //c echo "$1" ) 2>/dev/null |
-    $SED -e 's/[ ]*$//' -e "$lt_sed_naive_backslashify"`
-}
-#end: func_convert_core_msys_to_w32
-
-
-# func_convert_file_check ARG1 ARG2
-# Verify that ARG1 (a file name in $build format) was converted to $host
-# format in ARG2. Otherwise, emit an error message, but continue (resetting
-# func_to_host_file_result to ARG1).
-func_convert_file_check ()
-{
-  $opt_debug
-  if test -z "$2" && test -n "$1" ; then
-    func_error "Could not determine host file name corresponding to"
-    func_error "  \`$1'"
-    func_error "Continuing, but uninstalled executables may not work."
-    # Fallback:
-    func_to_host_file_result="$1"
-  fi
-}
-# end func_convert_file_check
-
-
-# func_convert_path_check FROM_PATHSEP TO_PATHSEP FROM_PATH TO_PATH
-# Verify that FROM_PATH (a path in $build format) was converted to $host
-# format in TO_PATH. Otherwise, emit an error message, but continue, resetting
-# func_to_host_file_result to a simplistic fallback value (see below).
-func_convert_path_check ()
-{
-  $opt_debug
-  if test -z "$4" && test -n "$3"; then
-    func_error "Could not determine the host path corresponding to"
-    func_error "  \`$3'"
-    func_error "Continuing, but uninstalled executables may not work."
-    # Fallback.  This is a deliberately simplistic "conversion" and
-    # should not be "improved".  See libtool.info.
-    if test "x$1" != "x$2"; then
-      lt_replace_pathsep_chars="s|$1|$2|g"
-      func_to_host_path_result=`echo "$3" |
-        $SED -e "$lt_replace_pathsep_chars"`
-    else
-      func_to_host_path_result="$3"
-    fi
-  fi
-}
-# end func_convert_path_check
-
-
-# func_convert_path_front_back_pathsep FRONTPAT BACKPAT REPL ORIG
-# Modifies func_to_host_path_result by prepending REPL if ORIG matches FRONTPAT
-# and appending REPL if ORIG matches BACKPAT.
-func_convert_path_front_back_pathsep ()
-{
-  $opt_debug
-  case $4 in
-  $1 ) func_to_host_path_result="$3$func_to_host_path_result"
-    ;;
-  esac
-  case $4 in
-  $2 ) func_append func_to_host_path_result "$3"
-    ;;
-  esac
-}
-# end func_convert_path_front_back_pathsep
-
-
-##################################################
-# $build to $host FILE NAME CONVERSION FUNCTIONS #
-##################################################
-# invoked via `$to_host_file_cmd ARG'
-#
-# In each case, ARG is the path to be converted from $build to $host format.
-# Result will be available in $func_to_host_file_result.
-
-
-# func_to_host_file ARG
-# Converts the file name ARG from $build format to $host format. Return result
-# in func_to_host_file_result.
-func_to_host_file ()
-{
-  $opt_debug
-  $to_host_file_cmd "$1"
-}
-# end func_to_host_file
-
-
-# func_to_tool_file ARG LAZY
-# converts the file name ARG from $build format to toolchain format. Return
-# result in func_to_tool_file_result.  If the conversion in use is listed
-# in (the comma separated) LAZY, no conversion takes place.
-func_to_tool_file ()
-{
-  $opt_debug
-  case ,$2, in
-    *,"$to_tool_file_cmd",*)
-      func_to_tool_file_result=$1
-      ;;
-    *)
-      $to_tool_file_cmd "$1"
-      func_to_tool_file_result=$func_to_host_file_result
-      ;;
-  esac
-}
-# end func_to_tool_file
-
-
-# func_convert_file_noop ARG
-# Copy ARG to func_to_host_file_result.
-func_convert_file_noop ()
-{
-  func_to_host_file_result="$1"
-}
-# end func_convert_file_noop
-
-
-# func_convert_file_msys_to_w32 ARG
-# Convert file name ARG from (mingw) MSYS to (mingw) w32 format; automatic
-# conversion to w32 is not available inside the cwrapper.  Returns result in
-# func_to_host_file_result.
-func_convert_file_msys_to_w32 ()
-{
-  $opt_debug
-  func_to_host_file_result="$1"
-  if test -n "$1"; then
-    func_convert_core_msys_to_w32 "$1"
-    func_to_host_file_result="$func_convert_core_msys_to_w32_result"
-  fi
-  func_convert_file_check "$1" "$func_to_host_file_result"
-}
-# end func_convert_file_msys_to_w32
-
-
-# func_convert_file_cygwin_to_w32 ARG
-# Convert file name ARG from Cygwin to w32 format.  Returns result in
-# func_to_host_file_result.
-func_convert_file_cygwin_to_w32 ()
-{
-  $opt_debug
-  func_to_host_file_result="$1"
-  if test -n "$1"; then
-    # because $build is cygwin, we call "the" cygpath in $PATH; no need to use
-    # LT_CYGPATH in this case.
-    func_to_host_file_result=`cygpath -m "$1"`
-  fi
-  func_convert_file_check "$1" "$func_to_host_file_result"
-}
-# end func_convert_file_cygwin_to_w32
-
-
-# func_convert_file_nix_to_w32 ARG
-# Convert file name ARG from *nix to w32 format.  Requires a wine environment
-# and a working winepath. Returns result in func_to_host_file_result.
-func_convert_file_nix_to_w32 ()
-{
-  $opt_debug
-  func_to_host_file_result="$1"
-  if test -n "$1"; then
-    func_convert_core_file_wine_to_w32 "$1"
-    func_to_host_file_result="$func_convert_core_file_wine_to_w32_result"
-  fi
-  func_convert_file_check "$1" "$func_to_host_file_result"
-}
-# end func_convert_file_nix_to_w32
-
-
-# func_convert_file_msys_to_cygwin ARG
-# Convert file name ARG from MSYS to Cygwin format.  Requires LT_CYGPATH set.
-# Returns result in func_to_host_file_result.
-func_convert_file_msys_to_cygwin ()
-{
-  $opt_debug
-  func_to_host_file_result="$1"
-  if test -n "$1"; then
-    func_convert_core_msys_to_w32 "$1"
-    func_cygpath -u "$func_convert_core_msys_to_w32_result"
-    func_to_host_file_result="$func_cygpath_result"
-  fi
-  func_convert_file_check "$1" "$func_to_host_file_result"
-}
-# end func_convert_file_msys_to_cygwin
-
-
-# func_convert_file_nix_to_cygwin ARG
-# Convert file name ARG from *nix to Cygwin format.  Requires Cygwin installed
-# in a wine environment, working winepath, and LT_CYGPATH set.  Returns result
-# in func_to_host_file_result.
-func_convert_file_nix_to_cygwin ()
-{
-  $opt_debug
-  func_to_host_file_result="$1"
-  if test -n "$1"; then
-    # convert from *nix to w32, then use cygpath to convert from w32 to cygwin.
-    func_convert_core_file_wine_to_w32 "$1"
-    func_cygpath -u "$func_convert_core_file_wine_to_w32_result"
-    func_to_host_file_result="$func_cygpath_result"
-  fi
-  func_convert_file_check "$1" "$func_to_host_file_result"
-}
-# end func_convert_file_nix_to_cygwin
-
-
-#############################################
-# $build to $host PATH CONVERSION FUNCTIONS #
-#############################################
-# invoked via `$to_host_path_cmd ARG'
-#
-# In each case, ARG is the path to be converted from $build to $host format.
-# The result will be available in $func_to_host_path_result.
-#
-# Path separators are also converted from $build format to $host format.  If
-# ARG begins or ends with a path separator character, it is preserved (but
-# converted to $host format) on output.
-#
-# All path conversion functions are named using the following convention:
-#   file name conversion function    : func_convert_file_X_to_Y ()
-#   path conversion function         : func_convert_path_X_to_Y ()
-# where, for any given $build/$host combination the 'X_to_Y' value is the
-# same.  If conversion functions are added for new $build/$host combinations,
-# the two new functions must follow this pattern, or func_init_to_host_path_cmd
-# will break.
-
-
-# func_init_to_host_path_cmd
-# Ensures that function "pointer" variable $to_host_path_cmd is set to the
-# appropriate value, based on the value of $to_host_file_cmd.
-to_host_path_cmd=
-func_init_to_host_path_cmd ()
-{
-  $opt_debug
-  if test -z "$to_host_path_cmd"; then
-    func_stripname 'func_convert_file_' '' "$to_host_file_cmd"
-    to_host_path_cmd="func_convert_path_${func_stripname_result}"
-  fi
-}
-
-
-# func_to_host_path ARG
-# Converts the path ARG from $build format to $host format. Return result
-# in func_to_host_path_result.
-func_to_host_path ()
-{
-  $opt_debug
-  func_init_to_host_path_cmd
-  $to_host_path_cmd "$1"
-}
-# end func_to_host_path
-
-
-# func_convert_path_noop ARG
-# Copy ARG to func_to_host_path_result.
-func_convert_path_noop ()
-{
-  func_to_host_path_result="$1"
-}
-# end func_convert_path_noop
-
-
-# func_convert_path_msys_to_w32 ARG
-# Convert path ARG from (mingw) MSYS to (mingw) w32 format; automatic
-# conversion to w32 is not available inside the cwrapper.  Returns result in
-# func_to_host_path_result.
-func_convert_path_msys_to_w32 ()
-{
-  $opt_debug
-  func_to_host_path_result="$1"
-  if test -n "$1"; then
-    # Remove leading and trailing path separator characters from ARG.  MSYS
-    # behavior is inconsistent here; cygpath turns them into '.;' and ';.';
-    # and winepath ignores them completely.
-    func_stripname : : "$1"
-    func_to_host_path_tmp1=$func_stripname_result
-    func_convert_core_msys_to_w32 "$func_to_host_path_tmp1"
-    func_to_host_path_result="$func_convert_core_msys_to_w32_result"
-    func_convert_path_check : ";" \
-      "$func_to_host_path_tmp1" "$func_to_host_path_result"
-    func_convert_path_front_back_pathsep ":*" "*:" ";" "$1"
-  fi
-}
-# end func_convert_path_msys_to_w32
-
-
-# func_convert_path_cygwin_to_w32 ARG
-# Convert path ARG from Cygwin to w32 format.  Returns result in
-# func_to_host_file_result.
-func_convert_path_cygwin_to_w32 ()
-{
-  $opt_debug
-  func_to_host_path_result="$1"
-  if test -n "$1"; then
-    # See func_convert_path_msys_to_w32:
-    func_stripname : : "$1"
-    func_to_host_path_tmp1=$func_stripname_result
-    func_to_host_path_result=`cygpath -m -p "$func_to_host_path_tmp1"`
-    func_convert_path_check : ";" \
-      "$func_to_host_path_tmp1" "$func_to_host_path_result"
-    func_convert_path_front_back_pathsep ":*" "*:" ";" "$1"
-  fi
-}
-# end func_convert_path_cygwin_to_w32
-
-
-# func_convert_path_nix_to_w32 ARG
-# Convert path ARG from *nix to w32 format.  Requires a wine environment and
-# a working winepath.  Returns result in func_to_host_file_result.
-func_convert_path_nix_to_w32 ()
-{
-  $opt_debug
-  func_to_host_path_result="$1"
-  if test -n "$1"; then
-    # See func_convert_path_msys_to_w32:
-    func_stripname : : "$1"
-    func_to_host_path_tmp1=$func_stripname_result
-    func_convert_core_path_wine_to_w32 "$func_to_host_path_tmp1"
-    func_to_host_path_result="$func_convert_core_path_wine_to_w32_result"
-    func_convert_path_check : ";" \
-      "$func_to_host_path_tmp1" "$func_to_host_path_result"
-    func_convert_path_front_back_pathsep ":*" "*:" ";" "$1"
-  fi
-}
-# end func_convert_path_nix_to_w32
-
-
-# func_convert_path_msys_to_cygwin ARG
-# Convert path ARG from MSYS to Cygwin format.  Requires LT_CYGPATH set.
-# Returns result in func_to_host_file_result.
-func_convert_path_msys_to_cygwin ()
-{
-  $opt_debug
-  func_to_host_path_result="$1"
-  if test -n "$1"; then
-    # See func_convert_path_msys_to_w32:
-    func_stripname : : "$1"
-    func_to_host_path_tmp1=$func_stripname_result
-    func_convert_core_msys_to_w32 "$func_to_host_path_tmp1"
-    func_cygpath -u -p "$func_convert_core_msys_to_w32_result"
-    func_to_host_path_result="$func_cygpath_result"
-    func_convert_path_check : : \
-      "$func_to_host_path_tmp1" "$func_to_host_path_result"
-    func_convert_path_front_back_pathsep ":*" "*:" : "$1"
-  fi
-}
-# end func_convert_path_msys_to_cygwin
-
-
-# func_convert_path_nix_to_cygwin ARG
-# Convert path ARG from *nix to Cygwin format.  Requires Cygwin installed in a
-# a wine environment, working winepath, and LT_CYGPATH set.  Returns result in
-# func_to_host_file_result.
-func_convert_path_nix_to_cygwin ()
-{
-  $opt_debug
-  func_to_host_path_result="$1"
-  if test -n "$1"; then
-    # Remove leading and trailing path separator characters from
-    # ARG. msys behavior is inconsistent here, cygpath turns them
-    # into '.;' and ';.', and winepath ignores them completely.
-    func_stripname : : "$1"
-    func_to_host_path_tmp1=$func_stripname_result
-    func_convert_core_path_wine_to_w32 "$func_to_host_path_tmp1"
-    func_cygpath -u -p "$func_convert_core_path_wine_to_w32_result"
-    func_to_host_path_result="$func_cygpath_result"
-    func_convert_path_check : : \
-      "$func_to_host_path_tmp1" "$func_to_host_path_result"
-    func_convert_path_front_back_pathsep ":*" "*:" : "$1"
-  fi
-}
-# end func_convert_path_nix_to_cygwin
-
-
 # func_mode_compile arg...
 func_mode_compile ()
 {
@@ -1986,12 +1137,12 @@ func_mode_compile ()
 	  ;;
 
 	-pie | -fpie | -fPIE)
-          func_append pie_flag " $arg"
+          pie_flag="$pie_flag $arg"
 	  continue
 	  ;;
 
 	-shared | -static | -prefer-pic | -prefer-non-pic)
-	  func_append later " $arg"
+	  later="$later $arg"
 	  continue
 	  ;;
 
@@ -2012,14 +1163,15 @@ func_mode_compile ()
 	  save_ifs="$IFS"; IFS=','
 	  for arg in $args; do
 	    IFS="$save_ifs"
-	    func_append_quoted lastarg "$arg"
+	    func_quote_for_eval "$arg"
+	    lastarg="$lastarg $func_quote_for_eval_result"
 	  done
 	  IFS="$save_ifs"
 	  func_stripname ' ' '' "$lastarg"
 	  lastarg=$func_stripname_result
 
 	  # Add the arguments to base_compile.
-	  func_append base_compile " $lastarg"
+	  base_compile="$base_compile $lastarg"
 	  continue
 	  ;;
 
@@ -2035,7 +1187,8 @@ func_mode_compile ()
       esac    #  case $arg_mode
 
       # Aesthetically quote the previous argument.
-      func_append_quoted base_compile "$lastarg"
+      func_quote_for_eval "$lastarg"
+      base_compile="$base_compile $func_quote_for_eval_result"
     done # for arg
 
     case $arg_mode in
@@ -2060,7 +1213,7 @@ func_mode_compile ()
     *.[cCFSifmso] | \
     *.ada | *.adb | *.ads | *.asm | \
     *.c++ | *.cc | *.ii | *.class | *.cpp | *.cxx | \
-    *.[fF][09]? | *.for | *.java | *.go | *.obj | *.sx | *.cu | *.cup)
+    *.[fF][09]? | *.for | *.java | *.obj | *.sx)
       func_xform "$libobj"
       libobj=$func_xform_result
       ;;
@@ -2135,7 +1288,7 @@ func_mode_compile ()
     # Calculate the filename of the output object if compiler does
     # not support -o with -c
     if test "$compiler_c_o" = no; then
-      output_obj=`$ECHO "$srcfile" | $SED 's%^.*/%%; s%\.[^.]*$%%'`.${objext}
+      output_obj=`$ECHO "X$srcfile" | $Xsed -e 's%^.*/%%' -e 's%\.[^.]*$%%'`.${objext}
       lockfile="$output_obj.lock"
     else
       output_obj=
@@ -2166,16 +1319,17 @@ compiler."
 	$opt_dry_run || $RM $removelist
 	exit $EXIT_FAILURE
       fi
-      func_append removelist " $output_obj"
+      removelist="$removelist $output_obj"
       $ECHO "$srcfile" > "$lockfile"
     fi
 
     $opt_dry_run || $RM $removelist
-    func_append removelist " $lockfile"
+    removelist="$removelist $lockfile"
     trap '$opt_dry_run || $RM $removelist; exit $EXIT_FAILURE' 1 2 15
 
-    func_to_tool_file "$srcfile" func_convert_file_msys_to_w32
-    srcfile=$func_to_tool_file_result
+    if test -n "$fix_srcfile_path"; then
+      eval srcfile=\"$fix_srcfile_path\"
+    fi
     func_quote_for_eval "$srcfile"
     qsrcfile=$func_quote_for_eval_result
 
@@ -2195,7 +1349,7 @@ compiler."
 
       if test -z "$output_obj"; then
 	# Place PIC objects in $objdir
-	func_append command " -o $lobj"
+	command="$command -o $lobj"
       fi
 
       func_show_eval_locale "$command"	\
@@ -2242,11 +1396,11 @@ compiler."
 	command="$base_compile $qsrcfile $pic_flag"
       fi
       if test "$compiler_c_o" = yes; then
-	func_append command " -o $obj"
+	command="$command -o $obj"
       fi
 
       # Suppress compiler output if we already did a PIC compilation.
-      func_append command "$suppress_output"
+      command="$command$suppress_output"
       func_show_eval_locale "$command" \
         '$opt_dry_run || $RM $removelist; exit $EXIT_FAILURE'
 
@@ -2291,13 +1445,13 @@ compiler."
 }
 
 $opt_help || {
-  test "$opt_mode" = compile && func_mode_compile ${1+"$@"}
+test "$mode" = compile && func_mode_compile ${1+"$@"}
 }
 
 func_mode_help ()
 {
     # We need to display help for each of the modes.
-    case $opt_mode in
+    case $mode in
       "")
         # Generic help is extracted from the usage comments
         # at the start of this file.
@@ -2328,11 +1482,10 @@ This mode accepts the following addition
 
   -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
   -no-suppress      do not suppress compiler output for multiple passes
-  -prefer-pic       try to build PIC objects only
-  -prefer-non-pic   try to build non-PIC objects only
+  -prefer-pic       try to building PIC objects only
+  -prefer-non-pic   try to building non-PIC objects only
   -shared           do not build a \`.o' file suitable for static linking
   -static           only build a \`.o' file suitable for static linking
-  -Wc,FLAG          pass FLAG directly to the compiler
 
 COMPILE-COMMAND is a command to be used in creating a \`standard' object file
 from the given SOURCEFILE.
@@ -2385,7 +1538,7 @@ either the \`install' or \`cp' program.
 
 The following components of INSTALL-COMMAND are treated specially:
 
-  -inst-prefix-dir PREFIX-DIR  Use PREFIX-DIR as a staging area for installation
+  -inst-prefix PREFIX-DIR  Use PREFIX-DIR as a staging area for installation
 
 The rest of the components are interpreted as arguments to that command (only
 BSD-compatible install options are recognized)."
@@ -2405,8 +1558,6 @@ The following components of LINK-COMMAND
 
   -all-static       do not do any dynamic linking at all
   -avoid-version    do not add a version suffix if possible
-  -bindir BINDIR    specify path to binaries directory (for systems where
-                    libraries must be found in the PATH setting at runtime)
   -dlopen FILE      \`-dlpreopen' FILE if it cannot be dlopened at runtime
   -dlpreopen FILE   link in FILE and add its symbols to lt_preloaded_symbols
   -export-dynamic   allow symbols from OUTPUT-FILE to be resolved with dlsym(3)
@@ -2435,11 +1586,6 @@ The following components of LINK-COMMAND
   -version-info CURRENT[:REVISION[:AGE]]
                     specify library version info [each variable defaults to 0]
   -weak LIBNAME     declare that the target provides the LIBNAME interface
-  -Wc,FLAG
-  -Xcompiler FLAG   pass linker-specific FLAG directly to the compiler
-  -Wl,FLAG
-  -Xlinker FLAG     pass linker-specific FLAG directly to the linker
-  -XCClinker FLAG   pass link-specific FLAG to the compiler driver (CC)
 
 All other options (arguments beginning with \`-') are ignored.
 
@@ -2473,44 +1619,18 @@ Otherwise, only FILE itself is deleted u
         ;;
 
       *)
-        func_fatal_help "invalid operation mode \`$opt_mode'"
+        func_fatal_help "invalid operation mode \`$mode'"
         ;;
     esac
 
-    echo
+    $ECHO
     $ECHO "Try \`$progname --help' for more information about other modes."
+
+    exit $?
 }
 
-# Now that we've collected a possible --mode arg, show help if necessary
-if $opt_help; then
-  if test "$opt_help" = :; then
-    func_mode_help
-  else
-    {
-      func_help noexit
-      for opt_mode in compile link execute install finish uninstall clean; do
-	func_mode_help
-      done
-    } | sed -n '1p; 2,$s/^Usage:/  or: /p'
-    {
-      func_help noexit
-      for opt_mode in compile link execute install finish uninstall clean; do
-	echo
-	func_mode_help
-      done
-    } |
-    sed '1d
-      /^When reporting/,/^Report/{
-	H
-	d
-      }
-      $x
-      /information about other modes/d
-      /more detailed .*MODE/d
-      s/^Usage:.*--mode=\([^ ]*\) .*/Description of \1 mode:/'
-  fi
-  exit $?
-fi
+  # Now that we've collected a possible --mode arg, show help if necessary
+  $opt_help && func_mode_help
 
 
 # func_mode_execute arg...
@@ -2523,16 +1643,13 @@ func_mode_execute ()
       func_fatal_help "you must specify a COMMAND"
 
     # Handle -dlopen flags immediately.
-    for file in $opt_dlopen; do
+    for file in $execute_dlfiles; do
       test -f "$file" \
 	|| func_fatal_help "\`$file' is not a file"
 
       dir=
       case $file in
       *.la)
-	func_resolve_sysroot "$file"
-	file=$func_resolve_sysroot_result
-
 	# Check to see that this really is a libtool archive.
 	func_lalib_unsafe_p "$file" \
 	  || func_fatal_help "\`$lib' is not a valid libtool archive"
@@ -2554,7 +1671,7 @@ func_mode_execute ()
 	dir="$func_dirname_result"
 
 	if test -f "$dir/$objdir/$dlname"; then
-	  func_append dir "/$objdir"
+	  dir="$dir/$objdir"
 	else
 	  if test ! -f "$dir/$dlname"; then
 	    func_fatal_error "cannot find \`$dlname' in \`$dir' or \`$dir/$objdir'"
@@ -2595,7 +1712,7 @@ func_mode_execute ()
     for file
     do
       case $file in
-      -* | *.la | *.lo ) ;;
+      -*) ;;
       *)
 	# Do a test to see if this is really a libtool program.
 	if func_ltwrapper_script_p "$file"; then
@@ -2611,7 +1728,8 @@ func_mode_execute ()
 	;;
       esac
       # Quote arguments (to preserve shell metacharacters).
-      func_append_quoted args "$file"
+      func_quote_for_eval "$file"
+      args="$args $func_quote_for_eval_result"
     done
 
     if test "X$opt_dry_run" = Xfalse; then
@@ -2636,66 +1754,29 @@ func_mode_execute ()
       # Display what would be done.
       if test -n "$shlibpath_var"; then
 	eval "\$ECHO \"\$shlibpath_var=\$$shlibpath_var\""
-	echo "export $shlibpath_var"
-      fi
-      $ECHO "$cmd$args"
-      exit $EXIT_SUCCESS
-    fi
-}
-
-test "$opt_mode" = execute && func_mode_execute ${1+"$@"}
-
-
-# func_mode_finish arg...
-func_mode_finish ()
-{
-    $opt_debug
-    libs=
-    libdirs=
-    admincmds=
-
-    for opt in "$nonopt" ${1+"$@"}
-    do
-      if test -d "$opt"; then
-	func_append libdirs " $opt"
-
-      elif test -f "$opt"; then
-	if func_lalib_unsafe_p "$opt"; then
-	  func_append libs " $opt"
-	else
-	  func_warning "\`$opt' is not a valid libtool archive"
-	fi
-
-      else
-	func_fatal_error "invalid argument \`$opt'"
-      fi
-    done
-
-    if test -n "$libs"; then
-      if test -n "$lt_sysroot"; then
-        sysroot_regex=`$ECHO "$lt_sysroot" | $SED "$sed_make_literal_regex"`
-        sysroot_cmd="s/\([ ']\)$sysroot_regex/\1/g;"
-      else
-        sysroot_cmd=
-      fi
-
-      # Remove sysroot references
-      if $opt_dry_run; then
-        for lib in $libs; do
-          echo "removing references to $lt_sysroot and \`=' prefixes from $lib"
-        done
-      else
-        tmpdir=`func_mktempdir`
-        for lib in $libs; do
-	  sed -e "${sysroot_cmd} s/\([ ']-[LR]\)=/\1/g; s/\([ ']\)=/\1/g" $lib \
-	    > $tmpdir/tmp-la
-	  mv -f $tmpdir/tmp-la $lib
-	done
-        ${RM}r "$tmpdir"
+	$ECHO "export $shlibpath_var"
       fi
+      $ECHO "$cmd$args"
+      exit $EXIT_SUCCESS
     fi
+}
+
+test "$mode" = execute && func_mode_execute ${1+"$@"}
+
+
+# func_mode_finish arg...
+func_mode_finish ()
+{
+    $opt_debug
+    libdirs="$nonopt"
+    admincmds=
 
     if test -n "$finish_cmds$finish_eval" && test -n "$libdirs"; then
+      for dir
+      do
+	libdirs="$libdirs $dir"
+      done
+
       for libdir in $libdirs; do
 	if test -n "$finish_cmds"; then
 	  # Do each command in the finish commands.
@@ -2705,7 +1786,7 @@ func_mode_finish ()
 	if test -n "$finish_eval"; then
 	  # Do the single finish_eval.
 	  eval cmds=\"$finish_eval\"
-	  $opt_dry_run || eval "$cmds" || func_append admincmds "
+	  $opt_dry_run || eval "$cmds" || admincmds="$admincmds
        $cmds"
 	fi
       done
@@ -2714,55 +1795,53 @@ func_mode_finish ()
     # Exit here if they wanted silent mode.
     $opt_silent && exit $EXIT_SUCCESS
 
-    if test -n "$finish_cmds$finish_eval" && test -n "$libdirs"; then
-      echo "----------------------------------------------------------------------"
-      echo "Libraries have been installed in:"
-      for libdir in $libdirs; do
-	$ECHO "   $libdir"
-      done
-      echo
-      echo "If you ever happen to want to link against installed libraries"
-      echo "in a given directory, LIBDIR, you must either use libtool, and"
-      echo "specify the full pathname of the library, or use the \`-LLIBDIR'"
-      echo "flag during linking and do at least one of the following:"
-      if test -n "$shlibpath_var"; then
-	echo "   - add LIBDIR to the \`$shlibpath_var' environment variable"
-	echo "     during execution"
-      fi
-      if test -n "$runpath_var"; then
-	echo "   - add LIBDIR to the \`$runpath_var' environment variable"
-	echo "     during linking"
-      fi
-      if test -n "$hardcode_libdir_flag_spec"; then
-	libdir=LIBDIR
-	eval flag=\"$hardcode_libdir_flag_spec\"
-
-	$ECHO "   - use the \`$flag' linker flag"
-      fi
-      if test -n "$admincmds"; then
-	$ECHO "   - have your system administrator run these commands:$admincmds"
-      fi
-      if test -f /etc/ld.so.conf; then
-	echo "   - have your system administrator add LIBDIR to \`/etc/ld.so.conf'"
-      fi
-      echo
+    $ECHO "X----------------------------------------------------------------------" | $Xsed
+    $ECHO "Libraries have been installed in:"
+    for libdir in $libdirs; do
+      $ECHO "   $libdir"
+    done
+    $ECHO
+    $ECHO "If you ever happen to want to link against installed libraries"
+    $ECHO "in a given directory, LIBDIR, you must either use libtool, and"
+    $ECHO "specify the full pathname of the library, or use the \`-LLIBDIR'"
+    $ECHO "flag during linking and do at least one of the following:"
+    if test -n "$shlibpath_var"; then
+      $ECHO "   - add LIBDIR to the \`$shlibpath_var' environment variable"
+      $ECHO "     during execution"
+    fi
+    if test -n "$runpath_var"; then
+      $ECHO "   - add LIBDIR to the \`$runpath_var' environment variable"
+      $ECHO "     during linking"
+    fi
+    if test -n "$hardcode_libdir_flag_spec"; then
+      libdir=LIBDIR
+      eval flag=\"$hardcode_libdir_flag_spec\"
 
-      echo "See any operating system documentation about shared libraries for"
-      case $host in
-	solaris2.[6789]|solaris2.1[0-9])
-	  echo "more information, such as the ld(1), crle(1) and ld.so(8) manual"
-	  echo "pages."
-	  ;;
-	*)
-	  echo "more information, such as the ld(1) and ld.so(8) manual pages."
-	  ;;
-      esac
-      echo "----------------------------------------------------------------------"
+      $ECHO "   - use the \`$flag' linker flag"
+    fi
+    if test -n "$admincmds"; then
+      $ECHO "   - have your system administrator run these commands:$admincmds"
+    fi
+    if test -f /etc/ld.so.conf; then
+      $ECHO "   - have your system administrator add LIBDIR to \`/etc/ld.so.conf'"
     fi
+    $ECHO
+
+    $ECHO "See any operating system documentation about shared libraries for"
+    case $host in
+      solaris2.[6789]|solaris2.1[0-9])
+        $ECHO "more information, such as the ld(1), crle(1) and ld.so(8) manual"
+	$ECHO "pages."
+	;;
+      *)
+        $ECHO "more information, such as the ld(1) and ld.so(8) manual pages."
+        ;;
+    esac
+    $ECHO "X----------------------------------------------------------------------" | $Xsed
     exit $EXIT_SUCCESS
 }
 
-test "$opt_mode" = finish && func_mode_finish ${1+"$@"}
+test "$mode" = finish && func_mode_finish ${1+"$@"}
 
 
 # func_mode_install arg...
@@ -2773,7 +1852,7 @@ func_mode_install ()
     # install_prog (especially on Windows NT).
     if test "$nonopt" = "$SHELL" || test "$nonopt" = /bin/sh ||
        # Allow the use of GNU shtool's install command.
-       case $nonopt in *shtool*) :;; *) false;; esac; then
+       $ECHO "X$nonopt" | $GREP shtool >/dev/null; then
       # Aesthetically quote it.
       func_quote_for_eval "$nonopt"
       install_prog="$func_quote_for_eval_result "
@@ -2787,12 +1866,7 @@ func_mode_install ()
     # The real first argument should be the name of the installation program.
     # Aesthetically quote it.
     func_quote_for_eval "$arg"
-    func_append install_prog "$func_quote_for_eval_result"
-    install_shared_prog=$install_prog
-    case " $install_prog " in
-      *[\\\ /]cp\ *) install_cp=: ;;
-      *) install_cp=false ;;
-    esac
+    install_prog="$install_prog$func_quote_for_eval_result"
 
     # We need to accept at least all the BSD install flags.
     dest=
@@ -2802,12 +1876,10 @@ func_mode_install ()
     install_type=
     isdir=no
     stripme=
-    no_mode=:
     for arg
     do
-      arg2=
       if test -n "$dest"; then
-	func_append files " $dest"
+	files="$files $dest"
 	dest=$arg
 	continue
       fi
@@ -2815,9 +1887,10 @@ func_mode_install ()
       case $arg in
       -d) isdir=yes ;;
       -f)
-	if $install_cp; then :; else
-	  prev=$arg
-	fi
+	case " $install_prog " in
+	*[\\\ /]cp\ *) ;;
+	*) prev=$arg ;;
+	esac
 	;;
       -g | -m | -o)
 	prev=$arg
@@ -2831,10 +1904,6 @@ func_mode_install ()
       *)
 	# If the previous option needed an argument, then skip it.
 	if test -n "$prev"; then
-	  if test "x$prev" = x-m && test -n "$install_override_mode"; then
-	    arg2=$install_override_mode
-	    no_mode=false
-	  fi
 	  prev=
 	else
 	  dest=$arg
@@ -2845,11 +1914,7 @@ func_mode_install ()
 
       # Aesthetically quote the argument.
       func_quote_for_eval "$arg"
-      func_append install_prog " $func_quote_for_eval_result"
-      if test -n "$arg2"; then
-	func_quote_for_eval "$arg2"
-      fi
-      func_append install_shared_prog " $func_quote_for_eval_result"
+      install_prog="$install_prog $func_quote_for_eval_result"
     done
 
     test -z "$install_prog" && \
@@ -2858,13 +1923,6 @@ func_mode_install ()
     test -n "$prev" && \
       func_fatal_help "the \`$prev' option requires an argument"
 
-    if test -n "$install_override_mode" && $no_mode; then
-      if $install_cp; then :; else
-	func_quote_for_eval "$install_override_mode"
-	func_append install_shared_prog " -m $func_quote_for_eval_result"
-      fi
-    fi
-
     if test -z "$files"; then
       if test -z "$dest"; then
 	func_fatal_help "no file or destination specified"
@@ -2919,13 +1977,10 @@ func_mode_install ()
       case $file in
       *.$libext)
 	# Do the static libraries later.
-	func_append staticlibs " $file"
+	staticlibs="$staticlibs $file"
 	;;
 
       *.la)
-	func_resolve_sysroot "$file"
-	file=$func_resolve_sysroot_result
-
 	# Check to see that this really is a libtool archive.
 	func_lalib_unsafe_p "$file" \
 	  || func_fatal_help "\`$file' is not a valid libtool archive"
@@ -2939,23 +1994,23 @@ func_mode_install ()
 	if test "X$destdir" = "X$libdir"; then
 	  case "$current_libdirs " in
 	  *" $libdir "*) ;;
-	  *) func_append current_libdirs " $libdir" ;;
+	  *) current_libdirs="$current_libdirs $libdir" ;;
 	  esac
 	else
 	  # Note the libdir as a future libdir.
 	  case "$future_libdirs " in
 	  *" $libdir "*) ;;
-	  *) func_append future_libdirs " $libdir" ;;
+	  *) future_libdirs="$future_libdirs $libdir" ;;
 	  esac
 	fi
 
 	func_dirname "$file" "/" ""
 	dir="$func_dirname_result"
-	func_append dir "$objdir"
+	dir="$dir$objdir"
 
 	if test -n "$relink_command"; then
 	  # Determine the prefix the user has applied to our future dir.
-	  inst_prefix_dir=`$ECHO "$destdir" | $SED -e "s%$libdir\$%%"`
+	  inst_prefix_dir=`$ECHO "X$destdir" | $Xsed -e "s%$libdir\$%%"`
 
 	  # Don't allow the user to place us outside of our expected
 	  # location b/c this prevents finding dependent libraries that
@@ -2968,9 +2023,9 @@ func_mode_install ()
 
 	  if test -n "$inst_prefix_dir"; then
 	    # Stick the inst_prefix_dir data into the link command.
-	    relink_command=`$ECHO "$relink_command" | $SED "s%@inst_prefix_dir@%-inst-prefix-dir $inst_prefix_dir%"`
+	    relink_command=`$ECHO "X$relink_command" | $Xsed -e "s%@inst_prefix_dir@%-inst-prefix-dir $inst_prefix_dir%"`
 	  else
-	    relink_command=`$ECHO "$relink_command" | $SED "s%@inst_prefix_dir@%%"`
+	    relink_command=`$ECHO "X$relink_command" | $Xsed -e "s%@inst_prefix_dir@%%"`
 	  fi
 
 	  func_warning "relinking \`$file'"
@@ -2988,7 +2043,7 @@ func_mode_install ()
 	  test -n "$relink_command" && srcname="$realname"T
 
 	  # Install the shared library and build the symlinks.
-	  func_show_eval "$install_shared_prog $dir/$srcname $destdir/$realname" \
+	  func_show_eval "$install_prog $dir/$srcname $destdir/$realname" \
 	      'exit $?'
 	  tstripme="$stripme"
 	  case $host_os in
@@ -3028,7 +2083,7 @@ func_mode_install ()
 	func_show_eval "$install_prog $instname $destdir/$name" 'exit $?'
 
 	# Maybe install the static library, too.
-	test -n "$old_library" && func_append staticlibs " $dir/$old_library"
+	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
 	;;
 
       *.lo)
@@ -3128,7 +2183,7 @@ func_mode_install ()
 	    if test -f "$lib"; then
 	      func_source "$lib"
 	    fi
-	    libfile="$libdir/"`$ECHO "$lib" | $SED 's%^.*/%%g'` ### testsuite: skip nested quoting test
+	    libfile="$libdir/"`$ECHO "X$lib" | $Xsed -e 's%^.*/%%g'` ### testsuite: skip nested quoting test
 	    if test -n "$libdir" && test ! -f "$libfile"; then
 	      func_warning "\`$lib' has not been installed in \`$libdir'"
 	      finalize=no
@@ -3147,7 +2202,7 @@ func_mode_install ()
 		file="$func_basename_result"
 	        outputname="$tmpdir/$file"
 	        # Replace the output file specification.
-	        relink_command=`$ECHO "$relink_command" | $SED 's%@OUTPUT@%'"$outputname"'%g'`
+	        relink_command=`$ECHO "X$relink_command" | $Xsed -e 's%@OUTPUT@%'"$outputname"'%g'`
 
 	        $opt_silent || {
 	          func_quote_for_expand "$relink_command"
@@ -3166,7 +2221,7 @@ func_mode_install ()
 	    }
 	  else
 	    # Install the binary that we compiled earlier.
-	    file=`$ECHO "$file$stripped_ext" | $SED "s%\([^/]*\)$%$objdir/\1%"`
+	    file=`$ECHO "X$file$stripped_ext" | $Xsed -e "s%\([^/]*\)$%$objdir/\1%"`
 	  fi
 	fi
 
@@ -3202,13 +2257,11 @@ func_mode_install ()
 
       # Set up the ranlib parameters.
       oldlib="$destdir/$name"
-      func_to_tool_file "$oldlib" func_convert_file_msys_to_w32
-      tool_oldlib=$func_to_tool_file_result
 
       func_show_eval "$install_prog \$file \$oldlib" 'exit $?'
 
       if test -n "$stripme" && test -n "$old_striplib"; then
-	func_show_eval "$old_striplib $tool_oldlib" 'exit $?'
+	func_show_eval "$old_striplib $oldlib" 'exit $?'
       fi
 
       # Do each command in the postinstall commands.
@@ -3227,7 +2280,7 @@ func_mode_install ()
     fi
 }
 
-test "$opt_mode" = install && func_mode_install ${1+"$@"}
+test "$mode" = install && func_mode_install ${1+"$@"}
 
 
 # func_generate_dlsyms outputname originator pic_p
@@ -3270,22 +2323,6 @@ func_generate_dlsyms ()
 extern \"C\" {
 #endif
 
-#if defined(__GNUC__) && (((__GNUC__ == 4) && (__GNUC_MINOR__ >= 4)) || (__GNUC__ > 4))
-#pragma GCC diagnostic ignored \"-Wstrict-prototypes\"
-#endif
-
-/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and tests.  */
-#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
-/* DATA imports from DLLs on WIN32 con't be const, because runtime
-   relocations are performed -- see ld's documentation on pseudo-relocs.  */
-# define LT_DLSYM_CONST
-#elif defined(__osf__)
-/* This system does not cope well with relocations in const data.  */
-# define LT_DLSYM_CONST
-#else
-# define LT_DLSYM_CONST const
-#endif
-
 /* External symbol declarations for the compiler. */\
 "
 
@@ -3295,11 +2332,10 @@ extern \"C\" {
 	  $opt_dry_run || echo ': @PROGRAM@ ' > "$nlist"
 
 	  # Add our own program objects to the symbol list.
-	  progfiles=`$ECHO "$objs$old_deplibs" | $SP2NL | $SED "$lo2o" | $NL2SP`
+	  progfiles=`$ECHO "X$objs$old_deplibs" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
 	  for progfile in $progfiles; do
-	    func_to_tool_file "$progfile" func_convert_file_msys_to_w32
-	    func_verbose "extracting global C symbols from \`$func_to_tool_file_result'"
-	    $opt_dry_run || eval "$NM $func_to_tool_file_result | $global_symbol_pipe >> '$nlist'"
+	    func_verbose "extracting global C symbols from \`$progfile'"
+	    $opt_dry_run || eval "$NM $progfile | $global_symbol_pipe >> '$nlist'"
 	  done
 
 	  if test -n "$exclude_expsyms"; then
@@ -3335,7 +2371,7 @@ extern \"C\" {
 	      eval '$GREP -f "$output_objdir/$outputname.exp" < "$nlist" > "$nlist"T'
 	      eval '$MV "$nlist"T "$nlist"'
 	      case $host in
-	        *cygwin* | *mingw* | *cegcc* )
+	        *cygwin | *mingw* | *cegcc* )
 	          eval "echo EXPORTS "'> "$output_objdir/$outputname.def"'
 	          eval 'cat "$nlist" >> "$output_objdir/$outputname.def"'
 	          ;;
@@ -3348,52 +2384,10 @@ extern \"C\" {
 	  func_verbose "extracting global C symbols from \`$dlprefile'"
 	  func_basename "$dlprefile"
 	  name="$func_basename_result"
-          case $host in
-	    *cygwin* | *mingw* | *cegcc* )
-	      # if an import library, we need to obtain dlname
-	      if func_win32_import_lib_p "$dlprefile"; then
-	        func_tr_sh "$dlprefile"
-	        eval "curr_lafile=\$libfile_$func_tr_sh_result"
-	        dlprefile_dlbasename=""
-	        if test -n "$curr_lafile" && func_lalib_p "$curr_lafile"; then
-	          # Use subshell, to avoid clobbering current variable values
-	          dlprefile_dlname=`source "$curr_lafile" && echo "$dlname"`
-	          if test -n "$dlprefile_dlname" ; then
-	            func_basename "$dlprefile_dlname"
-	            dlprefile_dlbasename="$func_basename_result"
-	          else
-	            # no lafile. user explicitly requested -dlpreopen <import library>.
-	            $sharedlib_from_linklib_cmd "$dlprefile"
-	            dlprefile_dlbasename=$sharedlib_from_linklib_result
-	          fi
-	        fi
-	        $opt_dry_run || {
-	          if test -n "$dlprefile_dlbasename" ; then
-	            eval '$ECHO ": $dlprefile_dlbasename" >> "$nlist"'
-	          else
-	            func_warning "Could not compute DLL name from $name"
-	            eval '$ECHO ": $name " >> "$nlist"'
-	          fi
-	          func_to_tool_file "$dlprefile" func_convert_file_msys_to_w32
-	          eval "$NM \"$func_to_tool_file_result\" 2>/dev/null | $global_symbol_pipe |
-	            $SED -e '/I __imp/d' -e 's/I __nm_/D /;s/_nm__//' >> '$nlist'"
-	        }
-	      else # not an import lib
-	        $opt_dry_run || {
-	          eval '$ECHO ": $name " >> "$nlist"'
-	          func_to_tool_file "$dlprefile" func_convert_file_msys_to_w32
-	          eval "$NM \"$func_to_tool_file_result\" 2>/dev/null | $global_symbol_pipe >> '$nlist'"
-	        }
-	      fi
-	    ;;
-	    *)
-	      $opt_dry_run || {
-	        eval '$ECHO ": $name " >> "$nlist"'
-	        func_to_tool_file "$dlprefile" func_convert_file_msys_to_w32
-	        eval "$NM \"$func_to_tool_file_result\" 2>/dev/null | $global_symbol_pipe >> '$nlist'"
-	      }
-	    ;;
-          esac
+	  $opt_dry_run || {
+	    eval '$ECHO ": $name " >> "$nlist"'
+	    eval "$NM $dlprefile 2>/dev/null | $global_symbol_pipe >> '$nlist'"
+	  }
 	done
 
 	$opt_dry_run || {
@@ -3421,19 +2415,36 @@ extern \"C\" {
 	  if test -f "$nlist"S; then
 	    eval "$global_symbol_to_cdecl"' < "$nlist"S >> "$output_objdir/$my_dlsyms"'
 	  else
-	    echo '/* NONE */' >> "$output_objdir/$my_dlsyms"
+	    $ECHO '/* NONE */' >> "$output_objdir/$my_dlsyms"
 	  fi
 
-	  echo >> "$output_objdir/$my_dlsyms" "\
+	  $ECHO >> "$output_objdir/$my_dlsyms" "\
 
 /* The mapping between symbol names and symbols.  */
 typedef struct {
   const char *name;
   void *address;
 } lt_dlsymlist;
-extern LT_DLSYM_CONST lt_dlsymlist
+"
+	  case $host in
+	  *cygwin* | *mingw* | *cegcc* )
+	    $ECHO >> "$output_objdir/$my_dlsyms" "\
+/* DATA imports from DLLs on WIN32 con't be const, because
+   runtime relocations are performed -- see ld's documentation
+   on pseudo-relocs.  */"
+	    lt_dlsym_const= ;;
+	  *osf5*)
+	    echo >> "$output_objdir/$my_dlsyms" "\
+/* This system does not cope well with relocations in const data */"
+	    lt_dlsym_const= ;;
+	  *)
+	    lt_dlsym_const=const ;;
+	  esac
+
+	  $ECHO >> "$output_objdir/$my_dlsyms" "\
+extern $lt_dlsym_const lt_dlsymlist
 lt_${my_prefix}_LTX_preloaded_symbols[];
-LT_DLSYM_CONST lt_dlsymlist
+$lt_dlsym_const lt_dlsymlist
 lt_${my_prefix}_LTX_preloaded_symbols[] =
 {\
   { \"$my_originator\", (void *) 0 },"
@@ -3446,7 +2457,7 @@ lt_${my_prefix}_LTX_preloaded_symbols[]
 	    eval "$global_symbol_to_c_name_address_lib_prefix" < "$nlist" >> "$output_objdir/$my_dlsyms"
 	    ;;
 	  esac
-	  echo >> "$output_objdir/$my_dlsyms" "\
+	  $ECHO >> "$output_objdir/$my_dlsyms" "\
   {0, (void *) 0}
 };
 
@@ -3473,7 +2484,7 @@ static const void *lt_preloaded_setup()
 	  # linked before any other PIC object.  But we must not use
 	  # pic_flag when linking with -static.  The problem exists in
 	  # FreeBSD 2.2.6 and is fixed in FreeBSD 3.1.
-	  *-*-freebsd2.*|*-*-freebsd3.0*|*-*-freebsdelf3.0*)
+	  *-*-freebsd2*|*-*-freebsd3.0*|*-*-freebsdelf3.0*)
 	    pic_flag_for_symtable=" $pic_flag -DFREEBSD_WORKAROUND" ;;
 	  *-*-hpux*)
 	    pic_flag_for_symtable=" $pic_flag"  ;;
@@ -3489,7 +2500,7 @@ static const void *lt_preloaded_setup()
 	for arg in $LTCFLAGS; do
 	  case $arg in
 	  -pie | -fpie | -fPIE) ;;
-	  *) func_append symtab_cflags " $arg" ;;
+	  *) symtab_cflags="$symtab_cflags $arg" ;;
 	  esac
 	done
 
@@ -3504,16 +2515,16 @@ static const void *lt_preloaded_setup()
 	case $host in
 	*cygwin* | *mingw* | *cegcc* )
 	  if test -f "$output_objdir/$my_outputname.def"; then
-	    compile_command=`$ECHO "$compile_command" | $SED "s%@SYMFILE@%$output_objdir/$my_outputname.def $symfileobj%"`
-	    finalize_command=`$ECHO "$finalize_command" | $SED "s%@SYMFILE@%$output_objdir/$my_outputname.def $symfileobj%"`
+	    compile_command=`$ECHO "X$compile_command" | $Xsed -e "s%@SYMFILE@%$output_objdir/$my_outputname.def $symfileobj%"`
+	    finalize_command=`$ECHO "X$finalize_command" | $Xsed -e "s%@SYMFILE@%$output_objdir/$my_outputname.def $symfileobj%"`
 	  else
-	    compile_command=`$ECHO "$compile_command" | $SED "s%@SYMFILE@%$symfileobj%"`
-	    finalize_command=`$ECHO "$finalize_command" | $SED "s%@SYMFILE@%$symfileobj%"`
+	    compile_command=`$ECHO "X$compile_command" | $Xsed -e "s%@SYMFILE@%$symfileobj%"`
+	    finalize_command=`$ECHO "X$finalize_command" | $Xsed -e "s%@SYMFILE@%$symfileobj%"`
 	  fi
 	  ;;
 	*)
-	  compile_command=`$ECHO "$compile_command" | $SED "s%@SYMFILE@%$symfileobj%"`
-	  finalize_command=`$ECHO "$finalize_command" | $SED "s%@SYMFILE@%$symfileobj%"`
+	  compile_command=`$ECHO "X$compile_command" | $Xsed -e "s%@SYMFILE@%$symfileobj%"`
+	  finalize_command=`$ECHO "X$finalize_command" | $Xsed -e "s%@SYMFILE@%$symfileobj%"`
 	  ;;
 	esac
 	;;
@@ -3527,8 +2538,8 @@ static const void *lt_preloaded_setup()
       # really was required.
 
       # Nullify the symbol file.
-      compile_command=`$ECHO "$compile_command" | $SED "s% @SYMFILE@%%"`
-      finalize_command=`$ECHO "$finalize_command" | $SED "s% @SYMFILE@%%"`
+      compile_command=`$ECHO "X$compile_command" | $Xsed -e "s% @SYMFILE@%%"`
+      finalize_command=`$ECHO "X$finalize_command" | $Xsed -e "s% @SYMFILE@%%"`
     fi
 }
 
@@ -3538,7 +2549,6 @@ static const void *lt_preloaded_setup()
 # Need a lot of goo to handle *both* DLLs and import libs
 # Has to be a shell function in order to 'eat' the argument
 # that is supplied when $file_magic_command is called.
-# Despite the name, also deal with 64 bit binaries.
 func_win32_libid ()
 {
   $opt_debug
@@ -3549,11 +2559,9 @@ func_win32_libid ()
     win32_libid_type="x86 archive import"
     ;;
   *ar\ archive*) # could be an import, or static
-    # Keep the egrep pattern in sync with the one in _LT_CHECK_MAGIC_METHOD.
     if eval $OBJDUMP -f $1 | $SED -e '10q' 2>/dev/null |
-       $EGREP 'file format (pei*-i386(.*architecture: i386)?|pe-arm-wince|pe-x86-64)' >/dev/null; then
-      func_to_tool_file "$1" func_convert_file_msys_to_w32
-      win32_nmres=`eval $NM -f posix -A \"$func_to_tool_file_result\" |
+       $EGREP 'file format pe-i386(.*architecture: i386)?' >/dev/null ; then
+      win32_nmres=`eval $NM -f posix -A $1 |
 	$SED -n -e '
 	    1,100{
 		/ I /{
@@ -3582,131 +2590,6 @@ func_win32_libid ()
   $ECHO "$win32_libid_type"
 }
 
-# func_cygming_dll_for_implib ARG
-#
-# Platform-specific function to extract the
-# name of the DLL associated with the specified
-# import library ARG.
-# Invoked by eval'ing the libtool variable
-#    $sharedlib_from_linklib_cmd
-# Result is available in the variable
-#    $sharedlib_from_linklib_result
-func_cygming_dll_for_implib ()
-{
-  $opt_debug
-  sharedlib_from_linklib_result=`$DLLTOOL --identify-strict --identify "$1"`
-}
-
-# func_cygming_dll_for_implib_fallback_core SECTION_NAME LIBNAMEs
-#
-# The is the core of a fallback implementation of a
-# platform-specific function to extract the name of the
-# DLL associated with the specified import library LIBNAME.
-#
-# SECTION_NAME is either .idata$6 or .idata$7, depending
-# on the platform and compiler that created the implib.
-#
-# Echos the name of the DLL associated with the
-# specified import library.
-func_cygming_dll_for_implib_fallback_core ()
-{
-  $opt_debug
-  match_literal=`$ECHO "$1" | $SED "$sed_make_literal_regex"`
-  $OBJDUMP -s --section "$1" "$2" 2>/dev/null |
-    $SED '/^Contents of section '"$match_literal"':/{
-      # Place marker at beginning of archive member dllname section
-      s/.*/====MARK====/
-      p
-      d
-    }
-    # These lines can sometimes be longer than 43 characters, but
-    # are always uninteresting
-    /:[	 ]*file format pe[i]\{,1\}-/d
-    /^In archive [^:]*:/d
-    # Ensure marker is printed
-    /^====MARK====/p
-    # Remove all lines with less than 43 characters
-    /^.\{43\}/!d
-    # From remaining lines, remove first 43 characters
-    s/^.\{43\}//' |
-    $SED -n '
-      # Join marker and all lines until next marker into a single line
-      /^====MARK====/ b para
-      H
-      $ b para
-      b
-      :para
-      x
-      s/\n//g
-      # Remove the marker
-      s/^====MARK====//
-      # Remove trailing dots and whitespace
-      s/[\. \t]*$//
-      # Print
-      /./p' |
-    # we now have a list, one entry per line, of the stringified
-    # contents of the appropriate section of all members of the
-    # archive which possess that section. Heuristic: eliminate
-    # all those which have a first or second character that is
-    # a '.' (that is, objdump's representation of an unprintable
-    # character.) This should work for all archives with less than
-    # 0x302f exports -- but will fail for DLLs whose name actually
-    # begins with a literal '.' or a single character followed by
-    # a '.'.
-    #
-    # Of those that remain, print the first one.
-    $SED -e '/^\./d;/^.\./d;q'
-}
-
-# func_cygming_gnu_implib_p ARG
-# This predicate returns with zero status (TRUE) if
-# ARG is a GNU/binutils-style import library. Returns
-# with nonzero status (FALSE) otherwise.
-func_cygming_gnu_implib_p ()
-{
-  $opt_debug
-  func_to_tool_file "$1" func_convert_file_msys_to_w32
-  func_cygming_gnu_implib_tmp=`$NM "$func_to_tool_file_result" | eval "$global_symbol_pipe" | $EGREP ' (_head_[A-Za-z0-9_]+_[ad]l*|[A-Za-z0-9_]+_[ad]l*_iname)$'`
-  test -n "$func_cygming_gnu_implib_tmp"
-}
-
-# func_cygming_ms_implib_p ARG
-# This predicate returns with zero status (TRUE) if
-# ARG is an MS-style import library. Returns
-# with nonzero status (FALSE) otherwise.
-func_cygming_ms_implib_p ()
-{
-  $opt_debug
-  func_to_tool_file "$1" func_convert_file_msys_to_w32
-  func_cygming_ms_implib_tmp=`$NM "$func_to_tool_file_result" | eval "$global_symbol_pipe" | $GREP '_NULL_IMPORT_DESCRIPTOR'`
-  test -n "$func_cygming_ms_implib_tmp"
-}
-
-# func_cygming_dll_for_implib_fallback ARG
-# Platform-specific function to extract the
-# name of the DLL associated with the specified
-# import library ARG.
-#
-# This fallback implementation is for use when $DLLTOOL
-# does not support the --identify-strict option.
-# Invoked by eval'ing the libtool variable
-#    $sharedlib_from_linklib_cmd
-# Result is available in the variable
-#    $sharedlib_from_linklib_result
-func_cygming_dll_for_implib_fallback ()
-{
-  $opt_debug
-  if func_cygming_gnu_implib_p "$1" ; then
-    # binutils import library
-    sharedlib_from_linklib_result=`func_cygming_dll_for_implib_fallback_core '.idata$7' "$1"`
-  elif func_cygming_ms_implib_p "$1" ; then
-    # ms-generated import library
-    sharedlib_from_linklib_result=`func_cygming_dll_for_implib_fallback_core '.idata$6' "$1"`
-  else
-    # unknown
-    sharedlib_from_linklib_result=""
-  fi
-}
 
 
 # func_extract_an_archive dir oldlib
@@ -3715,18 +2598,7 @@ func_extract_an_archive ()
     $opt_debug
     f_ex_an_ar_dir="$1"; shift
     f_ex_an_ar_oldlib="$1"
-    if test "$lock_old_archive_extraction" = yes; then
-      lockfile=$f_ex_an_ar_oldlib.lock
-      until $opt_dry_run || ln "$progpath" "$lockfile" 2>/dev/null; do
-	func_echo "Waiting for $lockfile to be removed"
-	sleep 2
-      done
-    fi
-    func_show_eval "(cd \$f_ex_an_ar_dir && $AR x \"\$f_ex_an_ar_oldlib\")" \
-		   'stat=$?; rm -f "$lockfile"; exit $stat'
-    if test "$lock_old_archive_extraction" = yes; then
-      $opt_dry_run || rm -f "$lockfile"
-    fi
+    func_show_eval "(cd \$f_ex_an_ar_dir && $AR x \"\$f_ex_an_ar_oldlib\")" 'exit $?'
     if ($AR t "$f_ex_an_ar_oldlib" | sort | sort -uc >/dev/null 2>&1); then
      :
     else
@@ -3797,7 +2669,7 @@ func_extract_archives ()
 	    darwin_file=
 	    darwin_files=
 	    for darwin_file in $darwin_filelist; do
-	      darwin_files=`find unfat-$$ -name $darwin_file -print | sort | $NL2SP`
+	      darwin_files=`find unfat-$$ -name $darwin_file -print | $NL2SP`
 	      $LIPO -create -output "$darwin_file" $darwin_files
 	    done # $darwin_filelist
 	    $RM -rf unfat-$$
@@ -3812,30 +2684,25 @@ func_extract_archives ()
         func_extract_an_archive "$my_xdir" "$my_xabs"
 	;;
       esac
-      my_oldobjs="$my_oldobjs "`find $my_xdir -name \*.$objext -print -o -name \*.lo -print | sort | $NL2SP`
+      my_oldobjs="$my_oldobjs "`find $my_xdir -name \*.$objext -print -o -name \*.lo -print | $NL2SP`
     done
 
     func_extract_archives_result="$my_oldobjs"
 }
 
 
-# func_emit_wrapper [arg=no]
-#
-# Emit a libtool wrapper script on stdout.
-# Don't directly open a file because we may want to
-# incorporate the script contents within a cygwin/mingw
-# wrapper executable.  Must ONLY be called from within
-# func_mode_link because it depends on a number of variables
-# set therein.
+
+# func_emit_wrapper_part1 [arg=no]
 #
-# ARG is the value that the WRAPPER_SCRIPT_BELONGS_IN_OBJDIR
-# variable will take.  If 'yes', then the emitted script
-# will assume that the directory in which it is stored is
-# the $objdir directory.  This is a cygwin/mingw-specific
-# behavior.
-func_emit_wrapper ()
-{
-	func_emit_wrapper_arg1=${1-no}
+# Emit the first part of a libtool wrapper script on stdout.
+# For more information, see the description associated with
+# func_emit_wrapper(), below.
+func_emit_wrapper_part1 ()
+{
+	func_emit_wrapper_part1_arg1=no
+	if test -n "$1" ; then
+	  func_emit_wrapper_part1_arg1=$1
+	fi
 
 	$ECHO "\
 #! $SHELL
@@ -3851,6 +2718,7 @@ func_emit_wrapper ()
 
 # Sed substitution that helps us do robust quoting.  It backslashifies
 # metacharacters that are still active within double-quoted strings.
+Xsed='${SED} -e 1s/^X//'
 sed_quote_subst='$sed_quote_subst'
 
 # Be Bourne compatible
@@ -3881,135 +2749,31 @@ if test \"\$libtool_install_magic\" = \"
 else
   # When we are sourced in execute mode, \$file and \$ECHO are already set.
   if test \"\$libtool_execute_magic\" != \"$magic\"; then
-    file=\"\$0\""
-
-    qECHO=`$ECHO "$ECHO" | $SED "$sed_quote_subst"`
-    $ECHO "\
-
-# A function that is used when there is no print builtin or printf.
-func_fallback_echo ()
-{
-  eval 'cat <<_LTECHO_EOF
-\$1
-_LTECHO_EOF'
-}
-    ECHO=\"$qECHO\"
-  fi
-
-# Very basic option parsing. These options are (a) specific to
-# the libtool wrapper, (b) are identical between the wrapper
-# /script/ and the wrapper /executable/ which is used only on
-# windows platforms, and (c) all begin with the string "--lt-"
-# (application programs are unlikely to have options which match
-# this pattern).
-#
-# There are only two supported options: --lt-debug and
-# --lt-dump-script. There is, deliberately, no --lt-help.
-#
-# The first argument to this parsing function should be the
-# script's $0 value, followed by "$@".
-lt_option_debug=
-func_parse_lt_options ()
-{
-  lt_script_arg0=\$0
-  shift
-  for lt_opt
-  do
-    case \"\$lt_opt\" in
-    --lt-debug) lt_option_debug=1 ;;
-    --lt-dump-script)
-        lt_dump_D=\`\$ECHO \"X\$lt_script_arg0\" | $SED -e 's/^X//' -e 's%/[^/]*$%%'\`
-        test \"X\$lt_dump_D\" = \"X\$lt_script_arg0\" && lt_dump_D=.
-        lt_dump_F=\`\$ECHO \"X\$lt_script_arg0\" | $SED -e 's/^X//' -e 's%^.*/%%'\`
-        cat \"\$lt_dump_D/\$lt_dump_F\"
-        exit 0
-      ;;
-    --lt-*)
-        \$ECHO \"Unrecognized --lt- option: '\$lt_opt'\" 1>&2
-        exit 1
-      ;;
-    esac
-  done
-
-  # Print the debug banner immediately:
-  if test -n \"\$lt_option_debug\"; then
-    echo \"${outputname}:${output}:\${LINENO}: libtool wrapper (GNU $PACKAGE$TIMESTAMP) $VERSION\" 1>&2
-  fi
-}
-
-# Used when --lt-debug. Prints its arguments to stdout
-# (redirection is the responsibility of the caller)
-func_lt_dump_args ()
-{
-  lt_dump_args_N=1;
-  for lt_arg
-  do
-    \$ECHO \"${outputname}:${output}:\${LINENO}: newargv[\$lt_dump_args_N]: \$lt_arg\"
-    lt_dump_args_N=\`expr \$lt_dump_args_N + 1\`
-  done
-}
-
-# Core function for launching the target application
-func_exec_program_core ()
-{
-"
-  case $host in
-  # Backslashes separate directories on plain windows
-  *-*-mingw | *-*-os2* | *-cegcc*)
-    $ECHO "\
-      if test -n \"\$lt_option_debug\"; then
-        \$ECHO \"${outputname}:${output}:\${LINENO}: newargv[0]: \$progdir\\\\\$program\" 1>&2
-        func_lt_dump_args \${1+\"\$@\"} 1>&2
-      fi
-      exec \"\$progdir\\\\\$program\" \${1+\"\$@\"}
-"
-    ;;
-
-  *)
-    $ECHO "\
-      if test -n \"\$lt_option_debug\"; then
-        \$ECHO \"${outputname}:${output}:\${LINENO}: newargv[0]: \$progdir/\$program\" 1>&2
-        func_lt_dump_args \${1+\"\$@\"} 1>&2
-      fi
-      exec \"\$progdir/\$program\" \${1+\"\$@\"}
-"
-    ;;
-  esac
-  $ECHO "\
-      \$ECHO \"\$0: cannot exec \$program \$*\" 1>&2
-      exit 1
-}
-
-# A function to encapsulate launching the target application
-# Strips options in the --lt-* namespace from \$@ and
-# launches target application with the remaining arguments.
-func_exec_program ()
-{
-  case \" \$* \" in
-  *\\ --lt-*)
-    for lt_wr_arg
-    do
-      case \$lt_wr_arg in
-      --lt-*) ;;
-      *) set x \"\$@\" \"\$lt_wr_arg\"; shift;;
-      esac
+    ECHO=\"$qecho\"
+    file=\"\$0\"
+    # Make sure echo works.
+    if test \"X\$1\" = X--no-reexec; then
+      # Discard the --no-reexec flag, and continue.
       shift
-    done ;;
-  esac
-  func_exec_program_core \${1+\"\$@\"}
-}
-
-  # Parse options
-  func_parse_lt_options \"\$0\" \${1+\"\$@\"}
+    elif test \"X\`{ \$ECHO '\t'; } 2>/dev/null\`\" = 'X\t'; then
+      # Yippee, \$ECHO works!
+      :
+    else
+      # Restart under the correct shell, and then maybe \$ECHO will work.
+      exec $SHELL \"\$0\" --no-reexec \${1+\"\$@\"}
+    fi
+  fi\
+"
+	$ECHO "\
 
   # Find the directory that this script lives in.
-  thisdir=\`\$ECHO \"\$file\" | $SED 's%/[^/]*$%%'\`
+  thisdir=\`\$ECHO \"X\$file\" | \$Xsed -e 's%/[^/]*$%%'\`
   test \"x\$thisdir\" = \"x\$file\" && thisdir=.
 
   # Follow symbolic links until we get to the real thisdir.
-  file=\`ls -ld \"\$file\" | $SED -n 's/.*-> //p'\`
+  file=\`ls -ld \"\$file\" | ${SED} -n 's/.*-> //p'\`
   while test -n \"\$file\"; do
-    destdir=\`\$ECHO \"\$file\" | $SED 's%/[^/]*\$%%'\`
+    destdir=\`\$ECHO \"X\$file\" | \$Xsed -e 's%/[^/]*\$%%'\`
 
     # If there was a directory component, then change thisdir.
     if test \"x\$destdir\" != \"x\$file\"; then
@@ -4019,13 +2783,30 @@ func_exec_program ()
       esac
     fi
 
-    file=\`\$ECHO \"\$file\" | $SED 's%^.*/%%'\`
-    file=\`ls -ld \"\$thisdir/\$file\" | $SED -n 's/.*-> //p'\`
+    file=\`\$ECHO \"X\$file\" | \$Xsed -e 's%^.*/%%'\`
+    file=\`ls -ld \"\$thisdir/\$file\" | ${SED} -n 's/.*-> //p'\`
   done
+"
+}
+# end: func_emit_wrapper_part1
+
+# func_emit_wrapper_part2 [arg=no]
+#
+# Emit the second part of a libtool wrapper script on stdout.
+# For more information, see the description associated with
+# func_emit_wrapper(), below.
+func_emit_wrapper_part2 ()
+{
+	func_emit_wrapper_part2_arg1=no
+	if test -n "$1" ; then
+	  func_emit_wrapper_part2_arg1=$1
+	fi
+
+	$ECHO "\
 
   # Usually 'no', except on cygwin/mingw when embedded into
   # the cwrapper.
-  WRAPPER_SCRIPT_BELONGS_IN_OBJDIR=$func_emit_wrapper_arg1
+  WRAPPER_SCRIPT_BELONGS_IN_OBJDIR=$func_emit_wrapper_part2_arg1
   if test \"\$WRAPPER_SCRIPT_BELONGS_IN_OBJDIR\" = \"yes\"; then
     # special case for '.'
     if test \"\$thisdir\" = \".\"; then
@@ -4033,7 +2814,7 @@ func_exec_program ()
     fi
     # remove .libs from thisdir
     case \"\$thisdir\" in
-    *[\\\\/]$objdir ) thisdir=\`\$ECHO \"\$thisdir\" | $SED 's%[\\\\/][^\\\\/]*$%%'\` ;;
+    *[\\\\/]$objdir ) thisdir=\`\$ECHO \"X\$thisdir\" | \$Xsed -e 's%[\\\\/][^\\\\/]*$%%'\` ;;
     $objdir )   thisdir=. ;;
     esac
   fi
@@ -4088,18 +2869,6 @@ func_exec_program ()
 
   if test -f \"\$progdir/\$program\"; then"
 
-	# fixup the dll searchpath if we need to.
-	#
-	# Fix the DLL searchpath if we need to.  Do this before prepending
-	# to shlibpath, because on Windows, both are PATH and uninstalled
-	# libraries must come first.
-	if test -n "$dllsearchpath"; then
-	  $ECHO "\
-    # Add the dll search path components to the executable PATH
-    PATH=$dllsearchpath:\$PATH
-"
-	fi
-
 	# Export our shlibpath_var if we have one.
 	if test "$shlibpath_overrides_runpath" = yes && test -n "$shlibpath_var" && test -n "$temp_rpath"; then
 	  $ECHO "\
@@ -4108,28 +2877,253 @@ func_exec_program ()
 
     # Some systems cannot cope with colon-terminated $shlibpath_var
     # The second colon is a workaround for a bug in BeOS R4 sed
-    $shlibpath_var=\`\$ECHO \"\$$shlibpath_var\" | $SED 's/::*\$//'\`
+    $shlibpath_var=\`\$ECHO \"X\$$shlibpath_var\" | \$Xsed -e 's/::*\$//'\`
 
     export $shlibpath_var
 "
 	fi
 
+	# fixup the dll searchpath if we need to.
+	if test -n "$dllsearchpath"; then
+	  $ECHO "\
+    # Add the dll search path components to the executable PATH
+    PATH=$dllsearchpath:\$PATH
+"
+	fi
+
 	$ECHO "\
     if test \"\$libtool_execute_magic\" != \"$magic\"; then
       # Run the actual program with our arguments.
-      func_exec_program \${1+\"\$@\"}
+"
+	case $host in
+	# Backslashes separate directories on plain windows
+	*-*-mingw | *-*-os2* | *-cegcc*)
+	  $ECHO "\
+      exec \"\$progdir\\\\\$program\" \${1+\"\$@\"}
+"
+	  ;;
+
+	*)
+	  $ECHO "\
+      exec \"\$progdir/\$program\" \${1+\"\$@\"}
+"
+	  ;;
+	esac
+	$ECHO "\
+      \$ECHO \"\$0: cannot exec \$program \$*\" 1>&2
+      exit 1
     fi
   else
     # The program doesn't exist.
     \$ECHO \"\$0: error: \\\`\$progdir/\$program' does not exist\" 1>&2
     \$ECHO \"This script is just a wrapper for \$program.\" 1>&2
-    \$ECHO \"See the $PACKAGE documentation for more information.\" 1>&2
+    $ECHO \"See the $PACKAGE documentation for more information.\" 1>&2
     exit 1
   fi
 fi\
 "
 }
-
+# end: func_emit_wrapper_part2
+
+
+# func_emit_wrapper [arg=no]
+#
+# Emit a libtool wrapper script on stdout.
+# Don't directly open a file because we may want to
+# incorporate the script contents within a cygwin/mingw
+# wrapper executable.  Must ONLY be called from within
+# func_mode_link because it depends on a number of variables
+# set therein.
+#
+# ARG is the value that the WRAPPER_SCRIPT_BELONGS_IN_OBJDIR
+# variable will take.  If 'yes', then the emitted script
+# will assume that the directory in which it is stored is
+# the $objdir directory.  This is a cygwin/mingw-specific
+# behavior.
+func_emit_wrapper ()
+{
+	func_emit_wrapper_arg1=no
+	if test -n "$1" ; then
+	  func_emit_wrapper_arg1=$1
+	fi
+
+	# split this up so that func_emit_cwrapperexe_src
+	# can call each part independently.
+	func_emit_wrapper_part1 "${func_emit_wrapper_arg1}"
+	func_emit_wrapper_part2 "${func_emit_wrapper_arg1}"
+}
+
+
+# func_to_host_path arg
+#
+# Convert paths to host format when used with build tools.
+# Intended for use with "native" mingw (where libtool itself
+# is running under the msys shell), or in the following cross-
+# build environments:
+#    $build          $host
+#    mingw (msys)    mingw  [e.g. native]
+#    cygwin          mingw
+#    *nix + wine     mingw
+# where wine is equipped with the `winepath' executable.
+# In the native mingw case, the (msys) shell automatically
+# converts paths for any non-msys applications it launches,
+# but that facility isn't available from inside the cwrapper.
+# Similar accommodations are necessary for $host mingw and
+# $build cygwin.  Calling this function does no harm for other
+# $host/$build combinations not listed above.
+#
+# ARG is the path (on $build) that should be converted to
+# the proper representation for $host. The result is stored
+# in $func_to_host_path_result.
+func_to_host_path ()
+{
+  func_to_host_path_result="$1"
+  if test -n "$1" ; then
+    case $host in
+      *mingw* )
+        lt_sed_naive_backslashify='s|\\\\*|\\|g;s|/|\\|g;s|\\|\\\\|g'
+        case $build in
+          *mingw* ) # actually, msys
+            # awkward: cmd appends spaces to result
+            lt_sed_strip_trailing_spaces="s/[ ]*\$//"
+            func_to_host_path_tmp1=`( cmd //c echo "$1" |\
+              $SED -e "$lt_sed_strip_trailing_spaces" ) 2>/dev/null || echo ""`
+            func_to_host_path_result=`echo "$func_to_host_path_tmp1" |\
+              $SED -e "$lt_sed_naive_backslashify"`
+            ;;
+          *cygwin* )
+            func_to_host_path_tmp1=`cygpath -w "$1"`
+            func_to_host_path_result=`echo "$func_to_host_path_tmp1" |\
+              $SED -e "$lt_sed_naive_backslashify"`
+            ;;
+          * )
+            # Unfortunately, winepath does not exit with a non-zero
+            # error code, so we are forced to check the contents of
+            # stdout. On the other hand, if the command is not
+            # found, the shell will set an exit code of 127 and print
+            # *an error message* to stdout. So we must check for both
+            # error code of zero AND non-empty stdout, which explains
+            # the odd construction:
+            func_to_host_path_tmp1=`winepath -w "$1" 2>/dev/null`
+            if test "$?" -eq 0 && test -n "${func_to_host_path_tmp1}"; then
+              func_to_host_path_result=`echo "$func_to_host_path_tmp1" |\
+                $SED -e "$lt_sed_naive_backslashify"`
+            else
+              # Allow warning below.
+              func_to_host_path_result=""
+            fi
+            ;;
+        esac
+        if test -z "$func_to_host_path_result" ; then
+          func_error "Could not determine host path corresponding to"
+          func_error "  '$1'"
+          func_error "Continuing, but uninstalled executables may not work."
+          # Fallback:
+          func_to_host_path_result="$1"
+        fi
+        ;;
+    esac
+  fi
+}
+# end: func_to_host_path
+
+# func_to_host_pathlist arg
+#
+# Convert pathlists to host format when used with build tools.
+# See func_to_host_path(), above. This function supports the
+# following $build/$host combinations (but does no harm for
+# combinations not listed here):
+#    $build          $host
+#    mingw (msys)    mingw  [e.g. native]
+#    cygwin          mingw
+#    *nix + wine     mingw
+#
+# Path separators are also converted from $build format to
+# $host format. If ARG begins or ends with a path separator
+# character, it is preserved (but converted to $host format)
+# on output.
+#
+# ARG is a pathlist (on $build) that should be converted to
+# the proper representation on $host. The result is stored
+# in $func_to_host_pathlist_result.
+func_to_host_pathlist ()
+{
+  func_to_host_pathlist_result="$1"
+  if test -n "$1" ; then
+    case $host in
+      *mingw* )
+        lt_sed_naive_backslashify='s|\\\\*|\\|g;s|/|\\|g;s|\\|\\\\|g'
+        # Remove leading and trailing path separator characters from
+        # ARG. msys behavior is inconsistent here, cygpath turns them
+        # into '.;' and ';.', and winepath ignores them completely.
+        func_to_host_pathlist_tmp2="$1"
+        # Once set for this call, this variable should not be
+        # reassigned. It is used in tha fallback case.
+        func_to_host_pathlist_tmp1=`echo "$func_to_host_pathlist_tmp2" |\
+          $SED -e 's|^:*||' -e 's|:*$||'`
+        case $build in
+          *mingw* ) # Actually, msys.
+            # Awkward: cmd appends spaces to result.
+            lt_sed_strip_trailing_spaces="s/[ ]*\$//"
+            func_to_host_pathlist_tmp2=`( cmd //c echo "$func_to_host_pathlist_tmp1" |\
+              $SED -e "$lt_sed_strip_trailing_spaces" ) 2>/dev/null || echo ""`
+            func_to_host_pathlist_result=`echo "$func_to_host_pathlist_tmp2" |\
+              $SED -e "$lt_sed_naive_backslashify"`
+            ;;
+          *cygwin* )
+            func_to_host_pathlist_tmp2=`cygpath -w -p "$func_to_host_pathlist_tmp1"`
+            func_to_host_pathlist_result=`echo "$func_to_host_pathlist_tmp2" |\
+              $SED -e "$lt_sed_naive_backslashify"`
+            ;;
+          * )
+            # unfortunately, winepath doesn't convert pathlists
+            func_to_host_pathlist_result=""
+            func_to_host_pathlist_oldIFS=$IFS
+            IFS=:
+            for func_to_host_pathlist_f in $func_to_host_pathlist_tmp1 ; do
+              IFS=$func_to_host_pathlist_oldIFS
+              if test -n "$func_to_host_pathlist_f" ; then
+                func_to_host_path "$func_to_host_pathlist_f"
+                if test -n "$func_to_host_path_result" ; then
+                  if test -z "$func_to_host_pathlist_result" ; then
+                    func_to_host_pathlist_result="$func_to_host_path_result"
+                  else
+                    func_to_host_pathlist_result="$func_to_host_pathlist_result;$func_to_host_path_result"
+                  fi
+                fi
+              fi
+              IFS=:
+            done
+            IFS=$func_to_host_pathlist_oldIFS
+            ;;
+        esac
+        if test -z "$func_to_host_pathlist_result" ; then
+          func_error "Could not determine the host path(s) corresponding to"
+          func_error "  '$1'"
+          func_error "Continuing, but uninstalled executables may not work."
+          # Fallback. This may break if $1 contains DOS-style drive
+          # specifications. The fix is not to complicate the expression
+          # below, but for the user to provide a working wine installation
+          # with winepath so that path translation in the cross-to-mingw
+          # case works properly.
+          lt_replace_pathsep_nix_to_dos="s|:|;|g"
+          func_to_host_pathlist_result=`echo "$func_to_host_pathlist_tmp1" |\
+            $SED -e "$lt_replace_pathsep_nix_to_dos"`
+        fi
+        # Now, add the leading and trailing path separators back
+        case "$1" in
+          :* ) func_to_host_pathlist_result=";$func_to_host_pathlist_result"
+            ;;
+        esac
+        case "$1" in
+          *: ) func_to_host_pathlist_result="$func_to_host_pathlist_result;"
+            ;;
+        esac
+        ;;
+    esac
+  fi
+}
+# end: func_to_host_pathlist
 
 # func_emit_cwrapperexe_src
 # emit the source code for a wrapper executable on stdout
@@ -4147,23 +3141,31 @@ func_emit_cwrapperexe_src ()
 
    This wrapper executable should never be moved out of the build directory.
    If it is, it will not operate correctly.
+
+   Currently, it simply execs the wrapper *script* "$SHELL $output",
+   but could eventually absorb all of the scripts functionality and
+   exec $objdir/$outputname directly.
 */
 EOF
 	    cat <<"EOF"
-#ifdef _MSC_VER
-# define _CRT_SECURE_NO_DEPRECATE 1
-#endif
 #include <stdio.h>
 #include <stdlib.h>
 #ifdef _MSC_VER
 # include <direct.h>
 # include <process.h>
 # include <io.h>
+# define setmode _setmode
 #else
 # include <unistd.h>
 # include <stdint.h>
 # ifdef __CYGWIN__
 #  include <io.h>
+#  define HAVE_SETENV
+#  ifdef __STRICT_ANSI__
+char *realpath (const char *, char *);
+int putenv (char *);
+int setenv (const char *, const char *, int);
+#  endif
 # endif
 #endif
 #include <malloc.h>
@@ -4175,44 +3177,6 @@ EOF
 #include <fcntl.h>
 #include <sys/stat.h>
 
-/* declarations of non-ANSI functions */
-#if defined(__MINGW32__)
-# ifdef __STRICT_ANSI__
-int _putenv (const char *);
-# endif
-#elif defined(__CYGWIN__)
-# ifdef __STRICT_ANSI__
-char *realpath (const char *, char *);
-int putenv (char *);
-int setenv (const char *, const char *, int);
-# endif
-/* #elif defined (other platforms) ... */
-#endif
-
-/* portability defines, excluding path handling macros */
-#if defined(_MSC_VER)
-# define setmode _setmode
-# define stat    _stat
-# define chmod   _chmod
-# define getcwd  _getcwd
-# define putenv  _putenv
-# define S_IXUSR _S_IEXEC
-# ifndef _INTPTR_T_DEFINED
-#  define _INTPTR_T_DEFINED
-#  define intptr_t int
-# endif
-#elif defined(__MINGW32__)
-# define setmode _setmode
-# define stat    _stat
-# define chmod   _chmod
-# define getcwd  _getcwd
-# define putenv  _putenv
-#elif defined(__CYGWIN__)
-# define HAVE_SETENV
-# define FOPEN_WB "wb"
-/* #elif defined (other platforms) ... */
-#endif
-
 #if defined(PATH_MAX)
 # define LT_PATHMAX PATH_MAX
 #elif defined(MAXPATHLEN)
@@ -4228,7 +3192,14 @@ int setenv (const char *, const char *,
 # define S_IXGRP 0
 #endif
 
-/* path handling portability macros */
+#ifdef _MSC_VER
+# define S_IXUSR _S_IEXEC
+# define stat _stat
+# ifndef _INTPTR_T_DEFINED
+#  define intptr_t int
+# endif
+#endif
+
 #ifndef DIR_SEPARATOR
 # define DIR_SEPARATOR '/'
 # define PATH_SEPARATOR ':'
@@ -4259,6 +3230,10 @@ int setenv (const char *, const char *,
 # define IS_PATH_SEPARATOR(ch) ((ch) == PATH_SEPARATOR_2)
 #endif /* PATH_SEPARATOR_2 */
 
+#ifdef __CYGWIN__
+# define FOPEN_WB "wb"
+#endif
+
 #ifndef FOPEN_WB
 # define FOPEN_WB "w"
 #endif
@@ -4271,13 +3246,22 @@ int setenv (const char *, const char *,
   if (stale) { free ((void *) stale); stale = 0; } \
 } while (0)
 
-#if defined(LT_DEBUGWRAPPER)
-static int lt_debug = 1;
+#undef LTWRAPPER_DEBUGPRINTF
+#if defined DEBUGWRAPPER
+# define LTWRAPPER_DEBUGPRINTF(args) ltwrapper_debugprintf args
+static void
+ltwrapper_debugprintf (const char *fmt, ...)
+{
+    va_list args;
+    va_start (args, fmt);
+    (void) vfprintf (stderr, fmt, args);
+    va_end (args);
+}
 #else
-static int lt_debug = 0;
+# define LTWRAPPER_DEBUGPRINTF(args)
 #endif
 
-const char *program_name = "libtool-wrapper"; /* in case xstrdup fails */
+const char *program_name = NULL;
 
 void *xmalloc (size_t num);
 char *xstrdup (const char *string);
@@ -4287,27 +3271,41 @@ char *chase_symlinks (const char *pathsp
 int make_executable (const char *path);
 int check_executable (const char *path);
 char *strendzap (char *str, const char *pat);
-void lt_debugprintf (const char *file, int line, const char *fmt, ...);
-void lt_fatal (const char *file, int line, const char *message, ...);
-static const char *nonnull (const char *s);
-static const char *nonempty (const char *s);
+void lt_fatal (const char *message, ...);
 void lt_setenv (const char *name, const char *value);
 char *lt_extend_str (const char *orig_value, const char *add, int to_end);
+void lt_opt_process_env_set (const char *arg);
+void lt_opt_process_env_prepend (const char *arg);
+void lt_opt_process_env_append (const char *arg);
+int lt_split_name_value (const char *arg, char** name, char** value);
 void lt_update_exe_path (const char *name, const char *value);
 void lt_update_lib_path (const char *name, const char *value);
-char **prepare_spawn (char **argv);
-void lt_dump_script (FILE *f);
+
+static const char *script_text_part1 =
+EOF
+
+	    func_emit_wrapper_part1 yes |
+	        $SED -e 's/\([\\"]\)/\\\1/g' \
+	             -e 's/^/  "/' -e 's/$/\\n"/'
+	    echo ";"
+	    cat <<EOF
+
+static const char *script_text_part2 =
 EOF
+	    func_emit_wrapper_part2 yes |
+	        $SED -e 's/\([\\"]\)/\\\1/g' \
+	             -e 's/^/  "/' -e 's/$/\\n"/'
+	    echo ";"
 
 	    cat <<EOF
-volatile const char * MAGIC_EXE = "$magic_exe";
+const char * MAGIC_EXE = "$magic_exe";
 const char * LIB_PATH_VARNAME = "$shlibpath_var";
 EOF
 
 	    if test "$shlibpath_overrides_runpath" = yes && test -n "$shlibpath_var" && test -n "$temp_rpath"; then
-              func_to_host_path "$temp_rpath"
+              func_to_host_pathlist "$temp_rpath"
 	      cat <<EOF
-const char * LIB_PATH_VALUE   = "$func_to_host_path_result";
+const char * LIB_PATH_VALUE   = "$func_to_host_pathlist_result";
 EOF
 	    else
 	      cat <<"EOF"
@@ -4316,10 +3314,10 @@ EOF
 	    fi
 
 	    if test -n "$dllsearchpath"; then
-              func_to_host_path "$dllsearchpath:"
+              func_to_host_pathlist "$dllsearchpath:"
 	      cat <<EOF
 const char * EXE_PATH_VARNAME = "PATH";
-const char * EXE_PATH_VALUE   = "$func_to_host_path_result";
+const char * EXE_PATH_VALUE   = "$func_to_host_pathlist_result";
 EOF
 	    else
 	      cat <<"EOF"
@@ -4342,10 +3340,24 @@ EOF
 	    cat <<"EOF"
 
 #define LTWRAPPER_OPTION_PREFIX         "--lt-"
+#define LTWRAPPER_OPTION_PREFIX_LENGTH  5
 
+static const size_t opt_prefix_len         = LTWRAPPER_OPTION_PREFIX_LENGTH;
 static const char *ltwrapper_option_prefix = LTWRAPPER_OPTION_PREFIX;
+
 static const char *dumpscript_opt       = LTWRAPPER_OPTION_PREFIX "dump-script";
-static const char *debug_opt            = LTWRAPPER_OPTION_PREFIX "debug";
+
+static const size_t env_set_opt_len     = LTWRAPPER_OPTION_PREFIX_LENGTH + 7;
+static const char *env_set_opt          = LTWRAPPER_OPTION_PREFIX "env-set";
+  /* argument is putenv-style "foo=bar", value of foo is set to bar */
+
+static const size_t env_prepend_opt_len = LTWRAPPER_OPTION_PREFIX_LENGTH + 11;
+static const char *env_prepend_opt      = LTWRAPPER_OPTION_PREFIX "env-prepend";
+  /* argument is putenv-style "foo=bar", new value of foo is bar${foo} */
+
+static const size_t env_append_opt_len  = LTWRAPPER_OPTION_PREFIX_LENGTH + 10;
+static const char *env_append_opt       = LTWRAPPER_OPTION_PREFIX "env-append";
+  /* argument is putenv-style "foo=bar", new value of foo is ${foo}bar */
 
 int
 main (int argc, char *argv[])
@@ -4362,13 +3374,10 @@ main (int argc, char *argv[])
   int i;
 
   program_name = (char *) xstrdup (base_name (argv[0]));
-  newargz = XMALLOC (char *, argc + 1);
+  LTWRAPPER_DEBUGPRINTF (("(main) argv[0]      : %s\n", argv[0]));
+  LTWRAPPER_DEBUGPRINTF (("(main) program_name : %s\n", program_name));
 
-  /* very simple arg parsing; don't want to rely on getopt
-   * also, copy all non cwrapper options to newargz, except
-   * argz[0], which is handled differently
-   */
-  newargc=0;
+  /* very simple arg parsing; don't want to rely on getopt */
   for (i = 1; i < argc; i++)
     {
       if (strcmp (argv[i], dumpscript_opt) == 0)
@@ -4382,57 +3391,25 @@ EOF
 	      esac
 
 	    cat <<"EOF"
-	  lt_dump_script (stdout);
+	  printf ("%s", script_text_part1);
+	  printf ("%s", script_text_part2);
 	  return 0;
 	}
-      if (strcmp (argv[i], debug_opt) == 0)
-	{
-          lt_debug = 1;
-          continue;
-	}
-      if (strcmp (argv[i], ltwrapper_option_prefix) == 0)
-        {
-          /* however, if there is an option in the LTWRAPPER_OPTION_PREFIX
-             namespace, but it is not one of the ones we know about and
-             have already dealt with, above (inluding dump-script), then
-             report an error. Otherwise, targets might begin to believe
-             they are allowed to use options in the LTWRAPPER_OPTION_PREFIX
-             namespace. The first time any user complains about this, we'll
-             need to make LTWRAPPER_OPTION_PREFIX a configure-time option
-             or a configure.ac-settable value.
-           */
-          lt_fatal (__FILE__, __LINE__,
-		    "unrecognized %s option: '%s'",
-                    ltwrapper_option_prefix, argv[i]);
-        }
-      /* otherwise ... */
-      newargz[++newargc] = xstrdup (argv[i]);
     }
-  newargz[++newargc] = NULL;
-
-EOF
-	    cat <<EOF
-  /* The GNU banner must be the first non-error debug message */
-  lt_debugprintf (__FILE__, __LINE__, "libtool wrapper (GNU $PACKAGE$TIMESTAMP) $VERSION\n");
-EOF
-	    cat <<"EOF"
-  lt_debugprintf (__FILE__, __LINE__, "(main) argv[0]: %s\n", argv[0]);
-  lt_debugprintf (__FILE__, __LINE__, "(main) program_name: %s\n", program_name);
 
+  newargz = XMALLOC (char *, argc + 1);
   tmp_pathspec = find_executable (argv[0]);
   if (tmp_pathspec == NULL)
-    lt_fatal (__FILE__, __LINE__, "couldn't find %s", argv[0]);
-  lt_debugprintf (__FILE__, __LINE__,
-                  "(main) found exe (before symlink chase) at: %s\n",
-		  tmp_pathspec);
+    lt_fatal ("Couldn't find %s", argv[0]);
+  LTWRAPPER_DEBUGPRINTF (("(main) found exe (before symlink chase) at : %s\n",
+			  tmp_pathspec));
 
   actual_cwrapper_path = chase_symlinks (tmp_pathspec);
-  lt_debugprintf (__FILE__, __LINE__,
-                  "(main) found exe (after symlink chase) at: %s\n",
-		  actual_cwrapper_path);
+  LTWRAPPER_DEBUGPRINTF (("(main) found exe (after symlink chase) at : %s\n",
+			  actual_cwrapper_path));
   XFREE (tmp_pathspec);
 
-  actual_cwrapper_name = xstrdup (base_name (actual_cwrapper_path));
+  actual_cwrapper_name = xstrdup( base_name (actual_cwrapper_path));
   strendzap (actual_cwrapper_path, actual_cwrapper_name);
 
   /* wrapper name transforms */
@@ -4450,9 +3427,8 @@ EOF
   target_name = tmp_pathspec;
   tmp_pathspec = 0;
 
-  lt_debugprintf (__FILE__, __LINE__,
-		  "(main) libtool target name: %s\n",
-		  target_name);
+  LTWRAPPER_DEBUGPRINTF (("(main) libtool target name: %s\n",
+			  target_name));
 EOF
 
 	    cat <<EOF
@@ -4502,19 +3478,80 @@ EOF
 
   lt_setenv ("BIN_SH", "xpg4"); /* for Tru64 */
   lt_setenv ("DUALCASE", "1");  /* for MSK sh */
-  /* Update the DLL searchpath.  EXE_PATH_VALUE ($dllsearchpath) must
-     be prepended before (that is, appear after) LIB_PATH_VALUE ($temp_rpath)
-     because on Windows, both *_VARNAMEs are PATH but uninstalled
-     libraries must come first. */
-  lt_update_exe_path (EXE_PATH_VARNAME, EXE_PATH_VALUE);
   lt_update_lib_path (LIB_PATH_VARNAME, LIB_PATH_VALUE);
+  lt_update_exe_path (EXE_PATH_VARNAME, EXE_PATH_VALUE);
+
+  newargc=0;
+  for (i = 1; i < argc; i++)
+    {
+      if (strncmp (argv[i], env_set_opt, env_set_opt_len) == 0)
+        {
+          if (argv[i][env_set_opt_len] == '=')
+            {
+              const char *p = argv[i] + env_set_opt_len + 1;
+              lt_opt_process_env_set (p);
+            }
+          else if (argv[i][env_set_opt_len] == '\0' && i + 1 < argc)
+            {
+              lt_opt_process_env_set (argv[++i]); /* don't copy */
+            }
+          else
+            lt_fatal ("%s missing required argument", env_set_opt);
+          continue;
+        }
+      if (strncmp (argv[i], env_prepend_opt, env_prepend_opt_len) == 0)
+        {
+          if (argv[i][env_prepend_opt_len] == '=')
+            {
+              const char *p = argv[i] + env_prepend_opt_len + 1;
+              lt_opt_process_env_prepend (p);
+            }
+          else if (argv[i][env_prepend_opt_len] == '\0' && i + 1 < argc)
+            {
+              lt_opt_process_env_prepend (argv[++i]); /* don't copy */
+            }
+          else
+            lt_fatal ("%s missing required argument", env_prepend_opt);
+          continue;
+        }
+      if (strncmp (argv[i], env_append_opt, env_append_opt_len) == 0)
+        {
+          if (argv[i][env_append_opt_len] == '=')
+            {
+              const char *p = argv[i] + env_append_opt_len + 1;
+              lt_opt_process_env_append (p);
+            }
+          else if (argv[i][env_append_opt_len] == '\0' && i + 1 < argc)
+            {
+              lt_opt_process_env_append (argv[++i]); /* don't copy */
+            }
+          else
+            lt_fatal ("%s missing required argument", env_append_opt);
+          continue;
+        }
+      if (strncmp (argv[i], ltwrapper_option_prefix, opt_prefix_len) == 0)
+        {
+          /* however, if there is an option in the LTWRAPPER_OPTION_PREFIX
+             namespace, but it is not one of the ones we know about and
+             have already dealt with, above (inluding dump-script), then
+             report an error. Otherwise, targets might begin to believe
+             they are allowed to use options in the LTWRAPPER_OPTION_PREFIX
+             namespace. The first time any user complains about this, we'll
+             need to make LTWRAPPER_OPTION_PREFIX a configure-time option
+             or a configure.ac-settable value.
+           */
+          lt_fatal ("Unrecognized option in %s namespace: '%s'",
+                    ltwrapper_option_prefix, argv[i]);
+        }
+      /* otherwise ... */
+      newargz[++newargc] = xstrdup (argv[i]);
+    }
+  newargz[++newargc] = NULL;
 
-  lt_debugprintf (__FILE__, __LINE__, "(main) lt_argv_zero: %s\n",
-		  nonnull (lt_argv_zero));
+  LTWRAPPER_DEBUGPRINTF     (("(main) lt_argv_zero : %s\n", (lt_argv_zero ? lt_argv_zero : "<NULL>")));
   for (i = 0; i < newargc; i++)
     {
-      lt_debugprintf (__FILE__, __LINE__, "(main) newargz[%d]: %s\n",
-		      i, nonnull (newargz[i]));
+      LTWRAPPER_DEBUGPRINTF (("(main) newargz[%d]   : %s\n", i, (newargz[i] ? newargz[i] : "<NULL>")));
     }
 
 EOF
@@ -4523,14 +3560,11 @@ EOF
 	      mingw*)
 		cat <<"EOF"
   /* execv doesn't actually work on mingw as expected on unix */
-  newargz = prepare_spawn (newargz);
   rval = _spawnv (_P_WAIT, lt_argv_zero, (const char * const *) newargz);
   if (rval == -1)
     {
       /* failed to start process */
-      lt_debugprintf (__FILE__, __LINE__,
-		      "(main) failed to launch target \"%s\": %s\n",
-		      lt_argv_zero, nonnull (strerror (errno)));
+      LTWRAPPER_DEBUGPRINTF (("(main) failed to launch target \"%s\": errno = %d\n", lt_argv_zero, errno));
       return 127;
     }
   return rval;
@@ -4552,7 +3586,7 @@ xmalloc (size_t num)
 {
   void *p = (void *) malloc (num);
   if (!p)
-    lt_fatal (__FILE__, __LINE__, "memory exhausted");
+    lt_fatal ("Memory exhausted");
 
   return p;
 }
@@ -4586,8 +3620,8 @@ check_executable (const char *path)
 {
   struct stat st;
 
-  lt_debugprintf (__FILE__, __LINE__, "(check_executable): %s\n",
-                  nonempty (path));
+  LTWRAPPER_DEBUGPRINTF (("(check_executable)  : %s\n",
+			  path ? (*path ? path : "EMPTY!") : "NULL!"));
   if ((!path) || (!*path))
     return 0;
 
@@ -4604,8 +3638,8 @@ make_executable (const char *path)
   int rval = 0;
   struct stat st;
 
-  lt_debugprintf (__FILE__, __LINE__, "(make_executable): %s\n",
-                  nonempty (path));
+  LTWRAPPER_DEBUGPRINTF (("(make_executable)   : %s\n",
+			  path ? (*path ? path : "EMPTY!") : "NULL!"));
   if ((!path) || (!*path))
     return 0;
 
@@ -4631,8 +3665,8 @@ find_executable (const char *wrapper)
   int tmp_len;
   char *concat_name;
 
-  lt_debugprintf (__FILE__, __LINE__, "(find_executable): %s\n",
-                  nonempty (wrapper));
+  LTWRAPPER_DEBUGPRINTF (("(find_executable)   : %s\n",
+			  wrapper ? (*wrapper ? wrapper : "EMPTY!") : "NULL!"));
 
   if ((wrapper == NULL) || (*wrapper == '\0'))
     return NULL;
@@ -4685,8 +3719,7 @@ find_executable (const char *wrapper)
 		{
 		  /* empty path: current directory */
 		  if (getcwd (tmp, LT_PATHMAX) == NULL)
-		    lt_fatal (__FILE__, __LINE__, "getcwd failed: %s",
-                              nonnull (strerror (errno)));
+		    lt_fatal ("getcwd failed");
 		  tmp_len = strlen (tmp);
 		  concat_name =
 		    XMALLOC (char, tmp_len + 1 + strlen (wrapper) + 1);
@@ -4711,8 +3744,7 @@ find_executable (const char *wrapper)
     }
   /* Relative path | not found in path: prepend cwd */
   if (getcwd (tmp, LT_PATHMAX) == NULL)
-    lt_fatal (__FILE__, __LINE__, "getcwd failed: %s",
-              nonnull (strerror (errno)));
+    lt_fatal ("getcwd failed");
   tmp_len = strlen (tmp);
   concat_name = XMALLOC (char, tmp_len + 1 + strlen (wrapper) + 1);
   memcpy (concat_name, tmp, tmp_len);
@@ -4738,9 +3770,8 @@ chase_symlinks (const char *pathspec)
   int has_symlinks = 0;
   while (strlen (tmp_pathspec) && !has_symlinks)
     {
-      lt_debugprintf (__FILE__, __LINE__,
-		      "checking path component for symlinks: %s\n",
-		      tmp_pathspec);
+      LTWRAPPER_DEBUGPRINTF (("checking path component for symlinks: %s\n",
+			      tmp_pathspec));
       if (lstat (tmp_pathspec, &s) == 0)
 	{
 	  if (S_ISLNK (s.st_mode) != 0)
@@ -4762,9 +3793,8 @@ chase_symlinks (const char *pathspec)
 	}
       else
 	{
-	  lt_fatal (__FILE__, __LINE__,
-		    "error accessing file \"%s\": %s",
-		    tmp_pathspec, nonnull (strerror (errno)));
+	  char *errstr = strerror (errno);
+	  lt_fatal ("Error accessing file %s (%s)", tmp_pathspec, errstr);
 	}
     }
   XFREE (tmp_pathspec);
@@ -4777,8 +3807,7 @@ chase_symlinks (const char *pathspec)
   tmp_pathspec = realpath (pathspec, buf);
   if (tmp_pathspec == 0)
     {
-      lt_fatal (__FILE__, __LINE__,
-		"could not follow symlinks for %s", pathspec);
+      lt_fatal ("Could not follow symlinks for %s", pathspec);
     }
   return xstrdup (tmp_pathspec);
 #endif
@@ -4804,25 +3833,11 @@ strendzap (char *str, const char *pat)
   return str;
 }
 
-void
-lt_debugprintf (const char *file, int line, const char *fmt, ...)
-{
-  va_list args;
-  if (lt_debug)
-    {
-      (void) fprintf (stderr, "%s:%s:%d: ", program_name, file, line);
-      va_start (args, fmt);
-      (void) vfprintf (stderr, fmt, args);
-      va_end (args);
-    }
-}
-
 static void
-lt_error_core (int exit_status, const char *file,
-	       int line, const char *mode,
+lt_error_core (int exit_status, const char *mode,
 	       const char *message, va_list ap)
 {
-  fprintf (stderr, "%s:%s:%d: %s: ", program_name, file, line, mode);
+  fprintf (stderr, "%s: %s: ", program_name, mode);
   vfprintf (stderr, message, ap);
   fprintf (stderr, ".\n");
 
@@ -4831,32 +3846,20 @@ lt_error_core (int exit_status, const ch
 }
 
 void
-lt_fatal (const char *file, int line, const char *message, ...)
+lt_fatal (const char *message, ...)
 {
   va_list ap;
   va_start (ap, message);
-  lt_error_core (EXIT_FAILURE, file, line, "FATAL", message, ap);
+  lt_error_core (EXIT_FAILURE, "FATAL", message, ap);
   va_end (ap);
 }
 
-static const char *
-nonnull (const char *s)
-{
-  return s ? s : "(null)";
-}
-
-static const char *
-nonempty (const char *s)
-{
-  return (s && !*s) ? "(empty)" : nonnull (s);
-}
-
 void
 lt_setenv (const char *name, const char *value)
 {
-  lt_debugprintf (__FILE__, __LINE__,
-		  "(lt_setenv) setting '%s' to '%s'\n",
-                  nonnull (name), nonnull (value));
+  LTWRAPPER_DEBUGPRINTF (("(lt_setenv) setting '%s' to '%s'\n",
+                          (name ? name : "<NULL>"),
+                          (value ? value : "<NULL>")));
   {
 #ifdef HAVE_SETENV
     /* always make a copy, for consistency with !HAVE_SETENV */
@@ -4901,12 +3904,95 @@ lt_extend_str (const char *orig_value, c
   return new_value;
 }
 
+int
+lt_split_name_value (const char *arg, char** name, char** value)
+{
+  const char *p;
+  int len;
+  if (!arg || !*arg)
+    return 1;
+
+  p = strchr (arg, (int)'=');
+
+  if (!p)
+    return 1;
+
+  *value = xstrdup (++p);
+
+  len = strlen (arg) - strlen (*value);
+  *name = XMALLOC (char, len);
+  strncpy (*name, arg, len-1);
+  (*name)[len - 1] = '\0';
+
+  return 0;
+}
+
+void
+lt_opt_process_env_set (const char *arg)
+{
+  char *name = NULL;
+  char *value = NULL;
+
+  if (lt_split_name_value (arg, &name, &value) != 0)
+    {
+      XFREE (name);
+      XFREE (value);
+      lt_fatal ("bad argument for %s: '%s'", env_set_opt, arg);
+    }
+
+  lt_setenv (name, value);
+  XFREE (name);
+  XFREE (value);
+}
+
+void
+lt_opt_process_env_prepend (const char *arg)
+{
+  char *name = NULL;
+  char *value = NULL;
+  char *new_value = NULL;
+
+  if (lt_split_name_value (arg, &name, &value) != 0)
+    {
+      XFREE (name);
+      XFREE (value);
+      lt_fatal ("bad argument for %s: '%s'", env_prepend_opt, arg);
+    }
+
+  new_value = lt_extend_str (getenv (name), value, 0);
+  lt_setenv (name, new_value);
+  XFREE (new_value);
+  XFREE (name);
+  XFREE (value);
+}
+
+void
+lt_opt_process_env_append (const char *arg)
+{
+  char *name = NULL;
+  char *value = NULL;
+  char *new_value = NULL;
+
+  if (lt_split_name_value (arg, &name, &value) != 0)
+    {
+      XFREE (name);
+      XFREE (value);
+      lt_fatal ("bad argument for %s: '%s'", env_append_opt, arg);
+    }
+
+  new_value = lt_extend_str (getenv (name), value, 1);
+  lt_setenv (name, new_value);
+  XFREE (new_value);
+  XFREE (name);
+  XFREE (value);
+}
+
 void
 lt_update_exe_path (const char *name, const char *value)
 {
-  lt_debugprintf (__FILE__, __LINE__,
-		  "(lt_update_exe_path) modifying '%s' by prepending '%s'\n",
-                  nonnull (name), nonnull (value));
+  LTWRAPPER_DEBUGPRINTF (("(lt_update_exe_path) modifying '%s' by prepending '%s'\n",
+                          (name ? name : "<NULL>"),
+                          (value ? value : "<NULL>")));
 
   if (name && *name && value && *value)
     {
@@ -4925,9 +4011,9 @@ lt_update_exe_path (const char *name, co
 void
 lt_update_lib_path (const char *name, const char *value)
 {
-  lt_debugprintf (__FILE__, __LINE__,
-		  "(lt_update_lib_path) modifying '%s' by prepending '%s'\n",
-                  nonnull (name), nonnull (value));
+  LTWRAPPER_DEBUGPRINTF (("(lt_update_lib_path) modifying '%s' by prepending '%s'\n",
+                          (name ? name : "<NULL>"),
+                          (value ? value : "<NULL>")));
 
   if (name && *name && value && *value)
     {
@@ -4937,158 +4023,11 @@ lt_update_lib_path (const char *name, co
     }
 }
 
-EOF
-	    case $host_os in
-	      mingw*)
-		cat <<"EOF"
-
-/* Prepares an argument vector before calling spawn().
-   Note that spawn() does not by itself call the command interpreter
-     (getenv ("COMSPEC") != NULL ? getenv ("COMSPEC") :
-      ({ OSVERSIONINFO v; v.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
-         GetVersionEx(&v);
-         v.dwPlatformId == VER_PLATFORM_WIN32_NT;
-      }) ? "cmd.exe" : "command.com").
-   Instead it simply concatenates the arguments, separated by ' ', and calls
-   CreateProcess().  We must quote the arguments since Win32 CreateProcess()
-   interprets characters like ' ', '\t', '\\', '"' (but not '<' and '>') in a
-   special way:
-   - Space and tab are interpreted as delimiters. They are not treated as
-     delimiters if they are surrounded by double quotes: "...".
-   - Unescaped double quotes are removed from the input. Their only effect is
-     that within double quotes, space and tab are treated like normal
-     characters.
-   - Backslashes not followed by double quotes are not special.
-   - But 2*n+1 backslashes followed by a double quote become
-     n backslashes followed by a double quote (n >= 0):
-       \" -> "
-       \\\" -> \"
-       \\\\\" -> \\"
- */
-#define SHELL_SPECIAL_CHARS "\"\\ \001\002\003\004\005\006\007\010\011\012\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"
-#define SHELL_SPACE_CHARS " \001\002\003\004\005\006\007\010\011\012\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"
-char **
-prepare_spawn (char **argv)
-{
-  size_t argc;
-  char **new_argv;
-  size_t i;
-
-  /* Count number of arguments.  */
-  for (argc = 0; argv[argc] != NULL; argc++)
-    ;
-
-  /* Allocate new argument vector.  */
-  new_argv = XMALLOC (char *, argc + 1);
-
-  /* Put quoted arguments into the new argument vector.  */
-  for (i = 0; i < argc; i++)
-    {
-      const char *string = argv[i];
-
-      if (string[0] == '\0')
-	new_argv[i] = xstrdup ("\"\"");
-      else if (strpbrk (string, SHELL_SPECIAL_CHARS) != NULL)
-	{
-	  int quote_around = (strpbrk (string, SHELL_SPACE_CHARS) != NULL);
-	  size_t length;
-	  unsigned int backslashes;
-	  const char *s;
-	  char *quoted_string;
-	  char *p;
-
-	  length = 0;
-	  backslashes = 0;
-	  if (quote_around)
-	    length++;
-	  for (s = string; *s != '\0'; s++)
-	    {
-	      char c = *s;
-	      if (c == '"')
-		length += backslashes + 1;
-	      length++;
-	      if (c == '\\')
-		backslashes++;
-	      else
-		backslashes = 0;
-	    }
-	  if (quote_around)
-	    length += backslashes + 1;
-
-	  quoted_string = XMALLOC (char, length + 1);
-
-	  p = quoted_string;
-	  backslashes = 0;
-	  if (quote_around)
-	    *p++ = '"';
-	  for (s = string; *s != '\0'; s++)
-	    {
-	      char c = *s;
-	      if (c == '"')
-		{
-		  unsigned int j;
-		  for (j = backslashes + 1; j > 0; j--)
-		    *p++ = '\\';
-		}
-	      *p++ = c;
-	      if (c == '\\')
-		backslashes++;
-	      else
-		backslashes = 0;
-	    }
-	  if (quote_around)
-	    {
-	      unsigned int j;
-	      for (j = backslashes; j > 0; j--)
-		*p++ = '\\';
-	      *p++ = '"';
-	    }
-	  *p = '\0';
-
-	  new_argv[i] = quoted_string;
-	}
-      else
-	new_argv[i] = (char *) string;
-    }
-  new_argv[argc] = NULL;
-
-  return new_argv;
-}
-EOF
-		;;
-	    esac
 
-            cat <<"EOF"
-void lt_dump_script (FILE* f)
-{
-EOF
-	    func_emit_wrapper yes |
-	      $SED -n -e '
-s/^\(.\{79\}\)\(..*\)/\1\
-\2/
-h
-s/\([\\"]\)/\\\1/g
-s/$/\\n/
-s/\([^\n]*\).*/  fputs ("\1", f);/p
-g
-D'
-            cat <<"EOF"
-}
 EOF
 }
 # end: func_emit_cwrapperexe_src
 
-# func_win32_import_lib_p ARG
-# True if ARG is an import lib, as indicated by $file_magic_cmd
-func_win32_import_lib_p ()
-{
-    $opt_debug
-    case `eval $file_magic_cmd \"\$1\" 2>/dev/null | $SED -e 10q` in
-    *import*) : ;;
-    *) false ;;
-    esac
-}
-
 # func_mode_link arg...
 func_mode_link ()
 {
@@ -5133,7 +4072,6 @@ func_mode_link ()
     new_inherited_linker_flags=
 
     avoid_version=no
-    bindir=
     dlfiles=
     dlprefiles=
     dlself=no
@@ -5226,11 +4164,6 @@ func_mode_link ()
 	esac
 
 	case $prev in
-	bindir)
-	  bindir="$arg"
-	  prev=
-	  continue
-	  ;;
 	dlfiles|dlprefiles)
 	  if test "$preload" = no; then
 	    # Add the symbol object into the linking commands.
@@ -5262,9 +4195,9 @@ func_mode_link ()
 	    ;;
 	  *)
 	    if test "$prev" = dlfiles; then
-	      func_append dlfiles " $arg"
+	      dlfiles="$dlfiles $arg"
 	    else
-	      func_append dlprefiles " $arg"
+	      dlprefiles="$dlprefiles $arg"
 	    fi
 	    prev=
 	    continue
@@ -5288,7 +4221,7 @@ func_mode_link ()
 	    *-*-darwin*)
 	      case "$deplibs " in
 		*" $qarg.ltframework "*) ;;
-		*) func_append deplibs " $qarg.ltframework" # this is fixed later
+		*) deplibs="$deplibs $qarg.ltframework" # this is fixed later
 		   ;;
 	      esac
 	      ;;
@@ -5307,7 +4240,7 @@ func_mode_link ()
 	    moreargs=
 	    for fil in `cat "$save_arg"`
 	    do
-#	      func_append moreargs " $fil"
+#	      moreargs="$moreargs $fil"
 	      arg=$fil
 	      # A libtool-controlled object.
 
@@ -5336,7 +4269,7 @@ func_mode_link ()
 
 		  if test "$prev" = dlfiles; then
 		    if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
-		      func_append dlfiles " $pic_object"
+		      dlfiles="$dlfiles $pic_object"
 		      prev=
 		      continue
 		    else
@@ -5348,7 +4281,7 @@ func_mode_link ()
 		  # CHECK ME:  I think I busted this.  -Ossama
 		  if test "$prev" = dlprefiles; then
 		    # Preload the old-style object.
-		    func_append dlprefiles " $pic_object"
+		    dlprefiles="$dlprefiles $pic_object"
 		    prev=
 		  fi
 
@@ -5418,12 +4351,12 @@ func_mode_link ()
 	  if test "$prev" = rpath; then
 	    case "$rpath " in
 	    *" $arg "*) ;;
-	    *) func_append rpath " $arg" ;;
+	    *) rpath="$rpath $arg" ;;
 	    esac
 	  else
 	    case "$xrpath " in
 	    *" $arg "*) ;;
-	    *) func_append xrpath " $arg" ;;
+	    *) xrpath="$xrpath $arg" ;;
 	    esac
 	  fi
 	  prev=
@@ -5435,28 +4368,28 @@ func_mode_link ()
 	  continue
 	  ;;
 	weak)
-	  func_append weak_libs " $arg"
+	  weak_libs="$weak_libs $arg"
 	  prev=
 	  continue
 	  ;;
 	xcclinker)
-	  func_append linker_flags " $qarg"
-	  func_append compiler_flags " $qarg"
+	  linker_flags="$linker_flags $qarg"
+	  compiler_flags="$compiler_flags $qarg"
 	  prev=
 	  func_append compile_command " $qarg"
 	  func_append finalize_command " $qarg"
 	  continue
 	  ;;
 	xcompiler)
-	  func_append compiler_flags " $qarg"
+	  compiler_flags="$compiler_flags $qarg"
 	  prev=
 	  func_append compile_command " $qarg"
 	  func_append finalize_command " $qarg"
 	  continue
 	  ;;
 	xlinker)
-	  func_append linker_flags " $qarg"
-	  func_append compiler_flags " $wl$qarg"
+	  linker_flags="$linker_flags $qarg"
+	  compiler_flags="$compiler_flags $wl$qarg"
 	  prev=
 	  func_append compile_command " $wl$qarg"
 	  func_append finalize_command " $wl$qarg"
@@ -5492,11 +4425,6 @@ func_mode_link ()
 	continue
 	;;
 
-      -bindir)
-	prev=bindir
-	continue
-	;;
-
       -dlopen)
 	prev=dlfiles
 	continue
@@ -5547,16 +4475,15 @@ func_mode_link ()
 	;;
 
       -L*)
-	func_stripname "-L" '' "$arg"
-	if test -z "$func_stripname_result"; then
+	func_stripname '-L' '' "$arg"
+	dir=$func_stripname_result
+	if test -z "$dir"; then
 	  if test "$#" -gt 0; then
 	    func_fatal_error "require no space between \`-L' and \`$1'"
 	  else
 	    func_fatal_error "need path for \`-L' option"
 	  fi
 	fi
-	func_resolve_sysroot "$func_stripname_result"
-	dir=$func_resolve_sysroot_result
 	# We need an absolute path.
 	case $dir in
 	[\\/]* | [A-Za-z]:[\\/]*) ;;
@@ -5568,30 +4495,24 @@ func_mode_link ()
 	  ;;
 	esac
 	case "$deplibs " in
-	*" -L$dir "* | *" $arg "*)
-	  # Will only happen for absolute or sysroot arguments
-	  ;;
+	*" -L$dir "*) ;;
 	*)
-	  # Preserve sysroot, but never include relative directories
-	  case $dir in
-	    [\\/]* | [A-Za-z]:[\\/]* | =*) func_append deplibs " $arg" ;;
-	    *) func_append deplibs " -L$dir" ;;
-	  esac
-	  func_append lib_search_path " $dir"
+	  deplibs="$deplibs -L$dir"
+	  lib_search_path="$lib_search_path $dir"
 	  ;;
 	esac
 	case $host in
 	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2* | *-cegcc*)
-	  testbindir=`$ECHO "$dir" | $SED 's*/lib$*/bin*'`
+	  testbindir=`$ECHO "X$dir" | $Xsed -e 's*/lib$*/bin*'`
 	  case :$dllsearchpath: in
 	  *":$dir:"*) ;;
 	  ::) dllsearchpath=$dir;;
-	  *) func_append dllsearchpath ":$dir";;
+	  *) dllsearchpath="$dllsearchpath:$dir";;
 	  esac
 	  case :$dllsearchpath: in
 	  *":$testbindir:"*) ;;
 	  ::) dllsearchpath=$testbindir;;
-	  *) func_append dllsearchpath ":$testbindir";;
+	  *) dllsearchpath="$dllsearchpath:$testbindir";;
 	  esac
 	  ;;
 	esac
@@ -5615,7 +4536,7 @@ func_mode_link ()
 	    ;;
 	  *-*-rhapsody* | *-*-darwin1.[012])
 	    # Rhapsody C and math libraries are in the System framework
-	    func_append deplibs " System.ltframework"
+	    deplibs="$deplibs System.ltframework"
 	    continue
 	    ;;
 	  *-*-sco3.2v5* | *-*-sco5v6*)
@@ -5635,7 +4556,7 @@ func_mode_link ()
 	   ;;
 	 esac
 	fi
-	func_append deplibs " $arg"
+	deplibs="$deplibs $arg"
 	continue
 	;;
 
@@ -5647,22 +4568,21 @@ func_mode_link ()
       # Tru64 UNIX uses -model [arg] to determine the layout of C++
       # classes, name mangling, and exception handling.
       # Darwin uses the -arch flag to determine output architecture.
-      -model|-arch|-isysroot|--sysroot)
-	func_append compiler_flags " $arg"
+      -model|-arch|-isysroot)
+	compiler_flags="$compiler_flags $arg"
 	func_append compile_command " $arg"
 	func_append finalize_command " $arg"
 	prev=xcompiler
 	continue
 	;;
 
-      -mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe \
-      |-threads|-fopenmp|-openmp|-mp|-xopenmp|-omp|-qsmp=*)
-	func_append compiler_flags " $arg"
+      -mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe|-threads)
+	compiler_flags="$compiler_flags $arg"
 	func_append compile_command " $arg"
 	func_append finalize_command " $arg"
 	case "$new_inherited_linker_flags " in
 	    *" $arg "*) ;;
-	    * ) func_append new_inherited_linker_flags " $arg" ;;
+	    * ) new_inherited_linker_flags="$new_inherited_linker_flags $arg" ;;
 	esac
 	continue
 	;;
@@ -5729,17 +4649,13 @@ func_mode_link ()
 	# We need an absolute path.
 	case $dir in
 	[\\/]* | [A-Za-z]:[\\/]*) ;;
-	=*)
-	  func_stripname '=' '' "$dir"
-	  dir=$lt_sysroot$func_stripname_result
-	  ;;
 	*)
 	  func_fatal_error "only absolute run-paths are allowed"
 	  ;;
 	esac
 	case "$xrpath " in
 	*" $dir "*) ;;
-	*) func_append xrpath " $dir" ;;
+	*) xrpath="$xrpath $dir" ;;
 	esac
 	continue
 	;;
@@ -5792,8 +4708,8 @@ func_mode_link ()
 	for flag in $args; do
 	  IFS="$save_ifs"
           func_quote_for_eval "$flag"
-	  func_append arg " $func_quote_for_eval_result"
-	  func_append compiler_flags " $func_quote_for_eval_result"
+	  arg="$arg $wl$func_quote_for_eval_result"
+	  compiler_flags="$compiler_flags $func_quote_for_eval_result"
 	done
 	IFS="$save_ifs"
 	func_stripname ' ' '' "$arg"
@@ -5808,9 +4724,9 @@ func_mode_link ()
 	for flag in $args; do
 	  IFS="$save_ifs"
           func_quote_for_eval "$flag"
-	  func_append arg " $wl$func_quote_for_eval_result"
-	  func_append compiler_flags " $wl$func_quote_for_eval_result"
-	  func_append linker_flags " $func_quote_for_eval_result"
+	  arg="$arg $wl$func_quote_for_eval_result"
+	  compiler_flags="$compiler_flags $wl$func_quote_for_eval_result"
+	  linker_flags="$linker_flags $func_quote_for_eval_result"
 	done
 	IFS="$save_ifs"
 	func_stripname ' ' '' "$arg"
@@ -5838,27 +4754,23 @@ func_mode_link ()
 	arg="$func_quote_for_eval_result"
 	;;
 
-      # Flags to be passed through unchanged, with rationale:
-      # -64, -mips[0-9]      enable 64-bit mode for the SGI compiler
-      # -r[0-9][0-9]*        specify processor for the SGI compiler
-      # -xarch=*, -xtarget=* enable 64-bit mode for the Sun compiler
-      # +DA*, +DD*           enable 64-bit mode for the HP compiler
-      # -q*                  compiler args for the IBM compiler
-      # -m*, -t[45]*, -txscale* architecture-specific flags for GCC
-      # -F/path              path to uninstalled frameworks, gcc on darwin
-      # -p, -pg, --coverage, -fprofile-*  profiling flags for GCC
-      # @file                GCC response files
-      # -tp=*                Portland pgcc target processor selection
-      # --sysroot=*          for sysroot support
-      # -O*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time optimization
+      # -64, -mips[0-9] enable 64-bit mode on the SGI compiler
+      # -r[0-9][0-9]* specifies the processor on the SGI compiler
+      # -xarch=*, -xtarget=* enable 64-bit mode on the Sun compiler
+      # +DA*, +DD* enable 64-bit mode on the HP compiler
+      # -q* pass through compiler args for the IBM compiler
+      # -m*, -t[45]*, -txscale* pass through architecture-specific
+      # compiler args for GCC
+      # -F/path gives path to uninstalled frameworks, gcc on darwin
+      # -p, -pg, --coverage, -fprofile-* pass through profiling flag for GCC
+      # @file GCC response files
       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
-      -O*|-flto*|-fwhopr*|-fuse-linker-plugin)
+      -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*)
         func_quote_for_eval "$arg"
 	arg="$func_quote_for_eval_result"
         func_append compile_command " $arg"
         func_append finalize_command " $arg"
-        func_append compiler_flags " $arg"
+        compiler_flags="$compiler_flags $arg"
         continue
         ;;
 
@@ -5870,7 +4782,7 @@ func_mode_link ()
 
       *.$objext)
 	# A standard object.
-	func_append objs " $arg"
+	objs="$objs $arg"
 	;;
 
       *.lo)
@@ -5901,7 +4813,7 @@ func_mode_link ()
 
 	    if test "$prev" = dlfiles; then
 	      if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
-		func_append dlfiles " $pic_object"
+		dlfiles="$dlfiles $pic_object"
 		prev=
 		continue
 	      else
@@ -5913,7 +4825,7 @@ func_mode_link ()
 	    # CHECK ME:  I think I busted this.  -Ossama
 	    if test "$prev" = dlprefiles; then
 	      # Preload the old-style object.
-	      func_append dlprefiles " $pic_object"
+	      dlprefiles="$dlprefiles $pic_object"
 	      prev=
 	    fi
 
@@ -5958,25 +4870,24 @@ func_mode_link ()
 
       *.$libext)
 	# An archive.
-	func_append deplibs " $arg"
-	func_append old_deplibs " $arg"
+	deplibs="$deplibs $arg"
+	old_deplibs="$old_deplibs $arg"
 	continue
 	;;
 
       *.la)
 	# A libtool-controlled library.
 
-	func_resolve_sysroot "$arg"
 	if test "$prev" = dlfiles; then
 	  # This library was specified with -dlopen.
-	  func_append dlfiles " $func_resolve_sysroot_result"
+	  dlfiles="$dlfiles $arg"
 	  prev=
 	elif test "$prev" = dlprefiles; then
 	  # The library was specified with -dlpreopen.
-	  func_append dlprefiles " $func_resolve_sysroot_result"
+	  dlprefiles="$dlprefiles $arg"
 	  prev=
 	else
-	  func_append deplibs " $func_resolve_sysroot_result"
+	  deplibs="$deplibs $arg"
 	fi
 	continue
 	;;
@@ -6014,7 +4925,7 @@ func_mode_link ()
 
     if test -n "$shlibpath_var"; then
       # get the directories listed in $shlibpath_var
-      eval shlib_search_path=\`\$ECHO \"\${$shlibpath_var}\" \| \$SED \'s/:/ /g\'\`
+      eval shlib_search_path=\`\$ECHO \"X\${$shlibpath_var}\" \| \$Xsed -e \'s/:/ /g\'\`
     else
       shlib_search_path=
     fi
@@ -6023,8 +4934,6 @@ func_mode_link ()
 
     func_dirname "$output" "/" ""
     output_objdir="$func_dirname_result$objdir"
-    func_to_tool_file "$output_objdir/"
-    tool_output_objdir=$func_to_tool_file_result
     # Create the object directory.
     func_mkdir_p "$output_objdir"
 
@@ -6045,12 +4954,12 @@ func_mode_link ()
     # Find all interdependent deplibs by searching for libraries
     # that are linked more than once (e.g. -la -lb -la)
     for deplib in $deplibs; do
-      if $opt_preserve_dup_deps ; then
+      if $opt_duplicate_deps ; then
 	case "$libs " in
-	*" $deplib "*) func_append specialdeplibs " $deplib" ;;
+	*" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
 	esac
       fi
-      func_append libs " $deplib"
+      libs="$libs $deplib"
     done
 
     if test "$linkmode" = lib; then
@@ -6063,9 +4972,9 @@ func_mode_link ()
       if $opt_duplicate_compiler_generated_deps; then
 	for pre_post_dep in $predeps $postdeps; do
 	  case "$pre_post_deps " in
-	  *" $pre_post_dep "*) func_append specialdeplibs " $pre_post_deps" ;;
+	  *" $pre_post_dep "*) specialdeplibs="$specialdeplibs $pre_post_deps" ;;
 	  esac
-	  func_append pre_post_deps " $pre_post_dep"
+	  pre_post_deps="$pre_post_deps $pre_post_dep"
 	done
       fi
       pre_post_deps=
@@ -6132,19 +5041,17 @@ func_mode_link ()
 	for lib in $dlprefiles; do
 	  # Ignore non-libtool-libs
 	  dependency_libs=
-	  func_resolve_sysroot "$lib"
 	  case $lib in
-	  *.la)	func_source "$func_resolve_sysroot_result" ;;
+	  *.la)	func_source "$lib" ;;
 	  esac
 
 	  # Collect preopened libtool deplibs, except any this library
 	  # has declared as weak libs
 	  for deplib in $dependency_libs; do
-	    func_basename "$deplib"
-            deplib_base=$func_basename_result
+            deplib_base=`$ECHO "X$deplib" | $Xsed -e "$basename"`
 	    case " $weak_libs " in
 	    *" $deplib_base "*) ;;
-	    *) func_append deplibs " $deplib" ;;
+	    *) deplibs="$deplibs $deplib" ;;
 	    esac
 	  done
 	done
@@ -6160,17 +5067,16 @@ func_mode_link ()
 	lib=
 	found=no
 	case $deplib in
-	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe \
-        |-threads|-fopenmp|-openmp|-mp|-xopenmp|-omp|-qsmp=*)
+	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe|-threads)
 	  if test "$linkmode,$pass" = "prog,link"; then
 	    compile_deplibs="$deplib $compile_deplibs"
 	    finalize_deplibs="$deplib $finalize_deplibs"
 	  else
-	    func_append compiler_flags " $deplib"
+	    compiler_flags="$compiler_flags $deplib"
 	    if test "$linkmode" = lib ; then
 		case "$new_inherited_linker_flags " in
 		    *" $deplib "*) ;;
-		    * ) func_append new_inherited_linker_flags " $deplib" ;;
+		    * ) new_inherited_linker_flags="$new_inherited_linker_flags $deplib" ;;
 		esac
 	    fi
 	  fi
@@ -6255,7 +5161,7 @@ func_mode_link ()
 	    if test "$linkmode" = lib ; then
 		case "$new_inherited_linker_flags " in
 		    *" $deplib "*) ;;
-		    * ) func_append new_inherited_linker_flags " $deplib" ;;
+		    * ) new_inherited_linker_flags="$new_inherited_linker_flags $deplib" ;;
 		esac
 	    fi
 	  fi
@@ -6268,8 +5174,7 @@ func_mode_link ()
 	    test "$pass" = conv && continue
 	    newdependency_libs="$deplib $newdependency_libs"
 	    func_stripname '-L' '' "$deplib"
-	    func_resolve_sysroot "$func_stripname_result"
-	    func_append newlib_search_path " $func_resolve_sysroot_result"
+	    newlib_search_path="$newlib_search_path $func_stripname_result"
 	    ;;
 	  prog)
 	    if test "$pass" = conv; then
@@ -6283,8 +5188,7 @@ func_mode_link ()
 	      finalize_deplibs="$deplib $finalize_deplibs"
 	    fi
 	    func_stripname '-L' '' "$deplib"
-	    func_resolve_sysroot "$func_stripname_result"
-	    func_append newlib_search_path " $func_resolve_sysroot_result"
+	    newlib_search_path="$newlib_search_path $func_stripname_result"
 	    ;;
 	  *)
 	    func_warning "\`-L' is ignored for archives/objects"
@@ -6295,21 +5199,17 @@ func_mode_link ()
 	-R*)
 	  if test "$pass" = link; then
 	    func_stripname '-R' '' "$deplib"
-	    func_resolve_sysroot "$func_stripname_result"
-	    dir=$func_resolve_sysroot_result
+	    dir=$func_stripname_result
 	    # Make sure the xrpath contains only unique directories.
 	    case "$xrpath " in
 	    *" $dir "*) ;;
-	    *) func_append xrpath " $dir" ;;
+	    *) xrpath="$xrpath $dir" ;;
 	    esac
 	  fi
 	  deplibs="$deplib $deplibs"
 	  continue
 	  ;;
-	*.la)
-	  func_resolve_sysroot "$deplib"
-	  lib=$func_resolve_sysroot_result
-	  ;;
+	*.la) lib="$deplib" ;;
 	*.$libext)
 	  if test "$pass" = conv; then
 	    deplibs="$deplib $deplibs"
@@ -6327,7 +5227,7 @@ func_mode_link ()
 		match_pattern*)
 		  set dummy $deplibs_check_method; shift
 		  match_pattern_regex=`expr "$deplibs_check_method" : "$1 \(.*\)"`
-		  if eval "\$ECHO \"$deplib\"" 2>/dev/null | $SED 10q \
+		  if eval "\$ECHO \"X$deplib\"" 2>/dev/null | $Xsed -e 10q \
 		    | $EGREP "$match_pattern_regex" > /dev/null; then
 		    valid_a_lib=yes
 		  fi
@@ -6337,15 +5237,15 @@ func_mode_link ()
 		;;
 	      esac
 	      if test "$valid_a_lib" != yes; then
-		echo
+		$ECHO
 		$ECHO "*** Warning: Trying to link with static lib archive $deplib."
-		echo "*** I have the capability to make that library automatically link in when"
-		echo "*** you link to this library.  But I can only do this if you have a"
-		echo "*** shared version of the library, which you do not appear to have"
-		echo "*** because the file extensions .$libext of this argument makes me believe"
-		echo "*** that it is just a static archive that I should not use here."
+		$ECHO "*** I have the capability to make that library automatically link in when"
+		$ECHO "*** you link to this library.  But I can only do this if you have a"
+		$ECHO "*** shared version of the library, which you do not appear to have"
+		$ECHO "*** because the file extensions .$libext of this argument makes me believe"
+		$ECHO "*** that it is just a static archive that I should not use here."
 	      else
-		echo
+		$ECHO
 		$ECHO "*** Warning: Linking the shared library $output against the"
 		$ECHO "*** static library $deplib is not portable!"
 		deplibs="$deplib $deplibs"
@@ -6372,11 +5272,11 @@ func_mode_link ()
 	    if test "$pass" = dlpreopen || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
 	      # If there is no dlopen support or we're linking statically,
 	      # we need to preload.
-	      func_append newdlprefiles " $deplib"
+	      newdlprefiles="$newdlprefiles $deplib"
 	      compile_deplibs="$deplib $compile_deplibs"
 	      finalize_deplibs="$deplib $finalize_deplibs"
 	    else
-	      func_append newdlfiles " $deplib"
+	      newdlfiles="$newdlfiles $deplib"
 	    fi
 	  fi
 	  continue
@@ -6418,20 +5318,20 @@ func_mode_link ()
 
 	# Convert "-framework foo" to "foo.ltframework"
 	if test -n "$inherited_linker_flags"; then
-	  tmp_inherited_linker_flags=`$ECHO "$inherited_linker_flags" | $SED 's/-framework \([^ $]*\)/\1.ltframework/g'`
+	  tmp_inherited_linker_flags=`$ECHO "X$inherited_linker_flags" | $Xsed -e 's/-framework \([^ $]*\)/\1.ltframework/g'`
 	  for tmp_inherited_linker_flag in $tmp_inherited_linker_flags; do
 	    case " $new_inherited_linker_flags " in
 	      *" $tmp_inherited_linker_flag "*) ;;
-	      *) func_append new_inherited_linker_flags " $tmp_inherited_linker_flag";;
+	      *) new_inherited_linker_flags="$new_inherited_linker_flags $tmp_inherited_linker_flag";;
 	    esac
 	  done
 	fi
-	dependency_libs=`$ECHO " $dependency_libs" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
+	dependency_libs=`$ECHO "X $dependency_libs" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
 	if test "$linkmode,$pass" = "lib,link" ||
 	   test "$linkmode,$pass" = "prog,scan" ||
 	   { test "$linkmode" != prog && test "$linkmode" != lib; }; then
-	  test -n "$dlopen" && func_append dlfiles " $dlopen"
-	  test -n "$dlpreopen" && func_append dlprefiles " $dlpreopen"
+	  test -n "$dlopen" && dlfiles="$dlfiles $dlopen"
+	  test -n "$dlpreopen" && dlprefiles="$dlprefiles $dlpreopen"
 	fi
 
 	if test "$pass" = conv; then
@@ -6442,20 +5342,20 @@ func_mode_link ()
 	      func_fatal_error "cannot find name of link library for \`$lib'"
 	    fi
 	    # It is a libtool convenience library, so add in its objects.
-	    func_append convenience " $ladir/$objdir/$old_library"
-	    func_append old_convenience " $ladir/$objdir/$old_library"
+	    convenience="$convenience $ladir/$objdir/$old_library"
+	    old_convenience="$old_convenience $ladir/$objdir/$old_library"
 	  elif test "$linkmode" != prog && test "$linkmode" != lib; then
 	    func_fatal_error "\`$lib' is not a convenience library"
 	  fi
 	  tmp_libs=
 	  for deplib in $dependency_libs; do
 	    deplibs="$deplib $deplibs"
-	    if $opt_preserve_dup_deps ; then
+	    if $opt_duplicate_deps ; then
 	      case "$tmp_libs " in
-	      *" $deplib "*) func_append specialdeplibs " $deplib" ;;
+	      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
 	      esac
 	    fi
-	    func_append tmp_libs " $deplib"
+	    tmp_libs="$tmp_libs $deplib"
 	  done
 	  continue
 	fi # $pass = conv
@@ -6463,15 +5363,9 @@ func_mode_link ()
 
 	# Get the name of the library we link against.
 	linklib=
-	if test -n "$old_library" &&
-	   { test "$prefer_static_libs" = yes ||
-	     test "$prefer_static_libs,$installed" = "built,no"; }; then
-	  linklib=$old_library
-	else
-	  for l in $old_library $library_names; do
-	    linklib="$l"
-	  done
-	fi
+	for l in $old_library $library_names; do
+	  linklib="$l"
+	done
 	if test -z "$linklib"; then
 	  func_fatal_error "cannot find name of link library for \`$lib'"
 	fi
@@ -6488,9 +5382,9 @@ func_mode_link ()
 	    # statically, we need to preload.  We also need to preload any
 	    # dependent libraries so libltdl's deplib preloader doesn't
 	    # bomb out in the load deplibs phase.
-	    func_append dlprefiles " $lib $dependency_libs"
+	    dlprefiles="$dlprefiles $lib $dependency_libs"
 	  else
-	    func_append newdlfiles " $lib"
+	    newdlfiles="$newdlfiles $lib"
 	  fi
 	  continue
 	fi # $pass = dlopen
@@ -6512,14 +5406,14 @@ func_mode_link ()
 
 	# Find the relevant object directory and library name.
 	if test "X$installed" = Xyes; then
-	  if test ! -f "$lt_sysroot$libdir/$linklib" && test -f "$abs_ladir/$linklib"; then
+	  if test ! -f "$libdir/$linklib" && test -f "$abs_ladir/$linklib"; then
 	    func_warning "library \`$lib' was moved."
 	    dir="$ladir"
 	    absdir="$abs_ladir"
 	    libdir="$abs_ladir"
 	  else
-	    dir="$lt_sysroot$libdir"
-	    absdir="$lt_sysroot$libdir"
+	    dir="$libdir"
+	    absdir="$libdir"
 	  fi
 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
 	else
@@ -6527,12 +5421,12 @@ func_mode_link ()
 	    dir="$ladir"
 	    absdir="$abs_ladir"
 	    # Remove this search path later
-	    func_append notinst_path " $abs_ladir"
+	    notinst_path="$notinst_path $abs_ladir"
 	  else
 	    dir="$ladir/$objdir"
 	    absdir="$abs_ladir/$objdir"
 	    # Remove this search path later
-	    func_append notinst_path " $abs_ladir"
+	    notinst_path="$notinst_path $abs_ladir"
 	  fi
 	fi # $installed = yes
 	func_stripname 'lib' '.la' "$laname"
@@ -6543,46 +5437,20 @@ func_mode_link ()
 	  if test -z "$libdir" && test "$linkmode" = prog; then
 	    func_fatal_error "only libraries may -dlpreopen a convenience library: \`$lib'"
 	  fi
-	  case "$host" in
-	    # special handling for platforms with PE-DLLs.
-	    *cygwin* | *mingw* | *cegcc* )
-	      # Linker will automatically link against shared library if both
-	      # static and shared are present.  Therefore, ensure we extract
-	      # symbols from the import library if a shared library is present
-	      # (otherwise, the dlopen module name will be incorrect).  We do
-	      # this by putting the import library name into $newdlprefiles.
-	      # We recover the dlopen module name by 'saving' the la file
-	      # name in a special purpose variable, and (later) extracting the
-	      # dlname from the la file.
-	      if test -n "$dlname"; then
-	        func_tr_sh "$dir/$linklib"
-	        eval "libfile_$func_tr_sh_result=\$abs_ladir/\$laname"
-	        func_append newdlprefiles " $dir/$linklib"
-	      else
-	        func_append newdlprefiles " $dir/$old_library"
-	        # Keep a list of preopened convenience libraries to check
-	        # that they are being used correctly in the link pass.
-	        test -z "$libdir" && \
-	          func_append dlpreconveniencelibs " $dir/$old_library"
-	      fi
-	    ;;
-	    * )
-	      # Prefer using a static library (so that no silly _DYNAMIC symbols
-	      # are required to link).
-	      if test -n "$old_library"; then
-	        func_append newdlprefiles " $dir/$old_library"
-	        # Keep a list of preopened convenience libraries to check
-	        # that they are being used correctly in the link pass.
-	        test -z "$libdir" && \
-	          func_append dlpreconveniencelibs " $dir/$old_library"
-	      # Otherwise, use the dlname, so that lt_dlopen finds it.
-	      elif test -n "$dlname"; then
-	        func_append newdlprefiles " $dir/$dlname"
-	      else
-	        func_append newdlprefiles " $dir/$linklib"
-	      fi
-	    ;;
-	  esac
+	  # Prefer using a static library (so that no silly _DYNAMIC symbols
+	  # are required to link).
+	  if test -n "$old_library"; then
+	    newdlprefiles="$newdlprefiles $dir/$old_library"
+	    # Keep a list of preopened convenience libraries to check
+	    # that they are being used correctly in the link pass.
+	    test -z "$libdir" && \
+		dlpreconveniencelibs="$dlpreconveniencelibs $dir/$old_library"
+	  # Otherwise, use the dlname, so that lt_dlopen finds it.
+	  elif test -n "$dlname"; then
+	    newdlprefiles="$newdlprefiles $dir/$dlname"
+	  else
+	    newdlprefiles="$newdlprefiles $dir/$linklib"
+	  fi
 	fi # $pass = dlpreopen
 
 	if test -z "$libdir"; then
@@ -6600,7 +5468,7 @@ func_mode_link ()
 
 
 	if test "$linkmode" = prog && test "$pass" != link; then
-	  func_append newlib_search_path " $ladir"
+	  newlib_search_path="$newlib_search_path $ladir"
 	  deplibs="$lib $deplibs"
 
 	  linkalldeplibs=no
@@ -6613,8 +5481,7 @@ func_mode_link ()
 	  for deplib in $dependency_libs; do
 	    case $deplib in
 	    -L*) func_stripname '-L' '' "$deplib"
-	         func_resolve_sysroot "$func_stripname_result"
-	         func_append newlib_search_path " $func_resolve_sysroot_result"
+	         newlib_search_path="$newlib_search_path $func_stripname_result"
 		 ;;
 	    esac
 	    # Need to link against all dependency_libs?
@@ -6625,12 +5492,12 @@ func_mode_link ()
 	      # or/and link against static libraries
 	      newdependency_libs="$deplib $newdependency_libs"
 	    fi
-	    if $opt_preserve_dup_deps ; then
+	    if $opt_duplicate_deps ; then
 	      case "$tmp_libs " in
-	      *" $deplib "*) func_append specialdeplibs " $deplib" ;;
+	      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
 	      esac
 	    fi
-	    func_append tmp_libs " $deplib"
+	    tmp_libs="$tmp_libs $deplib"
 	  done # for deplib
 	  continue
 	fi # $linkmode = prog...
@@ -6645,7 +5512,7 @@ func_mode_link ()
 	      # Make sure the rpath contains only unique directories.
 	      case "$temp_rpath:" in
 	      *"$absdir:"*) ;;
-	      *) func_append temp_rpath "$absdir:" ;;
+	      *) temp_rpath="$temp_rpath$absdir:" ;;
 	      esac
 	    fi
 
@@ -6657,7 +5524,7 @@ func_mode_link ()
 	    *)
 	      case "$compile_rpath " in
 	      *" $absdir "*) ;;
-	      *) func_append compile_rpath " $absdir" ;;
+	      *) compile_rpath="$compile_rpath $absdir"
 	      esac
 	      ;;
 	    esac
@@ -6666,7 +5533,7 @@ func_mode_link ()
 	    *)
 	      case "$finalize_rpath " in
 	      *" $libdir "*) ;;
-	      *) func_append finalize_rpath " $libdir" ;;
+	      *) finalize_rpath="$finalize_rpath $libdir"
 	      esac
 	      ;;
 	    esac
@@ -6691,12 +5558,12 @@ func_mode_link ()
 	  case $host in
 	  *cygwin* | *mingw* | *cegcc*)
 	      # No point in relinking DLLs because paths are not encoded
-	      func_append notinst_deplibs " $lib"
+	      notinst_deplibs="$notinst_deplibs $lib"
 	      need_relink=no
 	    ;;
 	  *)
 	    if test "$installed" = no; then
-	      func_append notinst_deplibs " $lib"
+	      notinst_deplibs="$notinst_deplibs $lib"
 	      need_relink=yes
 	    fi
 	    ;;
@@ -6713,7 +5580,7 @@ func_mode_link ()
 	    fi
 	  done
 	  if test -z "$dlopenmodule" && test "$shouldnotlink" = yes && test "$pass" = link; then
-	    echo
+	    $ECHO
 	    if test "$linkmode" = prog; then
 	      $ECHO "*** Warning: Linking the executable $output against the loadable module"
 	    else
@@ -6731,7 +5598,7 @@ func_mode_link ()
 	    *)
 	      case "$compile_rpath " in
 	      *" $absdir "*) ;;
-	      *) func_append compile_rpath " $absdir" ;;
+	      *) compile_rpath="$compile_rpath $absdir"
 	      esac
 	      ;;
 	    esac
@@ -6740,7 +5607,7 @@ func_mode_link ()
 	    *)
 	      case "$finalize_rpath " in
 	      *" $libdir "*) ;;
-	      *) func_append finalize_rpath " $libdir" ;;
+	      *) finalize_rpath="$finalize_rpath $libdir"
 	      esac
 	      ;;
 	    esac
@@ -6794,7 +5661,7 @@ func_mode_link ()
 	    linklib=$newlib
 	  fi # test -n "$old_archive_from_expsyms_cmds"
 
-	  if test "$linkmode" = prog || test "$opt_mode" != relink; then
+	  if test "$linkmode" = prog || test "$mode" != relink; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -6816,9 +5683,9 @@ func_mode_link ()
 		      if test "X$dlopenmodule" != "X$lib"; then
 			$ECHO "*** Warning: lib $linklib is a module, not a shared library"
 			if test -z "$old_library" ; then
-			  echo
-			  echo "*** And there doesn't seem to be a static archive available"
-			  echo "*** The link will probably fail, sorry"
+			  $ECHO
+			  $ECHO "*** And there doesn't seem to be a static archive available"
+			  $ECHO "*** The link will probably fail, sorry"
 			else
 			  add="$dir/$old_library"
 			fi
@@ -6845,12 +5712,12 @@ func_mode_link ()
 	         test "$hardcode_direct_absolute" = no; then
 		add="$dir/$linklib"
 	      elif test "$hardcode_minus_L" = yes; then
-		add_dir="-L$absdir"
+		add_dir="-L$dir"
 		# Try looking first in the location we're being installed to.
 		if test -n "$inst_prefix_dir"; then
 		  case $libdir in
 		    [\\/]*)
-		      func_append add_dir " -L$inst_prefix_dir$libdir"
+		      add_dir="$add_dir -L$inst_prefix_dir$libdir"
 		      ;;
 		  esac
 		fi
@@ -6872,7 +5739,7 @@ func_mode_link ()
 	    if test -n "$add_shlibpath"; then
 	      case :$compile_shlibpath: in
 	      *":$add_shlibpath:"*) ;;
-	      *) func_append compile_shlibpath "$add_shlibpath:" ;;
+	      *) compile_shlibpath="$compile_shlibpath$add_shlibpath:" ;;
 	      esac
 	    fi
 	    if test "$linkmode" = prog; then
@@ -6886,13 +5753,13 @@ func_mode_link ()
 		 test "$hardcode_shlibpath_var" = yes; then
 		case :$finalize_shlibpath: in
 		*":$libdir:"*) ;;
-		*) func_append finalize_shlibpath "$libdir:" ;;
+		*) finalize_shlibpath="$finalize_shlibpath$libdir:" ;;
 		esac
 	      fi
 	    fi
 	  fi
 
-	  if test "$linkmode" = prog || test "$opt_mode" = relink; then
+	  if test "$linkmode" = prog || test "$mode" = relink; then
 	    add_shlibpath=
 	    add_dir=
 	    add=
@@ -6906,7 +5773,7 @@ func_mode_link ()
 	    elif test "$hardcode_shlibpath_var" = yes; then
 	      case :$finalize_shlibpath: in
 	      *":$libdir:"*) ;;
-	      *) func_append finalize_shlibpath "$libdir:" ;;
+	      *) finalize_shlibpath="$finalize_shlibpath$libdir:" ;;
 	      esac
 	      add="-l$name"
 	    elif test "$hardcode_automatic" = yes; then
@@ -6923,7 +5790,7 @@ func_mode_link ()
 	      if test -n "$inst_prefix_dir"; then
 		case $libdir in
 		  [\\/]*)
-		    func_append add_dir " -L$inst_prefix_dir$libdir"
+		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
 		    ;;
 		esac
 	      fi
@@ -6958,21 +5825,21 @@ func_mode_link ()
 
 	    # Just print a warning and add the library to dependency_libs so
 	    # that the program can be linked against the static library.
-	    echo
+	    $ECHO
 	    $ECHO "*** Warning: This system can not link to static lib archive $lib."
-	    echo "*** I have the capability to make that library automatically link in when"
-	    echo "*** you link to this library.  But I can only do this if you have a"
-	    echo "*** shared version of the library, which you do not appear to have."
+	    $ECHO "*** I have the capability to make that library automatically link in when"
+	    $ECHO "*** you link to this library.  But I can only do this if you have a"
+	    $ECHO "*** shared version of the library, which you do not appear to have."
 	    if test "$module" = yes; then
-	      echo "*** But as you try to build a module library, libtool will still create "
-	      echo "*** a static module, that should work as long as the dlopening application"
-	      echo "*** is linked with the -dlopen flag to resolve symbols at runtime."
+	      $ECHO "*** But as you try to build a module library, libtool will still create "
+	      $ECHO "*** a static module, that should work as long as the dlopening application"
+	      $ECHO "*** is linked with the -dlopen flag to resolve symbols at runtime."
 	      if test -z "$global_symbol_pipe"; then
-		echo
-		echo "*** However, this would only work if libtool was able to extract symbol"
-		echo "*** lists from a program, using \`nm' or equivalent, but libtool could"
-		echo "*** not find such a program.  So, this module is probably useless."
-		echo "*** \`nm' from GNU binutils and a full rebuild may help."
+		$ECHO
+		$ECHO "*** However, this would only work if libtool was able to extract symbol"
+		$ECHO "*** lists from a program, using \`nm' or equivalent, but libtool could"
+		$ECHO "*** not find such a program.  So, this module is probably useless."
+		$ECHO "*** \`nm' from GNU binutils and a full rebuild may help."
 	      fi
 	      if test "$build_old_libs" = no; then
 		build_libtool_libs=module
@@ -7000,46 +5867,37 @@ func_mode_link ()
 	           temp_xrpath=$func_stripname_result
 		   case " $xrpath " in
 		   *" $temp_xrpath "*) ;;
-		   *) func_append xrpath " $temp_xrpath";;
+		   *) xrpath="$xrpath $temp_xrpath";;
 		   esac;;
-	      *) func_append temp_deplibs " $libdir";;
+	      *) temp_deplibs="$temp_deplibs $libdir";;
 	      esac
 	    done
 	    dependency_libs="$temp_deplibs"
 	  fi
 
-	  func_append newlib_search_path " $absdir"
+	  newlib_search_path="$newlib_search_path $absdir"
 	  # Link against this library
 	  test "$link_static" = no && newdependency_libs="$abs_ladir/$laname $newdependency_libs"
 	  # ... and its dependency_libs
 	  tmp_libs=
 	  for deplib in $dependency_libs; do
 	    newdependency_libs="$deplib $newdependency_libs"
-	    case $deplib in
-              -L*) func_stripname '-L' '' "$deplib"
-                   func_resolve_sysroot "$func_stripname_result";;
-              *) func_resolve_sysroot "$deplib" ;;
-            esac
-	    if $opt_preserve_dup_deps ; then
+	    if $opt_duplicate_deps ; then
 	      case "$tmp_libs " in
-	      *" $func_resolve_sysroot_result "*)
-                func_append specialdeplibs " $func_resolve_sysroot_result" ;;
+	      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
 	      esac
 	    fi
-	    func_append tmp_libs " $func_resolve_sysroot_result"
+	    tmp_libs="$tmp_libs $deplib"
 	  done
 
 	  if test "$link_all_deplibs" != no; then
 	    # Add the search paths of all dependency libraries
 	    for deplib in $dependency_libs; do
-	      path=
 	      case $deplib in
 	      -L*) path="$deplib" ;;
 	      *.la)
-	        func_resolve_sysroot "$deplib"
-	        deplib=$func_resolve_sysroot_result
 	        func_dirname "$deplib" "" "."
-		dir=$func_dirname_result
+		dir="$func_dirname_result"
 		# We need an absolute path.
 		case $dir in
 		[\\/]* | [A-Za-z]:[\\/]*) absdir="$dir" ;;
@@ -7066,8 +5924,8 @@ func_mode_link ()
                       if test -z "$darwin_install_name"; then
                           darwin_install_name=`${OTOOL64} -L $depdepl  | awk '{if (NR == 2) {print $1;exit}}'`
                       fi
-		      func_append compiler_flags " ${wl}-dylib_file ${wl}${darwin_install_name}:${depdepl}"
-		      func_append linker_flags " -dylib_file ${darwin_install_name}:${depdepl}"
+		      compiler_flags="$compiler_flags ${wl}-dylib_file ${wl}${darwin_install_name}:${depdepl}"
+		      linker_flags="$linker_flags -dylib_file ${darwin_install_name}:${depdepl}"
 		      path=
 		    fi
 		  fi
@@ -7100,7 +5958,7 @@ func_mode_link ()
 	  compile_deplibs="$new_inherited_linker_flags $compile_deplibs"
 	  finalize_deplibs="$new_inherited_linker_flags $finalize_deplibs"
 	else
-	  compiler_flags="$compiler_flags "`$ECHO " $new_inherited_linker_flags" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
+	  compiler_flags="$compiler_flags "`$ECHO "X $new_inherited_linker_flags" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
 	fi
       fi
       dependency_libs="$newdependency_libs"
@@ -7117,7 +5975,7 @@ func_mode_link ()
 	  for dir in $newlib_search_path; do
 	    case "$lib_search_path " in
 	    *" $dir "*) ;;
-	    *) func_append lib_search_path " $dir" ;;
+	    *) lib_search_path="$lib_search_path $dir" ;;
 	    esac
 	  done
 	  newlib_search_path=
@@ -7175,10 +6033,10 @@ func_mode_link ()
 	    -L*)
 	      case " $tmp_libs " in
 	      *" $deplib "*) ;;
-	      *) func_append tmp_libs " $deplib" ;;
+	      *) tmp_libs="$tmp_libs $deplib" ;;
 	      esac
 	      ;;
-	    *) func_append tmp_libs " $deplib" ;;
+	    *) tmp_libs="$tmp_libs $deplib" ;;
 	    esac
 	  done
 	  eval $var=\"$tmp_libs\"
@@ -7194,7 +6052,7 @@ func_mode_link ()
 	  ;;
 	esac
 	if test -n "$i" ; then
-	  func_append tmp_libs " $i"
+	  tmp_libs="$tmp_libs $i"
 	fi
       done
       dependency_libs=$tmp_libs
@@ -7235,7 +6093,7 @@ func_mode_link ()
       # Now set the variables for building old libraries.
       build_libtool_libs=no
       oldlibs="$output"
-      func_append objs "$old_deplibs"
+      objs="$objs$old_deplibs"
       ;;
 
     lib)
@@ -7268,10 +6126,10 @@ func_mode_link ()
 	if test "$deplibs_check_method" != pass_all; then
 	  func_fatal_error "cannot build libtool library \`$output' from non-libtool objects on this host:$objs"
 	else
-	  echo
+	  $ECHO
 	  $ECHO "*** Warning: Linking the shared library $output against the non-libtool"
 	  $ECHO "*** objects $objs is not portable!"
-	  func_append libobjs " $objs"
+	  libobjs="$libobjs $objs"
 	fi
       fi
 
@@ -7330,14 +6188,13 @@ func_mode_link ()
 	  # which has an extra 1 added just for fun
 	  #
 	  case $version_type in
-	  # correct linux to gnu/linux during the next big refactor
 	  darwin|linux|osf|windows|none)
 	    func_arith $number_major + $number_minor
 	    current=$func_arith_result
 	    age="$number_minor"
 	    revision="$number_revision"
 	    ;;
-	  freebsd-aout|freebsd-elf|qnx|sunos)
+	  freebsd-aout|freebsd-elf|sunos)
 	    current="$number_major"
 	    revision="$number_minor"
 	    age="0"
@@ -7447,10 +6304,11 @@ func_mode_link ()
 	  versuffix="$major.$revision"
 	  ;;
 
-	linux) # correct to gnu/linux during the next big refactor
+	linux)
 	  func_arith $current - $age
 	  major=.$func_arith_result
 	  versuffix="$major.$age.$revision"
+	  versuffix2="$major.$age"
 	  ;;
 
 	osf)
@@ -7470,7 +6328,7 @@ func_mode_link ()
 	  done
 
 	  # Make executables depend on our current version.
-	  func_append verstring ":${current}.0"
+	  verstring="$verstring:${current}.0"
 	  ;;
 
 	qnx)
@@ -7511,8 +6369,10 @@ func_mode_link ()
 	  esac
 	  if test "$need_version" = no; then
 	    versuffix=
+	    versuffix2=
 	  else
 	    versuffix=".0.0"
+	    versuffix2=".0.0"
 	  fi
 	fi
 
@@ -7520,6 +6380,7 @@ func_mode_link ()
 	if test "$avoid_version" = yes && test "$need_version" = no; then
 	  major=
 	  versuffix=
+	  versuffix2=
 	  verstring=""
 	fi
 
@@ -7538,10 +6399,10 @@ func_mode_link ()
       fi
 
       func_generate_dlsyms "$libname" "$libname" "yes"
-      func_append libobjs " $symfileobj"
+      libobjs="$libobjs $symfileobj"
       test "X$libobjs" = "X " && libobjs=
 
-      if test "$opt_mode" != relink; then
+      if test "$mode" != relink; then
 	# Remove our outputs, but don't remove object files since they
 	# may have been created when compiling PIC objects.
 	removelist=
@@ -7557,7 +6418,7 @@ func_mode_link ()
 		   continue
 		 fi
 	       fi
-	       func_append removelist " $p"
+	       removelist="$removelist $p"
 	       ;;
 	    *) ;;
 	  esac
@@ -7568,28 +6429,27 @@ func_mode_link ()
 
       # Now set the variables for building old libraries.
       if test "$build_old_libs" = yes && test "$build_libtool_libs" != convenience ; then
-	func_append oldlibs " $output_objdir/$libname.$libext"
+	oldlibs="$oldlibs $output_objdir/$libname.$libext"
 
 	# Transform .lo files to .o files.
-	oldobjs="$objs "`$ECHO "$libobjs" | $SP2NL | $SED "/\.${libext}$/d; $lo2o" | $NL2SP`
+	oldobjs="$objs "`$ECHO "X$libobjs" | $SP2NL | $Xsed -e '/\.'${libext}'$/d' -e "$lo2o" | $NL2SP`
       fi
 
       # Eliminate all temporary directories.
       #for path in $notinst_path; do
-      #	lib_search_path=`$ECHO "$lib_search_path " | $SED "s% $path % %g"`
-      #	deplibs=`$ECHO "$deplibs " | $SED "s% -L$path % %g"`
-      #	dependency_libs=`$ECHO "$dependency_libs " | $SED "s% -L$path % %g"`
+      #	lib_search_path=`$ECHO "X$lib_search_path " | $Xsed -e "s% $path % %g"`
+      #	deplibs=`$ECHO "X$deplibs " | $Xsed -e "s% -L$path % %g"`
+      #	dependency_libs=`$ECHO "X$dependency_libs " | $Xsed -e "s% -L$path % %g"`
       #done
 
       if test -n "$xrpath"; then
 	# If the user specified any rpath flags, then add them.
 	temp_xrpath=
 	for libdir in $xrpath; do
-	  func_replace_sysroot "$libdir"
-	  func_append temp_xrpath " -R$func_replace_sysroot_result"
+	  temp_xrpath="$temp_xrpath -R$libdir"
 	  case "$finalize_rpath " in
 	  *" $libdir "*) ;;
-	  *) func_append finalize_rpath " $libdir" ;;
+	  *) finalize_rpath="$finalize_rpath $libdir" ;;
 	  esac
 	done
 	if test "$hardcode_into_libs" != yes || test "$build_old_libs" = yes; then
@@ -7603,7 +6463,7 @@ func_mode_link ()
       for lib in $old_dlfiles; do
 	case " $dlprefiles $dlfiles " in
 	*" $lib "*) ;;
-	*) func_append dlfiles " $lib" ;;
+	*) dlfiles="$dlfiles $lib" ;;
 	esac
       done
 
@@ -7613,7 +6473,7 @@ func_mode_link ()
       for lib in $old_dlprefiles; do
 	case "$dlprefiles " in
 	*" $lib "*) ;;
-	*) func_append dlprefiles " $lib" ;;
+	*) dlprefiles="$dlprefiles $lib" ;;
 	esac
       done
 
@@ -7625,7 +6485,7 @@ func_mode_link ()
 	    ;;
 	  *-*-rhapsody* | *-*-darwin1.[012])
 	    # Rhapsody C library is in the System framework
-	    func_append deplibs " System.ltframework"
+	    deplibs="$deplibs System.ltframework"
 	    ;;
 	  *-*-netbsd*)
 	    # Don't link with libc until the a.out ld.so is fixed.
@@ -7642,7 +6502,7 @@ func_mode_link ()
 	  *)
 	    # Add libc to deplibs on all other systems if necessary.
 	    if test "$build_libtool_need_lc" = "yes"; then
-	      func_append deplibs " -lc"
+	      deplibs="$deplibs -lc"
 	    fi
 	    ;;
 	  esac
@@ -7691,7 +6551,7 @@ EOF
 		if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
 		  case " $predeps $postdeps " in
 		  *" $i "*)
-		    func_append newdeplibs " $i"
+		    newdeplibs="$newdeplibs $i"
 		    i=""
 		    ;;
 		  esac
@@ -7702,21 +6562,21 @@ EOF
 		  set dummy $deplib_matches; shift
 		  deplib_match=$1
 		  if test `expr "$ldd_output" : ".*$deplib_match"` -ne 0 ; then
-		    func_append newdeplibs " $i"
+		    newdeplibs="$newdeplibs $i"
 		  else
 		    droppeddeps=yes
-		    echo
+		    $ECHO
 		    $ECHO "*** Warning: dynamic linker does not accept needed library $i."
-		    echo "*** I have the capability to make that library automatically link in when"
-		    echo "*** you link to this library.  But I can only do this if you have a"
-		    echo "*** shared version of the library, which I believe you do not have"
-		    echo "*** because a test_compile did reveal that the linker did not use it for"
-		    echo "*** its dynamic dependency list that programs get resolved with at runtime."
+		    $ECHO "*** I have the capability to make that library automatically link in when"
+		    $ECHO "*** you link to this library.  But I can only do this if you have a"
+		    $ECHO "*** shared version of the library, which I believe you do not have"
+		    $ECHO "*** because a test_compile did reveal that the linker did not use it for"
+		    $ECHO "*** its dynamic dependency list that programs get resolved with at runtime."
 		  fi
 		fi
 		;;
 	      *)
-		func_append newdeplibs " $i"
+		newdeplibs="$newdeplibs $i"
 		;;
 	      esac
 	    done
@@ -7734,7 +6594,7 @@ EOF
 		  if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
 		    case " $predeps $postdeps " in
 		    *" $i "*)
-		      func_append newdeplibs " $i"
+		      newdeplibs="$newdeplibs $i"
 		      i=""
 		      ;;
 		    esac
@@ -7745,29 +6605,29 @@ EOF
 		    set dummy $deplib_matches; shift
 		    deplib_match=$1
 		    if test `expr "$ldd_output" : ".*$deplib_match"` -ne 0 ; then
-		      func_append newdeplibs " $i"
+		      newdeplibs="$newdeplibs $i"
 		    else
 		      droppeddeps=yes
-		      echo
+		      $ECHO
 		      $ECHO "*** Warning: dynamic linker does not accept needed library $i."
-		      echo "*** I have the capability to make that library automatically link in when"
-		      echo "*** you link to this library.  But I can only do this if you have a"
-		      echo "*** shared version of the library, which you do not appear to have"
-		      echo "*** because a test_compile did reveal that the linker did not use this one"
-		      echo "*** as a dynamic dependency that programs can get resolved with at runtime."
+		      $ECHO "*** I have the capability to make that library automatically link in when"
+		      $ECHO "*** you link to this library.  But I can only do this if you have a"
+		      $ECHO "*** shared version of the library, which you do not appear to have"
+		      $ECHO "*** because a test_compile did reveal that the linker did not use this one"
+		      $ECHO "*** as a dynamic dependency that programs can get resolved with at runtime."
 		    fi
 		  fi
 		else
 		  droppeddeps=yes
-		  echo
+		  $ECHO
 		  $ECHO "*** Warning!  Library $i is needed by this library but I was not able to"
-		  echo "*** make it link in!  You will probably need to install it or some"
-		  echo "*** library that it depends on before this library will be fully"
-		  echo "*** functional.  Installing it before continuing would be even better."
+		  $ECHO "*** make it link in!  You will probably need to install it or some"
+		  $ECHO "*** library that it depends on before this library will be fully"
+		  $ECHO "*** functional.  Installing it before continuing would be even better."
 		fi
 		;;
 	      *)
-		func_append newdeplibs " $i"
+		newdeplibs="$newdeplibs $i"
 		;;
 	      esac
 	    done
@@ -7784,27 +6644,15 @@ EOF
 	      if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
 		case " $predeps $postdeps " in
 		*" $a_deplib "*)
-		  func_append newdeplibs " $a_deplib"
+		  newdeplibs="$newdeplibs $a_deplib"
 		  a_deplib=""
 		  ;;
 		esac
 	      fi
 	      if test -n "$a_deplib" ; then
 		libname=`eval "\\$ECHO \"$libname_spec\""`
-		if test -n "$file_magic_glob"; then
-		  libnameglob=`func_echo_all "$libname" | $SED -e $file_magic_glob`
-		else
-		  libnameglob=$libname
-		fi
-		test "$want_nocaseglob" = yes && nocaseglob=`shopt -p nocaseglob`
 		for i in $lib_search_path $sys_lib_search_path $shlib_search_path; do
-		  if test "$want_nocaseglob" = yes; then
-		    shopt -s nocaseglob
-		    potential_libs=`ls $i/$libnameglob[.-]* 2>/dev/null`
-		    $nocaseglob
-		  else
-		    potential_libs=`ls $i/$libnameglob[.-]* 2>/dev/null`
-		  fi
+		  potential_libs=`ls $i/$libname[.-]* 2>/dev/null`
 		  for potent_lib in $potential_libs; do
 		      # Follow soft links.
 		      if ls -lLd "$potent_lib" 2>/dev/null |
@@ -7821,13 +6669,13 @@ EOF
 			potliblink=`ls -ld $potlib | ${SED} 's/.* -> //'`
 			case $potliblink in
 			[\\/]* | [A-Za-z]:[\\/]*) potlib="$potliblink";;
-			*) potlib=`$ECHO "$potlib" | $SED 's,[^/]*$,,'`"$potliblink";;
+			*) potlib=`$ECHO "X$potlib" | $Xsed -e 's,[^/]*$,,'`"$potliblink";;
 			esac
 		      done
 		      if eval $file_magic_cmd \"\$potlib\" 2>/dev/null |
 			 $SED -e 10q |
 			 $EGREP "$file_magic_regex" > /dev/null; then
-			func_append newdeplibs " $a_deplib"
+			newdeplibs="$newdeplibs $a_deplib"
 			a_deplib=""
 			break 2
 		      fi
@@ -7836,12 +6684,12 @@ EOF
 	      fi
 	      if test -n "$a_deplib" ; then
 		droppeddeps=yes
-		echo
+		$ECHO
 		$ECHO "*** Warning: linker path does not have real file for library $a_deplib."
-		echo "*** I have the capability to make that library automatically link in when"
-		echo "*** you link to this library.  But I can only do this if you have a"
-		echo "*** shared version of the library, which you do not appear to have"
-		echo "*** because I did check the linker path looking for a file starting"
+		$ECHO "*** I have the capability to make that library automatically link in when"
+		$ECHO "*** you link to this library.  But I can only do this if you have a"
+		$ECHO "*** shared version of the library, which you do not appear to have"
+		$ECHO "*** because I did check the linker path looking for a file starting"
 		if test -z "$potlib" ; then
 		  $ECHO "*** with $libname but no candidates were found. (...for file magic test)"
 		else
@@ -7852,7 +6700,7 @@ EOF
 	      ;;
 	    *)
 	      # Add a -L argument.
-	      func_append newdeplibs " $a_deplib"
+	      newdeplibs="$newdeplibs $a_deplib"
 	      ;;
 	    esac
 	  done # Gone through all deplibs.
@@ -7868,7 +6716,7 @@ EOF
 	      if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
 		case " $predeps $postdeps " in
 		*" $a_deplib "*)
-		  func_append newdeplibs " $a_deplib"
+		  newdeplibs="$newdeplibs $a_deplib"
 		  a_deplib=""
 		  ;;
 		esac
@@ -7879,9 +6727,9 @@ EOF
 		  potential_libs=`ls $i/$libname[.-]* 2>/dev/null`
 		  for potent_lib in $potential_libs; do
 		    potlib="$potent_lib" # see symlink-check above in file_magic test
-		    if eval "\$ECHO \"$potent_lib\"" 2>/dev/null | $SED 10q | \
+		    if eval "\$ECHO \"X$potent_lib\"" 2>/dev/null | $Xsed -e 10q | \
 		       $EGREP "$match_pattern_regex" > /dev/null; then
-		      func_append newdeplibs " $a_deplib"
+		      newdeplibs="$newdeplibs $a_deplib"
 		      a_deplib=""
 		      break 2
 		    fi
@@ -7890,12 +6738,12 @@ EOF
 	      fi
 	      if test -n "$a_deplib" ; then
 		droppeddeps=yes
-		echo
+		$ECHO
 		$ECHO "*** Warning: linker path does not have real file for library $a_deplib."
-		echo "*** I have the capability to make that library automatically link in when"
-		echo "*** you link to this library.  But I can only do this if you have a"
-		echo "*** shared version of the library, which you do not appear to have"
-		echo "*** because I did check the linker path looking for a file starting"
+		$ECHO "*** I have the capability to make that library automatically link in when"
+		$ECHO "*** you link to this library.  But I can only do this if you have a"
+		$ECHO "*** shared version of the library, which you do not appear to have"
+		$ECHO "*** because I did check the linker path looking for a file starting"
 		if test -z "$potlib" ; then
 		  $ECHO "*** with $libname but no candidates were found. (...for regex pattern test)"
 		else
@@ -7906,32 +6754,32 @@ EOF
 	      ;;
 	    *)
 	      # Add a -L argument.
-	      func_append newdeplibs " $a_deplib"
+	      newdeplibs="$newdeplibs $a_deplib"
 	      ;;
 	    esac
 	  done # Gone through all deplibs.
 	  ;;
 	none | unknown | *)
 	  newdeplibs=""
-	  tmp_deplibs=`$ECHO " $deplibs" | $SED 's/ -lc$//; s/ -[LR][^ ]*//g'`
+	  tmp_deplibs=`$ECHO "X $deplibs" | $Xsed \
+	      -e 's/ -lc$//' -e 's/ -[LR][^ ]*//g'`
 	  if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
 	    for i in $predeps $postdeps ; do
 	      # can't use Xsed below, because $i might contain '/'
-	      tmp_deplibs=`$ECHO " $tmp_deplibs" | $SED "s,$i,,"`
+	      tmp_deplibs=`$ECHO "X $tmp_deplibs" | $Xsed -e "s,$i,,"`
 	    done
 	  fi
-	  case $tmp_deplibs in
-	  *[!\	\ ]*)
-	    echo
+	  if $ECHO "X $tmp_deplibs" | $Xsed -e 's/[	 ]//g' |
+	     $GREP . >/dev/null; then
+	    $ECHO
 	    if test "X$deplibs_check_method" = "Xnone"; then
-	      echo "*** Warning: inter-library dependencies are not supported in this platform."
+	      $ECHO "*** Warning: inter-library dependencies are not supported in this platform."
 	    else
-	      echo "*** Warning: inter-library dependencies are not known to be supported."
+	      $ECHO "*** Warning: inter-library dependencies are not known to be supported."
 	    fi
-	    echo "*** All declared inter-library dependencies are being dropped."
+	    $ECHO "*** All declared inter-library dependencies are being dropped."
 	    droppeddeps=yes
-	    ;;
-	  esac
+	  fi
 	  ;;
 	esac
 	versuffix=$versuffix_save
@@ -7943,23 +6791,23 @@ EOF
 	case $host in
 	*-*-rhapsody* | *-*-darwin1.[012])
 	  # On Rhapsody replace the C library with the System framework
-	  newdeplibs=`$ECHO " $newdeplibs" | $SED 's/ -lc / System.ltframework /'`
+	  newdeplibs=`$ECHO "X $newdeplibs" | $Xsed -e 's/ -lc / System.ltframework /'`
 	  ;;
 	esac
 
 	if test "$droppeddeps" = yes; then
 	  if test "$module" = yes; then
-	    echo
-	    echo "*** Warning: libtool could not satisfy all declared inter-library"
+	    $ECHO
+	    $ECHO "*** Warning: libtool could not satisfy all declared inter-library"
 	    $ECHO "*** dependencies of module $libname.  Therefore, libtool will create"
-	    echo "*** a static module, that should work as long as the dlopening"
-	    echo "*** application is linked with the -dlopen flag."
+	    $ECHO "*** a static module, that should work as long as the dlopening"
+	    $ECHO "*** application is linked with the -dlopen flag."
 	    if test -z "$global_symbol_pipe"; then
-	      echo
-	      echo "*** However, this would only work if libtool was able to extract symbol"
-	      echo "*** lists from a program, using \`nm' or equivalent, but libtool could"
-	      echo "*** not find such a program.  So, this module is probably useless."
-	      echo "*** \`nm' from GNU binutils and a full rebuild may help."
+	      $ECHO
+	      $ECHO "*** However, this would only work if libtool was able to extract symbol"
+	      $ECHO "*** lists from a program, using \`nm' or equivalent, but libtool could"
+	      $ECHO "*** not find such a program.  So, this module is probably useless."
+	      $ECHO "*** \`nm' from GNU binutils and a full rebuild may help."
 	    fi
 	    if test "$build_old_libs" = no; then
 	      oldlibs="$output_objdir/$libname.$libext"
@@ -7969,16 +6817,16 @@ EOF
 	      build_libtool_libs=no
 	    fi
 	  else
-	    echo "*** The inter-library dependencies that have been dropped here will be"
-	    echo "*** automatically added whenever a program is linked with this library"
-	    echo "*** or is declared to -dlopen it."
+	    $ECHO "*** The inter-library dependencies that have been dropped here will be"
+	    $ECHO "*** automatically added whenever a program is linked with this library"
+	    $ECHO "*** or is declared to -dlopen it."
 
 	    if test "$allow_undefined" = no; then
-	      echo
-	      echo "*** Since this library must not contain undefined symbols,"
-	      echo "*** because either the platform does not support them or"
-	      echo "*** it was explicitly requested with -no-undefined,"
-	      echo "*** libtool will only create a static version of it."
+	      $ECHO
+	      $ECHO "*** Since this library must not contain undefined symbols,"
+	      $ECHO "*** because either the platform does not support them or"
+	      $ECHO "*** it was explicitly requested with -no-undefined,"
+	      $ECHO "*** libtool will only create a static version of it."
 	      if test "$build_old_libs" = no; then
 		oldlibs="$output_objdir/$libname.$libext"
 		build_libtool_libs=module
@@ -7995,9 +6843,9 @@ EOF
       # Time to change all our "foo.ltframework" stuff back to "-framework foo"
       case $host in
 	*-*-darwin*)
-	  newdeplibs=`$ECHO " $newdeplibs" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
-	  new_inherited_linker_flags=`$ECHO " $new_inherited_linker_flags" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
-	  deplibs=`$ECHO " $deplibs" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
+	  newdeplibs=`$ECHO "X $newdeplibs" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
+	  new_inherited_linker_flags=`$ECHO "X $new_inherited_linker_flags" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
+	  deplibs=`$ECHO "X $deplibs" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
 	  ;;
       esac
 
@@ -8010,7 +6858,7 @@ EOF
 	*)
 	  case " $deplibs " in
 	  *" -L$path/$objdir "*)
-	    func_append new_libs " -L$path/$objdir" ;;
+	    new_libs="$new_libs -L$path/$objdir" ;;
 	  esac
 	  ;;
 	esac
@@ -8020,10 +6868,10 @@ EOF
 	-L*)
 	  case " $new_libs " in
 	  *" $deplib "*) ;;
-	  *) func_append new_libs " $deplib" ;;
+	  *) new_libs="$new_libs $deplib" ;;
 	  esac
 	  ;;
-	*) func_append new_libs " $deplib" ;;
+	*) new_libs="$new_libs $deplib" ;;
 	esac
       done
       deplibs="$new_libs"
@@ -8035,22 +6883,15 @@ EOF
 
       # Test again, we may have decided not to build it any more
       if test "$build_libtool_libs" = yes; then
-	# Remove ${wl} instances when linking with ld.
-	# FIXME: should test the right _cmds variable.
-	case $archive_cmds in
-	  *\$LD\ *) wl= ;;
-        esac
 	if test "$hardcode_into_libs" = yes; then
 	  # Hardcode the library paths
 	  hardcode_libdirs=
 	  dep_rpath=
 	  rpath="$finalize_rpath"
-	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
+	  test "$mode" != relink && rpath="$compile_rpath$rpath"
 	  for libdir in $rpath; do
 	    if test -n "$hardcode_libdir_flag_spec"; then
 	      if test -n "$hardcode_libdir_separator"; then
-		func_replace_sysroot "$libdir"
-		libdir=$func_replace_sysroot_result
 		if test -z "$hardcode_libdirs"; then
 		  hardcode_libdirs="$libdir"
 		else
@@ -8059,18 +6900,18 @@ EOF
 		  *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
 		    ;;
 		  *)
-		    func_append hardcode_libdirs "$hardcode_libdir_separator$libdir"
+		    hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
 		    ;;
 		  esac
 		fi
 	      else
 		eval flag=\"$hardcode_libdir_flag_spec\"
-		func_append dep_rpath " $flag"
+		dep_rpath="$dep_rpath $flag"
 	      fi
 	    elif test -n "$runpath_var"; then
 	      case "$perm_rpath " in
 	      *" $libdir "*) ;;
-	      *) func_append perm_rpath " $libdir" ;;
+	      *) perm_rpath="$perm_rpath $libdir" ;;
 	      esac
 	    fi
 	  done
@@ -8078,13 +6919,17 @@ EOF
 	  if test -n "$hardcode_libdir_separator" &&
 	     test -n "$hardcode_libdirs"; then
 	    libdir="$hardcode_libdirs"
-	    eval "dep_rpath=\"$hardcode_libdir_flag_spec\""
+	    if test -n "$hardcode_libdir_flag_spec_ld"; then
+	      eval dep_rpath=\"$hardcode_libdir_flag_spec_ld\"
+	    else
+	      eval dep_rpath=\"$hardcode_libdir_flag_spec\"
+	    fi
 	  fi
 	  if test -n "$runpath_var" && test -n "$perm_rpath"; then
 	    # We should set the runpath_var.
 	    rpath=
 	    for dir in $perm_rpath; do
-	      func_append rpath "$dir:"
+	      rpath="$rpath$dir:"
 	    done
 	    eval "$runpath_var='$rpath\$$runpath_var'; export $runpath_var"
 	  fi
@@ -8092,7 +6937,7 @@ EOF
 	fi
 
 	shlibpath="$finalize_shlibpath"
-	test "$opt_mode" != relink && shlibpath="$compile_shlibpath$shlibpath"
+	test "$mode" != relink && shlibpath="$compile_shlibpath$shlibpath"
 	if test -n "$shlibpath"; then
 	  eval "$shlibpath_var='$shlibpath\$$shlibpath_var'; export $shlibpath_var"
 	fi
@@ -8118,18 +6963,18 @@ EOF
 	linknames=
 	for link
 	do
-	  func_append linknames " $link"
+	  linknames="$linknames $link"
 	done
 
 	# Use standard objects if they are pic
-	test -z "$pic_flag" && libobjs=`$ECHO "$libobjs" | $SP2NL | $SED "$lo2o" | $NL2SP`
+	test -z "$pic_flag" && libobjs=`$ECHO "X$libobjs" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
 	test "X$libobjs" = "X " && libobjs=
 
 	delfiles=
 	if test -n "$export_symbols" && test -n "$include_expsyms"; then
 	  $opt_dry_run || cp "$export_symbols" "$output_objdir/$libname.uexp"
 	  export_symbols="$output_objdir/$libname.uexp"
-	  func_append delfiles " $export_symbols"
+	  delfiles="$delfiles $export_symbols"
 	fi
 
 	orig_export_symbols=
@@ -8160,45 +7005,13 @@ EOF
 	    $opt_dry_run || $RM $export_symbols
 	    cmds=$export_symbols_cmds
 	    save_ifs="$IFS"; IFS='~'
-	    for cmd1 in $cmds; do
+	    for cmd in $cmds; do
 	      IFS="$save_ifs"
-	      # Take the normal branch if the nm_file_list_spec branch
-	      # doesn't work or if tool conversion is not needed.
-	      case $nm_file_list_spec~$to_tool_file_cmd in
-		*~func_convert_file_noop | *~func_convert_file_msys_to_w32 | ~*)
-		  try_normal_branch=yes
-		  eval cmd=\"$cmd1\"
-		  func_len " $cmd"
-		  len=$func_len_result
-		  ;;
-		*)
-		  try_normal_branch=no
-		  ;;
-	      esac
-	      if test "$try_normal_branch" = yes \
-		 && { test "$len" -lt "$max_cmd_len" \
-		      || test "$max_cmd_len" -le -1; }
-	      then
-		func_show_eval "$cmd" 'exit $?'
-		skipped_export=false
-	      elif test -n "$nm_file_list_spec"; then
-		func_basename "$output"
-		output_la=$func_basename_result
-		save_libobjs=$libobjs
-		save_output=$output
-		output=${output_objdir}/${output_la}.nm
-		func_to_tool_file "$output"
-		libobjs=$nm_file_list_spec$func_to_tool_file_result
-		func_append delfiles " $output"
-		func_verbose "creating $NM input file list: $output"
-		for obj in $save_libobjs; do
-		  func_to_tool_file "$obj"
-		  $ECHO "$func_to_tool_file_result"
-		done > "$output"
-		eval cmd=\"$cmd1\"
+	      eval cmd=\"$cmd\"
+	      func_len " $cmd"
+	      len=$func_len_result
+	      if test "$len" -lt "$max_cmd_len" || test "$max_cmd_len" -le -1; then
 		func_show_eval "$cmd" 'exit $?'
-		output=$save_output
-		libobjs=$save_libobjs
 		skipped_export=false
 	      else
 		# The command line is too long to execute in one step.
@@ -8220,7 +7033,7 @@ EOF
 	if test -n "$export_symbols" && test -n "$include_expsyms"; then
 	  tmp_export_symbols="$export_symbols"
 	  test -n "$orig_export_symbols" && tmp_export_symbols="$orig_export_symbols"
-	  $opt_dry_run || eval '$ECHO "$include_expsyms" | $SP2NL >> "$tmp_export_symbols"'
+	  $opt_dry_run || eval '$ECHO "X$include_expsyms" | $Xsed | $SP2NL >> "$tmp_export_symbols"'
 	fi
 
 	if test "X$skipped_export" != "X:" && test -n "$orig_export_symbols"; then
@@ -8232,7 +7045,7 @@ EOF
 	  # global variables. join(1) would be nice here, but unfortunately
 	  # isn't a blessed tool.
 	  $opt_dry_run || $SED -e '/[ ,]DATA/!d;s,\(.*\)\([ \,].*\),s|^\1$|\1\2|,' < $export_symbols > $output_objdir/$libname.filter
-	  func_append delfiles " $export_symbols $output_objdir/$libname.filter"
+	  delfiles="$delfiles $export_symbols $output_objdir/$libname.filter"
 	  export_symbols=$output_objdir/$libname.def
 	  $opt_dry_run || $SED -f $output_objdir/$libname.filter < $orig_export_symbols > $export_symbols
 	fi
@@ -8242,7 +7055,7 @@ EOF
 	  case " $convenience " in
 	  *" $test_deplib "*) ;;
 	  *)
-	    func_append tmp_deplibs " $test_deplib"
+	    tmp_deplibs="$tmp_deplibs $test_deplib"
 	    ;;
 	  esac
 	done
@@ -8262,21 +7075,21 @@ EOF
 	    test "X$libobjs" = "X " && libobjs=
 	  else
 	    gentop="$output_objdir/${outputname}x"
-	    func_append generated " $gentop"
+	    generated="$generated $gentop"
 
 	    func_extract_archives $gentop $convenience
-	    func_append libobjs " $func_extract_archives_result"
+	    libobjs="$libobjs $func_extract_archives_result"
 	    test "X$libobjs" = "X " && libobjs=
 	  fi
 	fi
 
 	if test "$thread_safe" = yes && test -n "$thread_safe_flag_spec"; then
 	  eval flag=\"$thread_safe_flag_spec\"
-	  func_append linker_flags " $flag"
+	  linker_flags="$linker_flags $flag"
 	fi
 
 	# Make a backup of the uninstalled library when relinking
-	if test "$opt_mode" = relink; then
+	if test "$mode" = relink; then
 	  $opt_dry_run || eval '(cd $output_objdir && $RM ${realname}U && $MV $realname ${realname}U)' || exit $?
 	fi
 
@@ -8321,8 +7134,7 @@ EOF
 	    save_libobjs=$libobjs
 	  fi
 	  save_output=$output
-	  func_basename "$output"
-	  output_la=$func_basename_result
+	  output_la=`$ECHO "X$output" | $Xsed -e "$basename"`
 
 	  # Clear the reloadable object creation command queue and
 	  # initialize k to one.
@@ -8335,16 +7147,13 @@ EOF
 	  if test -n "$save_libobjs" && test "X$skipped_export" != "X:" && test "$with_gnu_ld" = yes; then
 	    output=${output_objdir}/${output_la}.lnkscript
 	    func_verbose "creating GNU ld script: $output"
-	    echo 'INPUT (' > $output
+	    $ECHO 'INPUT (' > $output
 	    for obj in $save_libobjs
 	    do
-	      func_to_tool_file "$obj"
-	      $ECHO "$func_to_tool_file_result" >> $output
+	      $ECHO "$obj" >> $output
 	    done
-	    echo ')' >> $output
-	    func_append delfiles " $output"
-	    func_to_tool_file "$output"
-	    output=$func_to_tool_file_result
+	    $ECHO ')' >> $output
+	    delfiles="$delfiles $output"
 	  elif test -n "$save_libobjs" && test "X$skipped_export" != "X:" && test "X$file_list_spec" != X; then
 	    output=${output_objdir}/${output_la}.lnk
 	    func_verbose "creating linker input file list: $output"
@@ -8358,12 +7167,10 @@ EOF
 	    fi
 	    for obj
 	    do
-	      func_to_tool_file "$obj"
-	      $ECHO "$func_to_tool_file_result" >> $output
+	      $ECHO "$obj" >> $output
 	    done
-	    func_append delfiles " $output"
-	    func_to_tool_file "$output"
-	    output=$firstobj\"$file_list_spec$func_to_tool_file_result\"
+	    delfiles="$delfiles $output"
+	    output=$firstobj\"$file_list_spec$output\"
 	  else
 	    if test -n "$save_libobjs"; then
 	      func_verbose "creating reloadable object files..."
@@ -8387,19 +7194,17 @@ EOF
 		  # command to the queue.
 		  if test "$k" -eq 1 ; then
 		    # The first file doesn't have a previous command to add.
-		    reload_objs=$objlist
-		    eval concat_cmds=\"$reload_cmds\"
+		    eval concat_cmds=\"$reload_cmds $objlist $last_robj\"
 		  else
 		    # All subsequent reloadable object files will link in
 		    # the last one created.
-		    reload_objs="$objlist $last_robj"
-		    eval concat_cmds=\"\$concat_cmds~$reload_cmds~\$RM $last_robj\"
+		    eval concat_cmds=\"\$concat_cmds~$reload_cmds $objlist $last_robj~\$RM $last_robj\"
 		  fi
 		  last_robj=$output_objdir/$output_la-${k}.$objext
 		  func_arith $k + 1
 		  k=$func_arith_result
 		  output=$output_objdir/$output_la-${k}.$objext
-		  objlist=" $obj"
+		  objlist=$obj
 		  func_len " $last_robj"
 		  func_arith $len0 + $func_len_result
 		  len=$func_arith_result
@@ -8409,12 +7214,11 @@ EOF
 	      # reloadable object file.  All subsequent reloadable object
 	      # files will link in the last one created.
 	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
-	      reload_objs="$objlist $last_robj"
-	      eval concat_cmds=\"\${concat_cmds}$reload_cmds\"
+	      eval concat_cmds=\"\${concat_cmds}$reload_cmds $objlist $last_robj\"
 	      if test -n "$last_robj"; then
 	        eval concat_cmds=\"\${concat_cmds}~\$RM $last_robj\"
 	      fi
-	      func_append delfiles " $output"
+	      delfiles="$delfiles $output"
 
 	    else
 	      output=
@@ -8448,7 +7252,7 @@ EOF
 		lt_exit=$?
 
 		# Restore the uninstalled library and exit
-		if test "$opt_mode" = relink; then
+		if test "$mode" = relink; then
 		  ( cd "$output_objdir" && \
 		    $RM "${realname}T" && \
 		    $MV "${realname}U" "$realname" )
@@ -8469,7 +7273,7 @@ EOF
 	    if test -n "$export_symbols" && test -n "$include_expsyms"; then
 	      tmp_export_symbols="$export_symbols"
 	      test -n "$orig_export_symbols" && tmp_export_symbols="$orig_export_symbols"
-	      $opt_dry_run || eval '$ECHO "$include_expsyms" | $SP2NL >> "$tmp_export_symbols"'
+	      $opt_dry_run || eval '$ECHO "X$include_expsyms" | $Xsed | $SP2NL >> "$tmp_export_symbols"'
 	    fi
 
 	    if test -n "$orig_export_symbols"; then
@@ -8481,7 +7285,7 @@ EOF
 	      # global variables. join(1) would be nice here, but unfortunately
 	      # isn't a blessed tool.
 	      $opt_dry_run || $SED -e '/[ ,]DATA/!d;s,\(.*\)\([ \,].*\),s|^\1$|\1\2|,' < $export_symbols > $output_objdir/$libname.filter
-	      func_append delfiles " $export_symbols $output_objdir/$libname.filter"
+	      delfiles="$delfiles $export_symbols $output_objdir/$libname.filter"
 	      export_symbols=$output_objdir/$libname.def
 	      $opt_dry_run || $SED -f $output_objdir/$libname.filter < $orig_export_symbols > $export_symbols
 	    fi
@@ -8522,10 +7326,10 @@ EOF
 	# Add any objects from preloaded convenience libraries
 	if test -n "$dlprefiles"; then
 	  gentop="$output_objdir/${outputname}x"
-	  func_append generated " $gentop"
+	  generated="$generated $gentop"
 
 	  func_extract_archives $gentop $dlprefiles
-	  func_append libobjs " $func_extract_archives_result"
+	  libobjs="$libobjs $func_extract_archives_result"
 	  test "X$libobjs" = "X " && libobjs=
 	fi
 
@@ -8541,7 +7345,7 @@ EOF
 	    lt_exit=$?
 
 	    # Restore the uninstalled library and exit
-	    if test "$opt_mode" = relink; then
+	    if test "$mode" = relink; then
 	      ( cd "$output_objdir" && \
 	        $RM "${realname}T" && \
 		$MV "${realname}U" "$realname" )
@@ -8553,7 +7357,7 @@ EOF
 	IFS="$save_ifs"
 
 	# Restore the uninstalled library and exit
-	if test "$opt_mode" = relink; then
+	if test "$mode" = relink; then
 	  $opt_dry_run || eval '(cd $output_objdir && $RM ${realname}T && $MV $realname ${realname}T && $MV ${realname}U $realname)' || exit $?
 
 	  if test -n "$convenience"; then
@@ -8634,21 +7438,18 @@ EOF
       if test -n "$convenience"; then
 	if test -n "$whole_archive_flag_spec"; then
 	  eval tmp_whole_archive_flags=\"$whole_archive_flag_spec\"
-	  reload_conv_objs=$reload_objs\ `$ECHO "$tmp_whole_archive_flags" | $SED 's|,| |g'`
+	  reload_conv_objs=$reload_objs\ `$ECHO "X$tmp_whole_archive_flags" | $Xsed -e 's|,| |g'`
 	else
 	  gentop="$output_objdir/${obj}x"
-	  func_append generated " $gentop"
+	  generated="$generated $gentop"
 
 	  func_extract_archives $gentop $convenience
 	  reload_conv_objs="$reload_objs $func_extract_archives_result"
 	fi
       fi
 
-      # If we're not building shared, we need to use non_pic_objs
-      test "$build_libtool_libs" != yes && libobjs="$non_pic_objects"
-
       # Create the old-style object.
-      reload_objs="$objs$old_deplibs "`$ECHO "$libobjs" | $SP2NL | $SED "/\.${libext}$/d; /\.lib$/d; $lo2o" | $NL2SP`" $reload_conv_objs" ### testsuite: skip nested quoting test
+      reload_objs="$objs$old_deplibs "`$ECHO "X$libobjs" | $SP2NL | $Xsed -e '/\.'${libext}$'/d' -e '/\.lib$/d' -e "$lo2o" | $NL2SP`" $reload_conv_objs" ### testsuite: skip nested quoting test
 
       output="$obj"
       func_execute_cmds "$reload_cmds" 'exit $?'
@@ -8708,8 +7509,8 @@ EOF
       case $host in
       *-*-rhapsody* | *-*-darwin1.[012])
 	# On Rhapsody replace the C library is the System framework
-	compile_deplibs=`$ECHO " $compile_deplibs" | $SED 's/ -lc / System.ltframework /'`
-	finalize_deplibs=`$ECHO " $finalize_deplibs" | $SED 's/ -lc / System.ltframework /'`
+	compile_deplibs=`$ECHO "X $compile_deplibs" | $Xsed -e 's/ -lc / System.ltframework /'`
+	finalize_deplibs=`$ECHO "X $finalize_deplibs" | $Xsed -e 's/ -lc / System.ltframework /'`
 	;;
       esac
 
@@ -8720,14 +7521,14 @@ EOF
 	if test "$tagname" = CXX ; then
 	  case ${MACOSX_DEPLOYMENT_TARGET-10.0} in
 	    10.[0123])
-	      func_append compile_command " ${wl}-bind_at_load"
-	      func_append finalize_command " ${wl}-bind_at_load"
+	      compile_command="$compile_command ${wl}-bind_at_load"
+	      finalize_command="$finalize_command ${wl}-bind_at_load"
 	    ;;
 	  esac
 	fi
 	# Time to change all our "foo.ltframework" stuff back to "-framework foo"
-	compile_deplibs=`$ECHO " $compile_deplibs" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
-	finalize_deplibs=`$ECHO " $finalize_deplibs" | $SED 's% \([^ $]*\).ltframework% -framework \1%g'`
+	compile_deplibs=`$ECHO "X $compile_deplibs" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
+	finalize_deplibs=`$ECHO "X $finalize_deplibs" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
 	;;
       esac
 
@@ -8741,7 +7542,7 @@ EOF
 	*)
 	  case " $compile_deplibs " in
 	  *" -L$path/$objdir "*)
-	    func_append new_libs " -L$path/$objdir" ;;
+	    new_libs="$new_libs -L$path/$objdir" ;;
 	  esac
 	  ;;
 	esac
@@ -8751,17 +7552,17 @@ EOF
 	-L*)
 	  case " $new_libs " in
 	  *" $deplib "*) ;;
-	  *) func_append new_libs " $deplib" ;;
+	  *) new_libs="$new_libs $deplib" ;;
 	  esac
 	  ;;
-	*) func_append new_libs " $deplib" ;;
+	*) new_libs="$new_libs $deplib" ;;
 	esac
       done
       compile_deplibs="$new_libs"
 
 
-      func_append compile_command " $compile_deplibs"
-      func_append finalize_command " $finalize_deplibs"
+      compile_command="$compile_command $compile_deplibs"
+      finalize_command="$finalize_command $finalize_deplibs"
 
       if test -n "$rpath$xrpath"; then
 	# If the user specified any rpath flags, then add them.
@@ -8769,7 +7570,7 @@ EOF
 	  # This is the magic to use -rpath.
 	  case "$finalize_rpath " in
 	  *" $libdir "*) ;;
-	  *) func_append finalize_rpath " $libdir" ;;
+	  *) finalize_rpath="$finalize_rpath $libdir" ;;
 	  esac
 	done
       fi
@@ -8788,18 +7589,18 @@ EOF
 	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
 		;;
 	      *)
-		func_append hardcode_libdirs "$hardcode_libdir_separator$libdir"
+		hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
 		;;
 	      esac
 	    fi
 	  else
 	    eval flag=\"$hardcode_libdir_flag_spec\"
-	    func_append rpath " $flag"
+	    rpath="$rpath $flag"
 	  fi
 	elif test -n "$runpath_var"; then
 	  case "$perm_rpath " in
 	  *" $libdir "*) ;;
-	  *) func_append perm_rpath " $libdir" ;;
+	  *) perm_rpath="$perm_rpath $libdir" ;;
 	  esac
 	fi
 	case $host in
@@ -8808,12 +7609,12 @@ EOF
 	  case :$dllsearchpath: in
 	  *":$libdir:"*) ;;
 	  ::) dllsearchpath=$libdir;;
-	  *) func_append dllsearchpath ":$libdir";;
+	  *) dllsearchpath="$dllsearchpath:$libdir";;
 	  esac
 	  case :$dllsearchpath: in
 	  *":$testbindir:"*) ;;
 	  ::) dllsearchpath=$testbindir;;
-	  *) func_append dllsearchpath ":$testbindir";;
+	  *) dllsearchpath="$dllsearchpath:$testbindir";;
 	  esac
 	  ;;
 	esac
@@ -8839,18 +7640,18 @@ EOF
 	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
 		;;
 	      *)
-		func_append hardcode_libdirs "$hardcode_libdir_separator$libdir"
+		hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
 		;;
 	      esac
 	    fi
 	  else
 	    eval flag=\"$hardcode_libdir_flag_spec\"
-	    func_append rpath " $flag"
+	    rpath="$rpath $flag"
 	  fi
 	elif test -n "$runpath_var"; then
 	  case "$finalize_perm_rpath " in
 	  *" $libdir "*) ;;
-	  *) func_append finalize_perm_rpath " $libdir" ;;
+	  *) finalize_perm_rpath="$finalize_perm_rpath $libdir" ;;
 	  esac
 	fi
       done
@@ -8864,8 +7665,8 @@ EOF
 
       if test -n "$libobjs" && test "$build_old_libs" = yes; then
 	# Transform all the library objects into standard objects.
-	compile_command=`$ECHO "$compile_command" | $SP2NL | $SED "$lo2o" | $NL2SP`
-	finalize_command=`$ECHO "$finalize_command" | $SP2NL | $SED "$lo2o" | $NL2SP`
+	compile_command=`$ECHO "X$compile_command" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+	finalize_command=`$ECHO "X$finalize_command" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
       fi
 
       func_generate_dlsyms "$outputname" "@PROGRAM@" "no"
@@ -8877,15 +7678,15 @@ EOF
 
       wrappers_required=yes
       case $host in
-      *cegcc* | *mingw32ce*)
-        # Disable wrappers for cegcc and mingw32ce hosts, we are cross compiling anyway.
-        wrappers_required=no
-        ;;
       *cygwin* | *mingw* )
         if test "$build_libtool_libs" != yes; then
           wrappers_required=no
         fi
         ;;
+      *cegcc)
+        # Disable wrappers for cegcc, we are cross compiling anyway.
+        wrappers_required=no
+        ;;
       *)
         if test "$need_relink" = no || test "$build_libtool_libs" != yes; then
           wrappers_required=no
@@ -8894,19 +7695,13 @@ EOF
       esac
       if test "$wrappers_required" = no; then
 	# Replace the output file specification.
-	compile_command=`$ECHO "$compile_command" | $SED 's%@OUTPUT@%'"$output"'%g'`
+	compile_command=`$ECHO "X$compile_command" | $Xsed -e 's%@OUTPUT@%'"$output"'%g'`
 	link_command="$compile_command$compile_rpath"
 
 	# We have no uninstalled library dependencies, so finalize right now.
 	exit_status=0
 	func_show_eval "$link_command" 'exit_status=$?'
 
-	if test -n "$postlink_cmds"; then
-	  func_to_tool_file "$output"
-	  postlink_cmds=`func_echo_all "$postlink_cmds" | $SED -e 's%@OUTPUT@%'"$output"'%g' -e 's%@TOOL_OUTPUT@%'"$func_to_tool_file_result"'%g'`
-	  func_execute_cmds "$postlink_cmds" 'exit $?'
-	fi
-
 	# Delete the generated files.
 	if test -f "$output_objdir/${outputname}S.${objext}"; then
 	  func_show_eval '$RM "$output_objdir/${outputname}S.${objext}"'
@@ -8929,7 +7724,7 @@ EOF
 	  # We should set the runpath_var.
 	  rpath=
 	  for dir in $perm_rpath; do
-	    func_append rpath "$dir:"
+	    rpath="$rpath$dir:"
 	  done
 	  compile_var="$runpath_var=\"$rpath\$$runpath_var\" "
 	fi
@@ -8937,7 +7732,7 @@ EOF
 	  # We should set the runpath_var.
 	  rpath=
 	  for dir in $finalize_perm_rpath; do
-	    func_append rpath "$dir:"
+	    rpath="$rpath$dir:"
 	  done
 	  finalize_var="$runpath_var=\"$rpath\$$runpath_var\" "
 	fi
@@ -8947,18 +7742,11 @@ EOF
 	# We don't need to create a wrapper script.
 	link_command="$compile_var$compile_command$compile_rpath"
 	# Replace the output file specification.
-	link_command=`$ECHO "$link_command" | $SED 's%@OUTPUT@%'"$output"'%g'`
+	link_command=`$ECHO "X$link_command" | $Xsed -e 's%@OUTPUT@%'"$output"'%g'`
 	# Delete the old output file.
 	$opt_dry_run || $RM $output
 	# Link the executable and exit
 	func_show_eval "$link_command" 'exit $?'
-
-	if test -n "$postlink_cmds"; then
-	  func_to_tool_file "$output"
-	  postlink_cmds=`func_echo_all "$postlink_cmds" | $SED -e 's%@OUTPUT@%'"$output"'%g' -e 's%@TOOL_OUTPUT@%'"$func_to_tool_file_result"'%g'`
-	  func_execute_cmds "$postlink_cmds" 'exit $?'
-	fi
-
 	exit $EXIT_SUCCESS
       fi
 
@@ -8973,7 +7761,7 @@ EOF
 	if test "$fast_install" != no; then
 	  link_command="$finalize_var$compile_command$finalize_rpath"
 	  if test "$fast_install" = yes; then
-	    relink_command=`$ECHO "$compile_var$compile_command$compile_rpath" | $SED 's%@OUTPUT@%\$progdir/\$file%g'`
+	    relink_command=`$ECHO "X$compile_var$compile_command$compile_rpath" | $Xsed -e 's%@OUTPUT@%\$progdir/\$file%g'`
 	  else
 	    # fast_install is set to needless
 	    relink_command=
@@ -8985,19 +7773,13 @@ EOF
       fi
 
       # Replace the output file specification.
-      link_command=`$ECHO "$link_command" | $SED 's%@OUTPUT@%'"$output_objdir/$outputname"'%g'`
+      link_command=`$ECHO "X$link_command" | $Xsed -e 's%@OUTPUT@%'"$output_objdir/$outputname"'%g'`
 
       # Delete the old output files.
       $opt_dry_run || $RM $output $output_objdir/$outputname $output_objdir/lt-$outputname
 
       func_show_eval "$link_command" 'exit $?'
 
-      if test -n "$postlink_cmds"; then
-	func_to_tool_file "$output_objdir/$outputname"
-	postlink_cmds=`func_echo_all "$postlink_cmds" | $SED -e 's%@OUTPUT@%'"$output_objdir/$outputname"'%g' -e 's%@TOOL_OUTPUT@%'"$func_to_tool_file_result"'%g'`
-	func_execute_cmds "$postlink_cmds" 'exit $?'
-      fi
-
       # Now create the wrapper script.
       func_verbose "creating $output"
 
@@ -9015,7 +7797,18 @@ EOF
 	  fi
 	done
 	relink_command="(cd `pwd`; $relink_command)"
-	relink_command=`$ECHO "$relink_command" | $SED "$sed_quote_subst"`
+	relink_command=`$ECHO "X$relink_command" | $Xsed -e "$sed_quote_subst"`
+      fi
+
+      # Quote $ECHO for shipping.
+      if test "X$ECHO" = "X$SHELL $progpath --fallback-echo"; then
+	case $progpath in
+	[\\/]* | [A-Za-z]:[\\/]*) qecho="$SHELL $progpath --fallback-echo";;
+	*) qecho="$SHELL `pwd`/$progpath --fallback-echo";;
+	esac
+	qecho=`$ECHO "X$qecho" | $Xsed -e "$sed_quote_subst"`
+      else
+	qecho=`$ECHO "X$ECHO" | $Xsed -e "$sed_quote_subst"`
       fi
 
       # Only actually do things if not in dry run mode.
@@ -9095,7 +7888,7 @@ EOF
 	else
 	  oldobjs="$old_deplibs $non_pic_objects"
 	  if test "$preload" = yes && test -f "$symfileobj"; then
-	    func_append oldobjs " $symfileobj"
+	    oldobjs="$oldobjs $symfileobj"
 	  fi
 	fi
 	addlibs="$old_convenience"
@@ -9103,10 +7896,10 @@ EOF
 
       if test -n "$addlibs"; then
 	gentop="$output_objdir/${outputname}x"
-	func_append generated " $gentop"
+	generated="$generated $gentop"
 
 	func_extract_archives $gentop $addlibs
-	func_append oldobjs " $func_extract_archives_result"
+	oldobjs="$oldobjs $func_extract_archives_result"
       fi
 
       # Do each command in the archive commands.
@@ -9117,10 +7910,10 @@ EOF
 	# Add any objects from preloaded convenience libraries
 	if test -n "$dlprefiles"; then
 	  gentop="$output_objdir/${outputname}x"
-	  func_append generated " $gentop"
+	  generated="$generated $gentop"
 
 	  func_extract_archives $gentop $dlprefiles
-	  func_append oldobjs " $func_extract_archives_result"
+	  oldobjs="$oldobjs $func_extract_archives_result"
 	fi
 
 	# POSIX demands no paths to be encoded in archives.  We have
@@ -9136,9 +7929,9 @@ EOF
 	    done | sort | sort -uc >/dev/null 2>&1); then
 	  :
 	else
-	  echo "copying selected object files to avoid basename conflicts..."
+	  $ECHO "copying selected object files to avoid basename conflicts..."
 	  gentop="$output_objdir/${outputname}x"
-	  func_append generated " $gentop"
+	  generated="$generated $gentop"
 	  func_mkdir_p "$gentop"
 	  save_oldobjs=$oldobjs
 	  oldobjs=
@@ -9162,30 +7955,18 @@ EOF
 		esac
 	      done
 	      func_show_eval "ln $obj $gentop/$newobj || cp $obj $gentop/$newobj"
-	      func_append oldobjs " $gentop/$newobj"
+	      oldobjs="$oldobjs $gentop/$newobj"
 	      ;;
-	    *) func_append oldobjs " $obj" ;;
+	    *) oldobjs="$oldobjs $obj" ;;
 	    esac
 	  done
 	fi
-	func_to_tool_file "$oldlib" func_convert_file_msys_to_w32
-	tool_oldlib=$func_to_tool_file_result
 	eval cmds=\"$old_archive_cmds\"
 
 	func_len " $cmds"
 	len=$func_len_result
 	if test "$len" -lt "$max_cmd_len" || test "$max_cmd_len" -le -1; then
 	  cmds=$old_archive_cmds
-	elif test -n "$archiver_list_spec"; then
-	  func_verbose "using command file archive linking..."
-	  for obj in $oldobjs
-	  do
-	    func_to_tool_file "$obj"
-	    $ECHO "$func_to_tool_file_result"
-	  done > $output_objdir/$libname.libcmd
-	  func_to_tool_file "$output_objdir/$libname.libcmd"
-	  oldobjs=" $archiver_list_spec$func_to_tool_file_result"
-	  cmds=$old_archive_cmds
 	else
 	  # the command line is too long to link in one step, link in parts
 	  func_verbose "using piecewise archive linking..."
@@ -9259,7 +8040,7 @@ EOF
       done
       # Quote the link command for shipping.
       relink_command="(cd `pwd`; $SHELL $progpath $preserve_args --mode=relink $libtool_args @inst_prefix_dir@)"
-      relink_command=`$ECHO "$relink_command" | $SED "$sed_quote_subst"`
+      relink_command=`$ECHO "X$relink_command" | $Xsed -e "$sed_quote_subst"`
       if test "$hardcode_automatic" = yes ; then
 	relink_command=
       fi
@@ -9279,23 +8060,12 @@ EOF
 	      *.la)
 		func_basename "$deplib"
 		name="$func_basename_result"
-		func_resolve_sysroot "$deplib"
-		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $func_resolve_sysroot_result`
+		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
 		test -z "$libdir" && \
 		  func_fatal_error "\`$deplib' is not a valid libtool archive"
-		func_append newdependency_libs " ${lt_sysroot:+=}$libdir/$name"
-		;;
-	      -L*)
-		func_stripname -L '' "$deplib"
-		func_replace_sysroot "$func_stripname_result"
-		func_append newdependency_libs " -L$func_replace_sysroot_result"
+		newdependency_libs="$newdependency_libs $libdir/$name"
 		;;
-	      -R*)
-		func_stripname -R '' "$deplib"
-		func_replace_sysroot "$func_stripname_result"
-		func_append newdependency_libs " -R$func_replace_sysroot_result"
-		;;
-	      *) func_append newdependency_libs " $deplib" ;;
+	      *) newdependency_libs="$newdependency_libs $deplib" ;;
 	      esac
 	    done
 	    dependency_libs="$newdependency_libs"
@@ -9309,9 +8079,9 @@ EOF
 		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
 		test -z "$libdir" && \
 		  func_fatal_error "\`$lib' is not a valid libtool archive"
-		func_append newdlfiles " ${lt_sysroot:+=}$libdir/$name"
+		newdlfiles="$newdlfiles $libdir/$name"
 		;;
-	      *) func_append newdlfiles " $lib" ;;
+	      *) newdlfiles="$newdlfiles $lib" ;;
 	      esac
 	    done
 	    dlfiles="$newdlfiles"
@@ -9328,7 +8098,7 @@ EOF
 		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
 		test -z "$libdir" && \
 		  func_fatal_error "\`$lib' is not a valid libtool archive"
-		func_append newdlprefiles " ${lt_sysroot:+=}$libdir/$name"
+		newdlprefiles="$newdlprefiles $libdir/$name"
 		;;
 	      esac
 	    done
@@ -9340,7 +8110,7 @@ EOF
 		[\\/]* | [A-Za-z]:[\\/]*) abs="$lib" ;;
 		*) abs=`pwd`"/$lib" ;;
 	      esac
-	      func_append newdlfiles " $abs"
+	      newdlfiles="$newdlfiles $abs"
 	    done
 	    dlfiles="$newdlfiles"
 	    newdlprefiles=
@@ -9349,33 +8119,15 @@ EOF
 		[\\/]* | [A-Za-z]:[\\/]*) abs="$lib" ;;
 		*) abs=`pwd`"/$lib" ;;
 	      esac
-	      func_append newdlprefiles " $abs"
+	      newdlprefiles="$newdlprefiles $abs"
 	    done
 	    dlprefiles="$newdlprefiles"
 	  fi
 	  $RM $output
 	  # place dlname in correct position for cygwin
-	  # In fact, it would be nice if we could use this code for all target
-	  # systems that can't hard-code library paths into their executables
-	  # and that have no shared library path variable independent of PATH,
-	  # but it turns out we can't easily determine that from inspecting
-	  # libtool variables, so we have to hard-code the OSs to which it
-	  # applies here; at the moment, that means platforms that use the PE
-	  # object format with DLL files.  See the long comment at the top of
-	  # tests/bindir.at for full details.
 	  tdlname=$dlname
 	  case $host,$output,$installed,$module,$dlname in
-	    *cygwin*,*lai,yes,no,*.dll | *mingw*,*lai,yes,no,*.dll | *cegcc*,*lai,yes,no,*.dll)
-	      # If a -bindir argument was supplied, place the dll there.
-	      if test "x$bindir" != x ;
-	      then
-		func_relative_path "$install_libdir" "$bindir"
-		tdlname=$func_relative_path_result$dlname
-	      else
-		# Otherwise fall back on heuristic.
-		tdlname=../bin/$dlname
-	      fi
-	      ;;
+	    *cygwin*,*lai,yes,no,*.dll | *mingw*,*lai,yes,no,*.dll | *cegcc*,*lai,yes,no,*.dll) tdlname=../bin/$dlname ;;
 	  esac
 	  $ECHO > $output "\
 # $outputname - a libtool library file
@@ -9434,7 +8186,7 @@ relink_command=\"$relink_command\""
     exit $EXIT_SUCCESS
 }
 
-{ test "$opt_mode" = link || test "$opt_mode" = relink; } &&
+{ test "$mode" = link || test "$mode" = relink; } &&
     func_mode_link ${1+"$@"}
 
 
@@ -9454,9 +8206,9 @@ func_mode_uninstall ()
     for arg
     do
       case $arg in
-      -f) func_append RM " $arg"; rmforce=yes ;;
-      -*) func_append RM " $arg" ;;
-      *) func_append files " $arg" ;;
+      -f) RM="$RM $arg"; rmforce=yes ;;
+      -*) RM="$RM $arg" ;;
+      *) files="$files $arg" ;;
       esac
     done
 
@@ -9465,23 +8217,24 @@ func_mode_uninstall ()
 
     rmdirs=
 
+    origobjdir="$objdir"
     for file in $files; do
       func_dirname "$file" "" "."
       dir="$func_dirname_result"
       if test "X$dir" = X.; then
-	odir="$objdir"
+	objdir="$origobjdir"
       else
-	odir="$dir/$objdir"
+	objdir="$dir/$origobjdir"
       fi
       func_basename "$file"
       name="$func_basename_result"
-      test "$opt_mode" = uninstall && odir="$dir"
+      test "$mode" = uninstall && objdir="$dir"
 
-      # Remember odir for removal later, being careful to avoid duplicates
-      if test "$opt_mode" = clean; then
+      # Remember objdir for removal later, being careful to avoid duplicates
+      if test "$mode" = clean; then
 	case " $rmdirs " in
-	  *" $odir "*) ;;
-	  *) func_append rmdirs " $odir" ;;
+	  *" $objdir "*) ;;
+	  *) rmdirs="$rmdirs $objdir" ;;
 	esac
       fi
 
@@ -9507,17 +8260,18 @@ func_mode_uninstall ()
 
 	  # Delete the libtool libraries and symlinks.
 	  for n in $library_names; do
-	    func_append rmfiles " $odir/$n"
+	    rmfiles="$rmfiles $objdir/$n"
 	  done
-	  test -n "$old_library" && func_append rmfiles " $odir/$old_library"
+	  test -n "$old_library" && rmfiles="$rmfiles $objdir/$old_library"
 
-	  case "$opt_mode" in
+	  case "$mode" in
 	  clean)
-	    case " $library_names " in
+	    case "  $library_names " in
+	    # "  " in the beginning catches empty $dlname
 	    *" $dlname "*) ;;
-	    *) test -n "$dlname" && func_append rmfiles " $odir/$dlname" ;;
+	    *) rmfiles="$rmfiles $objdir/$dlname" ;;
 	    esac
-	    test -n "$libdir" && func_append rmfiles " $odir/$name $odir/${name}i"
+	    test -n "$libdir" && rmfiles="$rmfiles $objdir/$name $objdir/${name}i"
 	    ;;
 	  uninstall)
 	    if test -n "$library_names"; then
@@ -9545,19 +8299,19 @@ func_mode_uninstall ()
 	  # Add PIC object to the list of files to remove.
 	  if test -n "$pic_object" &&
 	     test "$pic_object" != none; then
-	    func_append rmfiles " $dir/$pic_object"
+	    rmfiles="$rmfiles $dir/$pic_object"
 	  fi
 
 	  # Add non-PIC object to the list of files to remove.
 	  if test -n "$non_pic_object" &&
 	     test "$non_pic_object" != none; then
-	    func_append rmfiles " $dir/$non_pic_object"
+	    rmfiles="$rmfiles $dir/$non_pic_object"
 	  fi
 	fi
 	;;
 
       *)
-	if test "$opt_mode" = clean ; then
+	if test "$mode" = clean ; then
 	  noexename=$name
 	  case $file in
 	  *.exe)
@@ -9567,7 +8321,7 @@ func_mode_uninstall ()
 	    noexename=$func_stripname_result
 	    # $file with .exe has already been added to rmfiles,
 	    # add $file without .exe
-	    func_append rmfiles " $file"
+	    rmfiles="$rmfiles $file"
 	    ;;
 	  esac
 	  # Do a test to see if this is a libtool program.
@@ -9576,7 +8330,7 @@ func_mode_uninstall ()
 	      func_ltwrapper_scriptname "$file"
 	      relink_command=
 	      func_source $func_ltwrapper_scriptname_result
-	      func_append rmfiles " $func_ltwrapper_scriptname_result"
+	      rmfiles="$rmfiles $func_ltwrapper_scriptname_result"
 	    else
 	      relink_command=
 	      func_source $dir/$noexename
@@ -9584,12 +8338,12 @@ func_mode_uninstall ()
 
 	    # note $name still contains .exe if it was in $file originally
 	    # as does the version of $file that was added into $rmfiles
-	    func_append rmfiles " $odir/$name $odir/${name}S.${objext}"
+	    rmfiles="$rmfiles $objdir/$name $objdir/${name}S.${objext}"
 	    if test "$fast_install" = yes && test -n "$relink_command"; then
-	      func_append rmfiles " $odir/lt-$name"
+	      rmfiles="$rmfiles $objdir/lt-$name"
 	    fi
 	    if test "X$noexename" != "X$name" ; then
-	      func_append rmfiles " $odir/lt-${noexename}.c"
+	      rmfiles="$rmfiles $objdir/lt-${noexename}.c"
 	    fi
 	  fi
 	fi
@@ -9597,6 +8351,7 @@ func_mode_uninstall ()
       esac
       func_show_eval "$RM $rmfiles" 'exit_status=1'
     done
+    objdir="$origobjdir"
 
     # Try to remove the ${objdir}s in the directories where we deleted files
     for dir in $rmdirs; do
@@ -9608,16 +8363,16 @@ func_mode_uninstall ()
     exit $exit_status
 }
 
-{ test "$opt_mode" = uninstall || test "$opt_mode" = clean; } &&
+{ test "$mode" = uninstall || test "$mode" = clean; } &&
     func_mode_uninstall ${1+"$@"}
 
-test -z "$opt_mode" && {
+test -z "$mode" && {
   help="$generic_help"
   func_fatal_help "you must specify a MODE"
 }
 
 test -z "$exec_cmd" && \
-  func_fatal_help "invalid operation mode \`$opt_mode'"
+  func_fatal_help "invalid operation mode \`$mode'"
 
 if test -n "$exec_cmd"; then
   eval exec "$exec_cmd"
