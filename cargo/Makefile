# $NetBSD$

DISTNAME=	cargo-0.11.0
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=rust-lang/}
GITHUB_PROJECT=	cargo
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	${MASTER_SITE_GITHUB:=rust-lang/cargo/}
COMMENT=	Cargo package manager for Rust
LICENSE=	apache-2.0 OR mit

#DEPENDS+=	${PYPKGPREFIX}-dulwich>0:../../devel/py-dulwich
DEPENDS+=	${PYPKGPREFIX}-pytoml>0:../../textproc/py-pytoml
DEPENDS+=	rust>0:../../joyent/rust111

#
# Needs additional downloads.
#
DISTFILES=		${DEFAULT_DISTFILES} 
#
CARGO_DEPS=		cargo_0.11.0.orig-deps.tar.gz
DISTFILES+=		${CARGO_DEPS}
SITES.${CARGO_DEPS}?=	http://http.debian.net/debian/pool/main/c/cargo/
#
CRATES_INDEX=		ad9a3abfecf6340aed54a0ede0b63349e830d79b.tar.gz
DISTFILES+=		${CRATES_INDEX}
SITES.${CRATES_INDEX}?=	https://github.com/rust-lang/crates.io-index/archive/

USE_LANGUAGES=		c
USE_TOOLS+=		gmake pkg-config

HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--disable-debug
CONFIGURE_ARGS+=	--enable-optimize
CONFIGURE_ARGS+=	--local-rust-root=${PREFIX}
CONFIGURE_ARGS+=	--local-cargo=${WRKSRC}/cargo-stage0

MAKE_ENV+=	CARGO_HOME=${WRKSRC}/.cargohome

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
	${CP} ${FILESDIR}/cargo-vendor-pack.py ${WRKDIR}
	${MV} ${WRKDIR}/deps ${WRKSRC}/deps
	${MV} ${WRKSRC}/src/crates-io ${WRKSRC}/deps/crates-io-0.2.0

pre-configure:
	cd ${WRKSRC} && \
		${MAKE_ENV} ${PYTHONBIN} ${WRKDIR}/cargo-vendor-pack.py
	cd ${WRKSRC} && \
		${MAKE_ENV} ${PYTHONBIN} ${WRKDIR}/bootstrap.py \
	    --no-clean --no-clone --no-git --no-download \
	    --crate-index ${WRKSRC}/vendor/index/ \
	    --cargo-root ${WRKSRC}/ \
	    --target-dir ${WRKSRC}/deps/ \
	    --target ${RUST_ARCH}
	# Workaround for https://github.com/rust-lang/cargo/issues/1423
	${MV} ${WRKSRC}/deps ${WRKSRC}/.deps
	${LN} -s ${WRKSRC}/.deps/cargo-${PKGVERSION_NOREV:S/./_/g} ${WRKSRC}/cargo-stage0

post-install:
	for file in components install.log manifest-cargo \
		    rust-installer-version uninstall.sh; do \
		${RM} -f ${DESTDIR}${PREFIX}/lib/rustlib/$${file}; \
	done

.include "../../devel/cmake/buildlink3.mk"
.include "../../lang/python/tool.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../www/http-parser/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
