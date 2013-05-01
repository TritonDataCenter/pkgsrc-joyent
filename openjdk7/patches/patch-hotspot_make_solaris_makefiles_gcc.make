$NetBSD$

--- hotspot/make/solaris/makefiles/gcc.make.orig	2013-02-19 23:21:59.000000000 +0000
+++ hotspot/make/solaris/makefiles/gcc.make
@@ -27,36 +27,39 @@
 
 # If a SPEC is not set already, then use these defaults.
 ifeq ($(SPEC),)
-  CXX = g++
-  CC  = gcc
+  # When cross-compiling the ALT_COMPILER_PATH points
+  # to the cross-compilation toolset
+  ifdef CROSS_COMPILE_ARCH
+    CXX = $(ALT_COMPILER_PATH)/g++
+    CC  = $(ALT_COMPILER_PATH)/gcc
+    HOSTCXX = g++
+    HOSTCC  = gcc
+    STRIP = $(ALT_COMPILER_PATH)/strip
+  else
+    CXX = g++
+    CC  = gcc
+    HOSTCXX = $(CXX)
+    HOSTCC  = $(CC)
+    STRIP = /usr/bin/strip
+    MCS = /usr/bin/mcs
+  endif
   AS  = $(CC) -c
-  MCS = /usr/ccs/bin/mcs
+  NAWK  = /bin/nawk
 endif
 
-Compiler = gcc
-
 # -dumpversion in gcc-2.91 shows "egcs-2.91.66". In later version, it only
 # prints the numbers (e.g. "2.95", "3.2.1")
 CC_VER_MAJOR := $(shell $(CC) -dumpversion | sed 's/egcs-//' | cut -d'.' -f1)
 CC_VER_MINOR := $(shell $(CC) -dumpversion | sed 's/egcs-//' | cut -d'.' -f2)
 
-# Check for the versions of C++ and C compilers ($CXX and $CC) used. 
-
-# Get the last thing on the line that looks like x.x+ (x is a digit).
-COMPILER_REV := \
-$(shell $(CXX) -dumpversion | sed 's/egcs-//' | cut -d'.' -f1)
-CC_COMPILER_REV := \
-$(shell $(CC) -dumpversion | sed 's/egcs-//' | cut -d'.' -f2)
-
-
 # check for precompiled headers support
 ifneq "$(shell expr \( $(CC_VER_MAJOR) \> 3 \) \| \( \( $(CC_VER_MAJOR) = 3 \) \& \( $(CC_VER_MINOR) \>= 4 \) \))" "0"
-# Allow the user to turn off precompiled headers from the command line.
-ifneq ($(USE_PRECOMPILED_HEADER),0)
-PRECOMPILED_HEADER_DIR=.
-PRECOMPILED_HEADER_SRC=$(GAMMADIR)/src/share/vm/precompiled/precompiled.hpp
-PRECOMPILED_HEADER=$(PRECOMPILED_HEADER_DIR)/precompiled.hpp.gch
-endif
+  # Allow the user to turn off precompiled headers from the command line.
+  ifneq ($(USE_PRECOMPILED_HEADER),0)
+    PRECOMPILED_HEADER_DIR=.
+    PRECOMPILED_HEADER_SRC=$(GAMMADIR)/src/share/vm/precompiled/precompiled.hpp
+    PRECOMPILED_HEADER=$(PRECOMPILED_HEADER_DIR)/precompiled.hpp.gch
+  endif
 endif
 
 
@@ -70,19 +73,35 @@ VM_PICFLAG/LIBJVM = $(PICFLAG)
 VM_PICFLAG/AOUT   =
 VM_PICFLAG        = $(VM_PICFLAG/$(LINK_INTO))
 
+ifeq ($(JVM_VARIANT_ZERO), true)
+  CFLAGS += $(LIBFFI_CFLAGS)
+endif
+ifeq ($(JVM_VARIANT_ZEROSHARK), true)
+  CFLAGS += $(LIBFFI_CFLAGS)
+  CFLAGS += $(LLVM_CFLAGS)
+endif
 CFLAGS += $(VM_PICFLAG)
 CFLAGS += -fno-rtti
 CFLAGS += -fno-exceptions
 CFLAGS += -D_REENTRANT
 CFLAGS += -fcheck-new
+# version 4 and above support fvisibility=hidden (matches jni_x86.h file)
+# except 4.1.2 gives pointless warnings that can't be disabled (afaik)
+ifneq "$(shell expr \( $(CC_VER_MAJOR) \> 4 \) \| \( \( $(CC_VER_MAJOR) = 4 \) \& \( $(CC_VER_MINOR) \>= 3 \) \))" "0"
+  CFLAGS += -fvisibility=hidden
+endif
 
 ARCHFLAG = $(ARCHFLAG/$(BUILDARCH))
