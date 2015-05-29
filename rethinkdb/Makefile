# $NetBSD$

DISTNAME=	rethinkdb-2.0.2
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=jperkin/}
GITHUB_TAG=	92d24dd24e5ec3b6a1229655d06ca3142b3b0425

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://download.rethinkdb.com/dist/
COMMENT=	The open-source database for the realtime web
LICENSE=	gnu-agpl-v3

HAS_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake gsed

CONFIGURE_ARGS+=	--prefix ${PREFIX}
CONFIGURE_ARGS+=	--sysconfdir ${PKG_SYSCONFDIR:Q}
CONFIGURE_ARGS+=	--localstatedir ${VARBASE:Q}
CONFIGURE_ARGS+=	--allow-fetch

DEPENDS+=		nodejs>=0.10:../../lang/nodejs

RETHINKDB_USER?=	rethinkdb
RETHINKDB_GROUP?=	rethinkdb

PKG_GROUPS=		${RETHINKDB_USER}
PKG_USERS=		${RETHINKDB_USER}:${RETHINKDB_GROUP}

OWN_DIRS_PERMS+=	${VARBASE}/log/rethinkdb ${RETHINKDB_USER} ${RETHINKDB_GROUP} 0755
OWN_DIRS_PERMS+=	${VARBASE}/rethinkdb ${RETHINKDB_USER} ${RETHINKDB_GROUP} 0755
OWN_DIRS_PERMS+=	${VARBASE}/run/rethinkdb ${RETHINKDB_USER} ${RETHINKDB_GROUP} 0755

INSTALLATION_DIRS+=	share/examples/rethinkdb

EGDIR=			${PREFIX}/share/examples/rethinkdb
CONF_FILES=		${EGDIR}/default.conf.sample ${PKG_SYSCONFDIR}/rethinkdb.conf

BUILD_DEFS+=		VARBASE
BUILD_DEFS+=		RETHINKDB_USER RETHINKDB_GROUP

SUBST_CLASSES+=		vars
SUBST_STAGE.vars=	pre-configure
SUBST_FILES.vars=	packaging/assets/config/default.conf.sample
SUBST_VARS.vars+=	RETHINKDB_USER RETHINKDB_GROUP VARBASE

MAKE_ENV+=		MACHINE_ARCH=${MACHINE_ARCH:Q}
MAKE_ENV+=		LEGACY_GCC=1 # Disable aggressive warnings

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "SunOS"
MAKE_ENV+=		AR.host=/usr/bin/ar	# fails linking GNU ar archive
MAKE_ENV+=		AR.target=/usr/bin/ar	# fails linking GNU ar archive
CXXFLAGS+=		-D_FILE_OFFSET_BITS=64
LDFLAGS+=		-lsocket -lnsl
BUILDLINK_TRANSFORM+=	rm:-Wl,--version-script=libre2.symbols
# Requires 'grep -o'.
BUILD_DEPENDS+=		grep>=2.5.1:../../textproc/grep
TOOLS_PATH.grep=	${PREFIX}/bin/ggrep
TOOLS_PATH.egrep=	${PREFIX}/bin/gegrep
.endif

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/protobuf/buildlink3.mk"
.include "../../lang/python/tool.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
