# $NetBSD$

BUILDLINK_TREE+=	gcc10-libs

.if !defined(GCC10_LIBS_BUILDLINK3_MK)
GCC10_LIBS_BUILDLINK3_MK:=

.if !empty(USE_PKGSRC_GCC_RUNTIME:M[Yy][Ee][Ss])
BUILDLINK_API_DEPENDS.gcc10-libs+=	gcc10-libs>=10.4.0
.else
BUILDLINK_API_DEPENDS.gcc10-libs+=	gcc10>=10.4.0
.endif
BUILDLINK_PKGSRCDIR.gcc10-libs=		../../joyent/gcc10-libs
BUILDLINK_DEPMETHOD.gcc10-libs?=	full

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_PREFIX.gcc10-libs}/gcc10

BUILDLINK_FILES.gcc10-libs=	# empty
BUILDLINK_AUTO_VARS.gcc10-libs=	no

.if !empty(USE_PKGSRC_GCC_RUNTIME:M[Yy][Ee][Ss])
# Use custom specs file to ensure we link against pkgsrc libraries.
SPECS_LIBGCC=		${WRAPPER_DIR}/specs.libgcc
WRAPPER_TARGETS+=	${SPECS_LIBGCC}

${SPECS_LIBGCC}:
	@${ECHO} "*link_libgcc:" >${SPECS_LIBGCC}
	@${ECHO} "%D ${LINKER_RPATH_FLAG}${BUILDLINK_PREFIX.gcc10-libs}/gcc10/${MACHINE_GNU_PLATFORM}/lib/%M" >>${SPECS_LIBGCC}

_WRAP_EXTRA_ARGS.CC+=	-specs=${SPECS_LIBGCC}
_WRAP_EXTRA_ARGS.CXX+=	-specs=${SPECS_LIBGCC}
_WRAP_EXTRA_ARGS.FC+=	-specs=${SPECS_LIBGCC}
CWRAPPERS_APPEND.cc+=	-specs=${SPECS_LIBGCC}
CWRAPPERS_APPEND.cxx+=	-specs=${SPECS_LIBGCC}
CWRAPPERS_APPEND.f77+=	-specs=${SPECS_LIBGCC}
.endif

.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.endif

BUILDLINK_TREE+=	-gcc10-libs
