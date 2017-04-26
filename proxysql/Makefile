# $NetBSD$

DISTNAME=	proxysql-1.3.6
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=sysown/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.proxysql.com/
COMMENT=	High-performance MySQL proxy
LICENSE=	gnu-gpl-v3

GITHUB_TAG=	v${PKGVERSION_NOREV}

USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

MAKE_JOBS_SAFE=	no

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	etc/proxysql.cnf lib/ProxySQL_GloVars.cpp
SUBST_VARS.path=	PKG_SYSCONFDIR VARBASE

CONF_FILES+=	share/examples/proxysql/proxysql.cnf \
		${PKG_SYSCONFDIR}/proxysql.cnf

BUILD_TARGET=	default

#MAKE_FLAGS+=	NOJEMALLOC=1
MAKE_FLAGS+=	EXTRALINK="-lnsl -lsocket -lresolv -lsqlite3 -liconv"
MAKE_FLAGS+=	DAEMONPATH_IDIR="${BUILDLINK_PREFIX.libdaemon}/include"
MAKE_FLAGS+=	DAEMONPATH_LDIR="${BUILDLINK_PREFIX.libdaemon}/lib"
MAKE_FLAGS+=	JEMALLOC_PATH="${BUILDLINK_PREFIX.jemalloc}"
MAKE_FLAGS+=	LIBCONFIG_IDIR="-I${BUILDLINK_PREFIX.libconfig}/include"
MAKE_FLAGS+=	LIBCONFIG_LDIR="-L${BUILDLINK_PREFIX.libconfig}/lib ${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.libconfig}/lib"
MAKE_FLAGS+=	SQLITE3_DIR=${BUILDLINK_PREFIX.sqlite3}

INSTALLATION_DIRS+=	bin share/examples/proxysql

post-extract:
	${CP} ${.CURDIR}/files/patch-cmake_CheckTypes.cmake ${WRKSRC}/deps/mariadb-client-library
	${CP} ${.CURDIR}/files/patch-libmariadb_my__context.c ${WRKSRC}/deps/mariadb-client-library
	${CP} ${.CURDIR}/files/patch-include_my__pthread.h ${WRKSRC}/deps/mariadb-client-library
	${CP} ${.CURDIR}/files/patch-Makefile ${WRKSRC}/deps/re2

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/jemalloc/buildlink3.mk"
.include "../../devel/libconfig/buildlink3.mk"
.include "../../devel/libdaemon/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