-
-ARCHFLAG/sparc   = -m32 -mcpu=v9
-ARCHFLAG/sparcv9 = -m64 -mcpu=v9
 ARCHFLAG/i486    = -m32 -march=i586
 ARCHFLAG/amd64   = -m64 -march=k8
-
+ARCHFLAG/ia64    =
+ARCHFLAG/sparc   = -m32 -mcpu=v9
+ARCHFLAG/sparcv9 = -m64 -mcpu=v9
+ARCHFLAG/arm     =  -fsigned-char
+ARCHFLAG/zero    = $(ZERO_ARCHFLAG)
+ifndef E500V2
+  ARCHFLAG/ppc     =  -mcpu=powerpc
+endif
 
 # Optional sub-directory in /usr/lib where BUILDARCH libraries are kept.
 ISA_DIR=$(ISA_DIR/$(BUILDARCH))
@@ -90,23 +109,26 @@ ISA_DIR/amd64=/amd64
 ISA_DIR/i486=
 ISA_DIR/sparcv9=/64
 
-
 CFLAGS     += $(ARCHFLAG)
 AOUT_FLAGS += $(ARCHFLAG)
 LFLAGS     += $(ARCHFLAG)
 ASFLAGS    += $(ARCHFLAG)
 
 ifeq ($(BUILDARCH), amd64)
-ASFLAGS += -march=k8  -march=amd64
-LFLAGS += -march=k8 
+  ASFLAGS += -march=k8  -march=amd64
+  LFLAGS += -march=k8 
 endif
 
-
 # Use C++ Interpreter
 ifdef CC_INTERP
   CFLAGS += -DCC_INTERP
 endif
 
+# Build for embedded targets
+ifdef JAVASE_EMBEDDED
+  CFLAGS += -DJAVASE_EMBEDDED
+endif
+
 # Keep temporary files (.ii, .s)
 ifdef NEED_ASM
   CFLAGS += -save-temps
@@ -117,9 +139,18 @@ endif
 
 # Compiler warnings are treated as errors 
 WARNINGS_ARE_ERRORS = -Werror 
-# Enable these warnings. See 'info gcc' about details on these options
-ADDITIONAL_WARNINGS = -Wpointer-arith -Wconversion -Wsign-compare 
-CFLAGS_WARN/DEFAULT = $(WARNINGS_ARE_ERRORS) $(ADDITIONAL_WARNINGS) 
+
+# Except for a few acceptable ones
+# Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
+# conversions which might affect the values. To avoid that, we need to turn
+# it off explicitly. 
+ifneq "$(shell expr \( $(CC_VER_MAJOR) \> 4 \) \| \( \( $(CC_VER_MAJOR) = 4 \) \& \( $(CC_VER_MINOR) \>= 3 \) \))" "0"
+  ACCEPTABLE_WARNINGS = -Wpointer-arith -Wsign-compare
+else
+  ACCEPTABLE_WARNINGS = -Wpointer-arith -Wconversion -Wsign-compare
+endif
+
+CFLAGS_WARN/DEFAULT = $(WARNINGS_ARE_ERRORS) $(ACCEPTABLE_WARNINGS)
 # Special cases 
 CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@))  
 
@@ -134,19 +165,24 @@ OPT_CFLAGS += -fno-strict-aliasing
 # Note: all ia64 setting reflect the ones for linux
 # No actial testing was performed: there is no Solaris on ia64 presently
 ifeq ($(BUILDARCH), ia64)
-OPT_CFLAGS/bytecodeInterpreter.o += -fno-expensive-optimizations
+  OPT_CFLAGS/bytecodeInterpreter.o += -fno-expensive-optimizations
 endif
 
 OPT_CFLAGS/NOOPT=-O0
 
+# 6835796. Problem in GCC 4.3.0 with mulnode.o optimized compilation. 
+ifneq "$(shell expr \( \( $(CC_VER_MAJOR) = 4 \) \& \( $(CC_VER_MINOR) = 3 \) \))" "0"
+  OPT_CFLAGS/mulnode.o += -O0
+endif
+
 # Flags for generating make dependency flags.
 ifneq ("${CC_VER_MAJOR}", "2")
-DEPFLAGS = -fpch-deps -MMD -MP -MF $(DEP_DIR)/$(@:%=%.d)
+  DEPFLAGS = -fpch-deps -MMD -MP -MF $(DEP_DIR)/$(@:%=%.d)
 endif
 
 # -DDONT_USE_PRECOMPILED_HEADER will exclude all includes in precompiled.hpp.
 ifeq ($(USE_PRECOMPILED_HEADER),0)
-CFLAGS += -DDONT_USE_PRECOMPILED_HEADER
+  CFLAGS += -DDONT_USE_PRECOMPILED_HEADER
 endif
 
 #------------------------------------------------------------------------
