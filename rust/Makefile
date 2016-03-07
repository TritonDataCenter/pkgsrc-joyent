# $NetBSD: Makefile,v 1.5 2014/07/30 13:33:55 schmonz Exp $

RUST_VERSION=	1.8.0
#DISTNAME=	rustc-${RUST_VERSION}-src
DISTNAME=	rustc-beta-src
PKGNAME=	rust-${RUST_VERSION}pre1
CATEGORIES=	lang
MASTER_SITES=	http://static.rust-lang.org/dist/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.rust-lang.org/
COMMENT=	Safe, concurrent, practical language
LICENSE=	mit OR apache-2.0

WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}

USE_LANGUAGES=	c c++
USE_TOOLS+=	bash gmake # perl

HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--mandir=${PREFIX}/${PKGMANDIR}
CONFIGURE_ARGS+=	--llvm-root=${BUILDLINK_PREFIX.libLLVM}
CONFIGURE_ARGS+=	--disable-jemalloc

#MAKE_ENV+=	VERBOSE=1

REPLACE_BASH+=	src/rust-installer/gen-install-script.sh
REPLACE_BASH+=	src/rust-installer/gen-installer.sh

#
# Lots of per-platform specific documentation, e.g. for each system call,
# making it difficult to PLIST.  If it ends up being important we'll just have
# to go with lots of PLIST.${OPSYS}
#
CONFIGURE_ARGS+=	--disable-docs

# Must match libLLVM.
GCC_REQD+=	4.8

TEST_TARGET=	check

.include "../../mk/bsd.prefs.mk"

#
# Rust requires a binary stage0 kit to build itself, currently supported
# only on a limited number of platforms.  Details of the arch name and
# sha1 for supported platforms are kept in src/snapshots.txt
#
.if !empty(MACHINE_PLATFORM:MDarwin-*-i386)
RUST_ARCH=		i686-apple-darwin
RUST_STAGE0_ARCH=	macos-i386
RUST_STAGE0_SHA=	ca52d2d3ba6497ed007705ee3401cf7efc136ca1
.elif !empty(MACHINE_PLATFORM:MDarwin-*-x86_64)
RUST_ARCH=		x86_64-apple-darwin
RUST_STAGE0_ARCH=	macos-x86_64
RUST_STAGE0_SHA=	3c44ffa18f89567c2b81f8d695e711c86d81ffc7
.elif !empty(MACHINE_PLATFORM:MLinux-*-i386)
RUST_ARCH=		i686-unknown-linux-gnu
RUST_STAGE0_ARCH=	linux-i386
RUST_STAGE0_SHA=	a09c4a4036151d0cb28e265101669731600e01f2
.elif !empty(MACHINE_PLATFORM:MLinux-*-x86_64)
RUST_ARCH=		x86_64-unknown-linux-gnu
RUST_STAGE0_ARCH=	linux-x86_64
RUST_STAGE0_SHA=	97e2a5eb8904962df8596e95d6e5d9b574d73bf4
.elif !empty(MACHINE_PLATFORM:MSunOS-*-x86_64)
RUST_ARCH=		x86_64-sun-solaris
#CONFIGURE_ARGS+=	--enable-local-rust
#CONFIGURE_ARGS+=	--local-rust-root=/var/tmp/x86_64-sun-solaris
#CONFIGURE_ENV+=		ac_cv_have_decl_arc4random=no # avoid ILLUMOS_0.12
RUST_STAGE0_ARCH=	solaris-x86_64
RUST_STAGE0_SHA=	f2b346f48520dad54c77fc9a60d8c331c7b2bc31
SITES.${RUST_STAGE0}=	https://us-east.manta.joyent.com/pkgsrc/public/tmp/
.else
NOT_FOR_PLATFORM+=	${MACHINE_PLATFORM}
.endif

PLIST_SRC=		PLIST
.if ${OPSYS} == "Darwin"
PLIST_SRC+=		PLIST.lldb
.else
PLIST_SRC+=		PLIST.gdb
.endif

OPSYSVARS+=		SOEXT
SOEXT.Darwin=		dylib
SOEXT.*=		so

PLIST_VARS+=		jemalloc

CONFIGURE_ARGS+=	--build=${RUST_ARCH}

EXTRACT_ONLY=		${DEFAULT_DISTFILES}
RUST_STAGE0?=		rust-stage0-2016-02-17-4d3eebf-${RUST_STAGE0_ARCH}-${RUST_STAGE0_SHA}.tar.bz2
DISTFILES=		${DEFAULT_DISTFILES} ${RUST_STAGE0}
SITES.${RUST_STAGE0}?=	https://static.rust-lang.org/stage0-snapshots/

RUST_VERHASH=		db5a760f
PLIST_SUBST+=		RUST_ARCH=${RUST_ARCH:Q}
PLIST_SUBST+=		RUST_VERHASH=${RUST_VERHASH:Q}
PLIST_SUBST+=		SOEXT=${SOEXT:Q}
PRINT_PLIST_AWK+=	{ gsub(/${RUST_ARCH}/, "$${RUST_ARCH}") }
PRINT_PLIST_AWK+=	{ gsub(/${RUST_VERHASH}/, "$${RUST_VERHASH}") }
PRINT_PLIST_AWK+=	{ gsub(/\.${SOEXT}/, ".$${SOEXT}") }

post-extract:
	${MKDIR} ${WRKSRC}/dl
	${CP} ${DISTDIR}/${RUST_STAGE0} ${WRKSRC}/dl

.if ${OPSYS} == "SunOS"
BUILD_DEPENDS+=		grep>=0:../../textproc/grep
BUILD_DEPENDS+=		coreutils>=0:../../sysutils/coreutils
TOOLS_PATH.grep=	${PREFIX}/bin/ggrep
TOOLS_CREATE+=		md5sum
TOOLS_PATH.md5sum=	${PREFIX}/bin/gmd5sum

SUBST_CLASSES+=		ranlib
SUBST_STAGE.ranlib=	pre-configure
SUBST_FILES.ranlib=	mk/rt.mk
SUBST_SED.ranlib=	-e 's,RANLIB=.* \\,RANLIB="true" \\,g'
.endif

snapshot:
	${RUN} cd ${WRKSRC:Q} && ${BUILD_MAKE_CMD} snap-stage3

post-install:
	${RM} -f ${DESTDIR}${PREFIX}/lib/rustlib/install.log

.include "../../lang/python/tool.mk"
.include "../../lang/libLLVM/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
