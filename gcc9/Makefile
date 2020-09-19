# $NetBSD$
#
# This is a modified version of lang/gcc9 specific for SmartOS:
#
#   - The upstream tarball is the combined il-* patchset from OmniOS
#   - Some patches from the joyent "miscfix" branch are integrated.
#   - Sections for non-SunOS are removed for clarity.
#   - Every modification from the stock build should be clearly documented.
#

DISTNAME=	gcc9-9.3.0
CATEGORIES=	joyent lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=omniosorg/}
GITHUB_PROJECT=	gcc
GITHUB_TAG=	038ec0d78529e36af568643e799bb1c01e9f1ad0

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://gcc.gnu.org/
COMMENT=	The GNU Compiler Collection (GCC) - 9.x Release Series
LICENSE=	gnu-gpl-v2 AND gnu-gpl-v3 AND gnu-lgpl-v2 AND gnu-lgpl-v3

USE_LANGUAGES=	c99 c++
USE_TOOLS+=	flex gmake m4 makeinfo perl sed:run tar:build

GNU_CONFIGURE=		yes
GNU_CONFIGURE_STRICT=	no

#
# Perform the build outside of ${WRKSRC}
#
WRKSRC=			${WRKDIR}/gcc-${GITHUB_TAG}
OBJDIR=			../build
CONFIGURE_DIRS=		${OBJDIR}
CONFIGURE_SCRIPT=	../gcc-${GITHUB_TAG}/configure

GCC_PREFIX=		${PREFIX}/${PKGBASE}
GNU_CONFIGURE_PREFIX=	${GCC_PREFIX}

SUBST_CLASSES+=		vars
SUBST_STAGE.vars=	pre-configure
SUBST_FILES.vars=	gcc/Makefile.in
SUBST_VARS.vars=	MACHINE_GNU_PLATFORM

.include "../../mk/bsd.prefs.mk"

#
# Usually we want GCC to default to searching PREFIX for headers/libraries
# but sometimes, specifically in the tools build, we can't do that as then libs
# will leak from there into the non-tools builds (e.g. libiconv).
#
# Headers are handled by the --with-local-prefix configure argument, libraries by
# a patch to gcc/config/sol2.h.  When not using PREFIX the patch needs to be
# undone.
#
SUBST_CLASSES+=		libpath
SUBST_STAGE.libpath=	pre-configure
SUBST_FILES.libpath=	gcc/config/sol2.h
SUBST_NOOP_OK.libpath=	yes
SUBST_SED.libpath=

.if ${USE_GCC_LOCALBASE_PREFIX:Uno:tl} == "yes"
CONFIGURE_ARGS+=	--with-local-prefix=${PREFIX:Q}
.else
CONFIGURE_ARGS+=	--with-local-prefix=${GCC_PREFIX:Q}
SUBST_SED.libpath+=	-e '/-R@PREFIX@/d'
SUBST_SED.libpath+=	-e 's/:%R@PREFIX@[^}]*//'
.endif

#
# Disable fixincludes on SmartOS, header changes result in broken includes
# being generated, see https://github.com/joyent/pkgsrc-legacy/issues/270
#
# It's not 100% clear why other distributions do not do this, but is more than
# likely due to them building on newer platforms.
#
SUBST_CLASSES+=		fixinc
SUBST_STAGE.fixinc=	pre-configure
SUBST_FILES.fixinc=	gcc/Makefile.in
SUBST_SED.fixinc=	-e "s,\./fixinc.sh,-c true,"

#
# SmartOS puts elfdump in /usr/bin, this should really be patched in the script
# and sent upstream or integrated into the il-* patchset.
#
SUBST_CLASSES+=		ccs
SUBST_STAGE.ccs=	pre-configure
SUBST_FILES.ccs=	contrib/make_sunver.pl
SUBST_SED.ccs=		-e 's,/usr/ccs/bin,/usr/bin,g'

#
# Try to ensure a clean build where possible, unaffected by our general
# compiler flags.
#
CLEAN_GCC_CFLAGS=	-pipe -g -O2
CONFIGURE_ENV+=		STAGE1_CFLAGS=${CLEAN_GCC_CFLAGS:Q}
CONFIGURE_ENV+=		STAGE1_LDFLAGS=
CONFIGURE_ENV+=		CFLAGS_FOR_TARGET=${CLEAN_GCC_CFLAGS:Q}
CONFIGURE_ENV+=		LDFLAGS_FOR_TARGET=

CONFIGURE_ARGS+=	--enable-languages="c,c++,fortran,go,objc,lto"
CONFIGURE_ARGS+=	--enable-libssp
CONFIGURE_ARGS+=	--with-gnu-as --with-as=${PREFIX}/bin/gas
CONFIGURE_ARGS+=	--without-gnu-ld --with-ld=/bin/ld
CONFIGURE_ARGS+=	--disable-nls
CONFIGURE_ARGS+=	--disable-libitm

#
# Things to possibly enable in the future.
#
#CONFIGURE_ARGS+=	--enable-initfini-array		# Needs newer platform

#
# Disable --as-needed as it pulls in libgcc_s as a dependency into libstdc++
#
MAKE_ENV+=		gcc_cv_ld_as_needed=no

UNLIMIT_RESOURCES+=	datasize
UNLIMIT_RESOURCES+=	stacksize

FILES_SUBST+=		MACHINE_GNU_PLATFORM=${MACHINE_GNU_PLATFORM}
FILES_SUBST+=		PKGVERSION_NOREV=${PKGVERSION_NOREV}

PRINT_PLIST_AWK+=	{ gsub(/${MACHINE_GNU_PLATFORM}/, "$${MACHINE_GNU_PLATFORM}"); }

CHECK_PORTABILITY_SKIP+=	contrib/*
CHECK_SSP_SUPPORTED=		no		# Clean CFLAGS removes -fstack*
CTF_FILES_SKIP+=		*/gengtype	# Causes ctfconvert to hang

INFO_FILES=		yes

pre-configure:
	${RUN} cd ${WRKSRC} && ${MKDIR} ${OBJDIR}

TEST_TARGET=	-j ${MAKE_JOBS} -k check
TEST_DEPENDS+=	dejagnu-[0-9]*:../../devel/dejagnu

post-test:
	${RUN} cd ${WRKSRC} && cd ${OBJDIR} &&		\
	${SHELL} ${WRKSRC}/contrib/test_summary >${WRKDIR}/test_summary.log
	${INFO_MSG} "Test summary are available in ${WRKDIR}/test_summary.log"

post-install:
	${TEST} -f ${DESTDIR}${GCC_PREFIX}/bin/cc || \
		( cd ${DESTDIR}${GCC_PREFIX}/bin ; ${LN} -f gcc cc )

BUILDLINK_DEPMETHOD.binutils=	full
.include "../../devel/binutils/buildlink3.mk"
.include "../../devel/gmp/inplace.mk"
.include "../../math/mpcomplex/inplace.mk"
.include "../../math/mpfr/inplace.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
