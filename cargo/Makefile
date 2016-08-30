# $NetBSD$

DISTNAME=	cargo-0.11.0
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=rust-lang/}
GITHUB_PROJECT=	cargo
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://github.com/rust-lang/cargo/
COMMENT=	Cargo package manager for Rust
LICENSE=	apache-2.0 OR mit

DEPENDS+=	${PYPKGPREFIX}-dulwich>0:../../devel/py-dulwich
DEPENDS+=	${PYPKGPREFIX}-pytoml>0:../../textproc/py-pytoml

#
# Needs additional downloads.
#
DISTFILES=		${DEFAULT_DISTFILES}
#
CARGO_DEPS=		cargo_0.11.0.orig-deps.tar.gz
DISTFILES+=		${CARGO_DEPS}
SITES.${CARGO_DEPS}?=	http://http.debian.net/debian/pool/main/c/cargo/
#
CRATES_SHA=		d1dc46f39403f640188f7840a51924d40ad98ef1
DISTFILES+=		${CRATES_SHA}.tar.gz
SITES.${CRATES_SHA}.tar.gz?= ${MASTER_SITE_GITHUB:=rust-lang/crates.io-index}/archive/
#
INSTALLER_SHA=		755bc3db4ff795865ea31b5b4f38ac920d8acacb
DISTFILES+=		${INSTALLER_SHA}.tar.gz
SITES.${INSTALLER_SHA}.tar.gz?= ${MASTER_SITE_GITHUB:=rust-lang/rust-installer}/archive/

USE_LANGUAGES=		c
USE_TOOLS+=		gmake pkg-config

HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--disable-debug
CONFIGURE_ARGS+=	--enable-optimize
CONFIGURE_ARGS+=	--local-rust-root=${PREFIX}
CONFIGURE_ARGS+=	--local-cargo=${WRKSRC}/cargo-stage0

MAKE_ENV+=	CARGO_HOME=${WRKSRC}/.cargohome
MAKE_ENV+=	LIBGIT2_SYS_USE_PKG_CONFIG=1

EGDIR=		${PREFIX}/share/examples/cargo

CONF_FILES+=	${EGDIR}/bash_completion.d/cargo \
		${PKG_SYSCONFDIR}/bash_completion.d/cargo

.include "../../mk/bsd.prefs.mk"

.if !empty(MACHINE_PLATFORM:MDarwin-*-i386)
RUST_ARCH=		i686-apple-darwin
.elif !empty(MACHINE_PLATFORM:MDarwin-*-x86_64)
RUST_ARCH=		x86_64-apple-darwin
.elif !empty(MACHINE_PLATFORM:MLinux-*-i386)
RUST_ARCH=		i686-unknown-linux-gnu
.elif !empty(MACHINE_PLATFORM:MLinux-*-x86_64)
RUST_ARCH=		x86_64-unknown-linux-gnu
.elif !empty(MACHINE_PLATFORM:MSunOS-*-x86_64)
RUST_ARCH=		x86_64-sun-solaris
.else
NOT_FOR_PLATFORM+=	${MACHINE_PLATFORM}
.endif

post-extract:
	${CP} ${FILESDIR}/bootstrap.py ${WRKDIR}
	${MV} ${WRKDIR}/deps ${WRKSRC}/deps
	${LN} -s ${WRKSRC}/src/crates-io ${WRKSRC}/deps/crates-io-0.2.0
	${RM} -rf ${WRKSRC}/src/rust-installer
	${MV} ${WRKDIR}/rust-installer-${INSTALLER_SHA} ${WRKSRC}/src/rust-installer

${WRKDIR}/.bootstrap_done:
	cd ${WRKSRC} && \
		${MAKE_ENV} ${PYTHONBIN} ${WRKDIR}/bootstrap.py \
	    --no-clean --no-download --no-clone \
	    --crate-index ${WRKDIR}/crates.io-index-${CRATES_SHA}/ \
	    --cargo-root ${WRKSRC}/ \
	    --target-dir ${WRKSRC}/deps/ \
	    --target ${RUST_ARCH}
	# Workaround for https://github.com/rust-lang/cargo/issues/1423
	${MV} ${WRKSRC}/deps ${WRKSRC}/.deps
	${LN} -s ${WRKSRC}/.deps/cargo-${PKGVERSION_NOREV:S/./_/g} ${WRKSRC}/cargo-stage0
	${TOUCH} ${.TARGET}

pre-configure: ${WRKDIR}/.bootstrap_done

post-install:
	for file in components install.log manifest-cargo \
		    rust-installer-version uninstall.sh; do \
		${RM} -f ${DESTDIR}${PREFIX}/lib/rustlib/$${file}; \
	done

.include "../../devel/cmake/buildlink3.mk"
.include "../../devel/libgit2/buildlink3.mk"
.include "../../joyent/rust111/buildlink3.mk"
.include "../../lang/python/tool.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../www/http-parser/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
