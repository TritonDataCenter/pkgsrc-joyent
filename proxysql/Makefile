# $NetBSD$

DISTNAME=	proxysql-1.4.12
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=sysown/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	https://proxysql.com/
COMMENT=	High-performance MySQL proxy
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/proxysql-1.4.12
USE_LANGUAGES=	c c++ c99
USE_TOOLS+=	gawk gmake tar

SMF_NAME=	proxysql

BUILD_DEFS+=	VARBASE
DEPENDS+=	patch>=2.4:../../devel/patch

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	etc/proxysql.cnf lib/ProxySQL_GloVars.cpp
SUBST_VARS.path=	PKG_SYSCONFDIR VARBASE

CONF_FILES+=	share/examples/proxysql/proxysql.cnf \
		${PKG_SYSCONFDIR}/proxysql.cnf

OWN_DIRS+=	${VARBASE}/lib/proxysql

BUILD_TARGET=	default

MAKE_FLAGS+=	EXTRALINK="-lnsl -lsocket -lresolv -liconv"
MAKE_FLAGS+=	GIT_VERSION=${PKGVERSION_NOREV}
MAKE_FLAGS+=	MAKEOPT=${_MAKE_JOBS}

# Redirect to pkgsrc packages
MAKE_FLAGS+=	DAEMONPATH_IDIR="${BUILDLINK_PREFIX.libdaemon}/include"
MAKE_FLAGS+=	DAEMONPATH_LDIR="${BUILDLINK_PREFIX.libdaemon}/lib"
MAKE_FLAGS+=	LIBCONFIG_IDIR="-I${BUILDLINK_PREFIX.libconfig}/include"
MAKE_FLAGS+=	LIBCONFIG_LDIR="-L${BUILDLINK_PREFIX.libconfig}/lib ${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.libconfig}/lib"
MAKE_FLAGS+=	PCRE_LDIR="${BUILDLINK_PREFIX.pcre}/lib"
MAKE_FLAGS+=	PCRE_PATH="${BUILDLINK_PREFIX.pcre}/include"
MAKE_FLAGS+=	CURL_IDIR="${BUILDLINK_PREFIX.curl}/include"
MAKE_FLAGS+=	CURL_LDIR="${BUILDLINK_PREFIX.curl}/lib"

INSTALLATION_DIRS+=	bin share/examples/proxysql

# Pre-extract, so that we may patch the source
post-extract:
	cd ${WRKSRC}/deps/mariadb-client-library && ${TAR} -xzf mariadb-connector-c-*.tar.gz

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/libconfig/buildlink3.mk"
.include "../../devel/libdaemon/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
