# $NetBSD$

BUILDLINK_TREE+=	gcc9-libs

.if !defined(GCC9_LIBS_BUILDLINK3_MK)
GCC9_LIBS_BUILDLINK3_MK:=

.if !empty(USE_PKGSRC_GCC_RUNTIME:M[Yy][Ee][Ss])
BUILDLINK_API_DEPENDS.gcc9-libs+=	gcc9-libs>=9.3.0
.else
BUILDLINK_API_DEPENDS.gcc9-libs+=	gcc9>=9.3.0
.endif
BUILDLINK_PKGSRCDIR.gcc9-libs=		../../joyent/gcc9-libs
BUILDLINK_DEPMETHOD.gcc9-libs?=		full

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_PREFIX.gcc9-libs}/gcc9

BUILDLINK_FILES.gcc9-libs=	# empty
BUILDLINK_AUTO_VARS.gcc9-libs=	no

.if !empty(USE_PKGSRC_GCC_RUNTIME:M[Yy][Ee][Ss])
# Use custom specs file to ensure we link against pkgsrc libraries.
SPECS_LIBGCC=		${WRAPPER_DIR}/specs.libgcc
WRAPPER_TARGETS+=	${SPECS_LIBGCC}

${SPECS_LIBGCC}:
	@${ECHO} "*link_libgcc:" >${SPECS_LIBGCC}
	@${ECHO} "%D ${LINKER_RPATH_FLAG}${BUILDLINK_PREFIX.gcc9-libs}/gcc9/${MACHINE_GNU_PLATFORM}/lib/%M" >>${SPECS_LIBGCC}

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

BUILDLINK_TREE+=	-gcc9-libs