@@ -157,27 +193,28 @@ STATIC_STDCXX = -Wl,-Bstatic -lstdc++ -W
 
 # statically link libgcc and/or libgcc_s, libgcc does not exist before gcc-3.x.
 ifneq ("${CC_VER_MAJOR}", "2")
-STATIC_LIBGCC += -static-libgcc
+  STATIC_LIBGCC += -static-libgcc
 endif
 
 ifeq ($(BUILDARCH), ia64)
-# Note: all ia64 setting reflect the ones for linux
-# No actial testing was performed: there is no Solaris on ia64 presently
-LFLAGS += -Wl,-relax
+  # Note: all ia64 setting reflect the ones for linux
+  # No actial testing was performed: there is no Solaris on ia64 presently
+  LFLAGS += -Wl,-relax
 endif
 
 ifdef USE_GNULD
-# Enable linker optimization
-LFLAGS += -Xlinker -O1
+  # Enable linker optimization
+  LFLAGS += -Xlinker -O1
 
-# Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
-MAPFLAG = -Xlinker --version-script=FILENAME 
+  # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
+  MAPFLAG = -Xlinker --version-script=FILENAME 
 else 
-MAPFLAG = -Xlinker -M -Xlinker FILENAME 
+  # in the case of Illumos ld
+  MAPFLAG = -Xlinker -M -Xlinker FILENAME 
 endif 
 
 # Use $(SONAMEFLAG:SONAME=soname) to specify the intrinsic name of a shared obj
-SONAMEFLAG = -Xlinker -soname=SONAME
+SONAMEFLAG = -Wl,-soname=SONAME
 
 # Build shared library
 SHARED_FLAG = -shared
@@ -185,15 +222,54 @@ SHARED_FLAG = -shared
 #------------------------------------------------------------------------
 # Debug flags
 
-# Use the stabs format for debugging information (this is the default 
-# on gcc-2.91). It's good enough, has all the information about line 
-# numbers and local variables, and libjvm_g.so is only about 16M. 
-# Change this back to "-g" if you want the most expressive format. 
-# (warning: that could easily inflate libjvm_g.so to 150M!) 
-# Note: The Itanium gcc compiler crashes when using -gstabs. 
-DEBUG_CFLAGS/ia64  = -g 
-DEBUG_CFLAGS/amd64 = -g 
-DEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH)) 
-ifeq ($(DEBUG_CFLAGS/$(BUILDARCH)),) 
-DEBUG_CFLAGS += -gstabs 
-endif 
+# DEBUG_BINARIES uses full -g debug information for all configs
+ifeq ($(DEBUG_BINARIES), true)
+  CFLAGS += -g
+else
+  # Use the stabs format for debugging information (this is the default
+  # on gcc-2.91). It's good enough, has all the information about line
+  # numbers and local variables, and libjvm_g.so is only about 16M.
+  # Change this back to "-g" if you want the most expressive format.
+  # (warning: that could easily inflate libjvm_g.so to 150M!)
+  # Note: The Itanium gcc compiler crashes when using -gstabs.
+  DEBUG_CFLAGS/ia64  = -g
+  DEBUG_CFLAGS/amd64 = -g
+  DEBUG_CFLAGS/arm   = -g
+  DEBUG_CFLAGS/ppc   = -g
+  DEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
+  ifeq ($(DEBUG_CFLAGS/$(BUILDARCH)),)
+    DEBUG_CFLAGS += -gstabs
+  endif
+
+  ifeq ($(ENABLE_FULL_DEBUG_SYMBOLS),1)
+    FASTDEBUG_CFLAGS/ia64  = -g
+    FASTDEBUG_CFLAGS/amd64 = -g
+    FASTDEBUG_CFLAGS/arm   = -g
+    FASTDEBUG_CFLAGS/ppc   = -g
+    FASTDEBUG_CFLAGS += $(DEBUG_CFLAGS/$(BUILDARCH))
+    ifeq ($(FASTDEBUG_CFLAGS/$(BUILDARCH)),)
+      FASTDEBUG_CFLAGS += -gstabs
+    endif
+
+    OPT_CFLAGS/ia64  = -g
+    OPT_CFLAGS/amd64 = -g
+    OPT_CFLAGS/arm   = -g
+    OPT_CFLAGS/ppc   = -g
+    OPT_CFLAGS += $(OPT_CFLAGS/$(BUILDARCH))
+    ifeq ($(OPT_CFLAGS/$(BUILDARCH)),)
+      OPT_CFLAGS += -gstabs
+    endif
+  endif
+endif
+
+# If we are building HEADLESS, pass on to VM
+# so it can set the java.awt.headless property
+ifdef HEADLESS
+  CFLAGS += -DHEADLESS
+endif
+
+# We are building Embedded for a small device
+# favor code space over speed
+ifdef MINIMIZE_RAM_USAGE
+  CFLAGS += -DMINIMIZE_RAM_USAGE
+endif
