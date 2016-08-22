# $NetBSD: Makefile,v 1.5 2014/07/30 13:33:55 schmonz Exp $

DISTNAME=	rustc-1.11.0-src
PKGNAME=	${DISTNAME:S/rustc/rust/:S/-src//}
CATEGORIES=	lang
MASTER_SITES=	http://static.rust-lang.org/dist/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.rust-lang.org/
COMMENT=	Safe, concurrent, practical language
LICENSE=	mit OR apache-2.0

WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}

USE_GCC_RUNTIME=	yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		bash gmake xz

HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--mandir=${PREFIX}/${PKGMANDIR}
CONFIGURE_ARGS+=	--disable-jemalloc
CONFIGURE_ARGS+=	--release-channel=stable
CONFIGURE_ENV+=		CFG_DISABLE_CODEGEN_TESTS=1

REPLACE_BASH+=	src/rust-installer/gen-install-script.sh
REPLACE_BASH+=	src/rust-installer/gen-installer.sh

#
# Lots of per-platform specific documentation, e.g. for each system call,
# making it difficult to PLIST.  If it ends up being important we'll just have
# to go with lots of PLIST.${OPSYS}
#
CONFIGURE_ARGS+=	--disable-docs

# Must match llvm.
GCC_REQD+=	4.8

TEST_TARGET=	check

.include "../../mk/bsd.prefs.mk"

#
# Rust unfortunately requires itself to build.  On platforms which aren't
# supported by upstream (where they offer binary bootstraps), or where we
# do not trust random binaries from the Internet, we need to build and
# provide our own bootstrap.
#
# pkgsrc can be used to do this, but the resulting bootstrap must be
# relocatable (i.e. $ORIGIN) and not depend on anything from pkgsrc (so it
# is common to use rust's internal llvm).
#
# The following variables need to be modified/commented out when producing
# a stage2 bootstrap.
#
CONFIGURE_ARGS+=	--enable-local-rust
CONFIGURE_ARGS+=	--local-rust-root=${WRKDIR}/stage2
# XXX: not working
#CONFIGURE_ARGS+=	--llvm-root=${BUILDLINK_PREFIX.llvm}
#.include "../../lang/llvm/buildlink3.mk"
#
.if !empty(MACHINE_PLATFORM:MDarwin-*-i386)
RUST_ARCH=		i686-apple-darwin
RUST_STAGE2_ARCH=	macos-i386
.elif !empty(MACHINE_PLATFORM:MDarwin-*-x86_64)
RUST_ARCH=		x86_64-apple-darwin
RUST_STAGE2_ARCH=	macos-x86_64
.elif !empty(MACHINE_PLATFORM:MLinux-*-i386)
RUST_ARCH=		i686-unknown-linux-gnu
RUST_STAGE2_ARCH=	linux-i386
.elif !empty(MACHINE_PLATFORM:MLinux-*-x86_64)
RUST_ARCH=		x86_64-unknown-linux-gnu
RUST_STAGE2_ARCH=	linux-x86_64
.elif !empty(MACHINE_PLATFORM:MSunOS-*-x86_64)
RUST_ARCH=		x86_64-sun-solaris
RUST_STAGE2_ARCH=	solaris-x86_64
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

RUST_STAGE2?=		rust-110-stage2-${RUST_STAGE2_ARCH}.tar.xz
DISTFILES=		${DEFAULT_DISTFILES} ${RUST_STAGE2}
SITES.${RUST_STAGE2}?=	https://us-east.manta.joyent.com/pkgsrc/public/tmp/

RUST_VERHASH=		39b92f95
PLIST_SUBST+=		RUST_ARCH=${RUST_ARCH:Q}
PLIST_SUBST+=		RUST_VERHASH=${RUST_VERHASH:Q}
PLIST_SUBST+=		SOEXT=${SOEXT:Q}
PRINT_PLIST_AWK+=	{ gsub(/${RUST_ARCH}/, "$${RUST_ARCH}") }
PRINT_PLIST_AWK+=	{ gsub(/${RUST_VERHASH}/, "$${RUST_VERHASH}") }
PRINT_PLIST_AWK+=	{ gsub(/\.${SOEXT}/, ".$${SOEXT}") }

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

post-install:
	${RM} -f ${DESTDIR}${PREFIX}/lib/rustlib/install.log

.include "../../devel/cmake/buildlink3.mk"
.include "../../lang/python/tool.mk"
.include "../../mk/bsd.pkg.mk"
