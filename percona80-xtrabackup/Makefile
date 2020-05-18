# $NetBSD$

DISTNAME=	percona-xtrabackup-8.0.11
CATEGORIES=	databases
MASTER_SITES=	https://www.percona.com/downloads/Percona-XtraBackup-LATEST/Percona-XtraBackup-${PKGVERSION_NOREV}/source/tarball/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.percona.com/software/percona-xtrabackup
COMMENT=	Percona XtraBackup (8.0 series)
LICENSE=	gnu-gpl-v2 AND modified-bsd

DEPENDS+=	qpress-[0-9]*:../../joyent/qpress

# Requires a specific version of boost, so we use our own copy here
BOOST=			boost_1_70_0
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${BOOST}.tar.bz2
SITES.${BOOST}.tar.bz2=	${MASTER_SITE_SOURCEFORGE:=boost/}

USE_CMAKE=		yes
USE_GCC_RUNTIME=	yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		bison cmake gmake patch perl

CONFIGURE_DIRS=		${WRKDIR}/build
CMAKE_ARG_PATH=		${WRKSRC}

CMAKE_ARGS+=		-DENABLE_DTRACE=ON
CMAKE_ARGS+=		-DENABLE_OPENSSL=ON

CMAKE_ARGS+=		-DWITH_BOOST=${WRKDIR}/${BOOST}
CMAKE_ARGS+=		-DWITH_LIBEV=system
CMAKE_ARGS+=		-DWITH_SSL=system
CMAKE_ARGS+=		-DWITH_ZLIB=system
CMAKE_ARGS+=		-DLIBEV_INCLUDE_PATHS=${BUILDLINK_PREFIX.libev}/include/ev
CMAKE_ARGS+=		-DLIBEV_LIB_PATHS=${BUILDLINK_PREFIX.libev}/lib/ev

CMAKE_ARGS+=		-DEVENT__HAVE_EPOLL=NO

CMAKE_ARGS+=		-DBUILD_CONFIG=xtrabackup_release
CMAKE_ARGS+=		-DFORCE_UNSUPPORTED_COMPILER=ON
CMAKE_ARGS+=		-DINSTALL_MYSQLTESTDIR=percona-xtrabackup-test

CFLAGS+=		-D_POSIX_PTHREAD_SEMANTICS
LDFLAGS.SunOS+=		-lsocket -lnsl

CHECK_INTERPRETER_SKIP+=	percona-xtrabackup-test/*
CHECK_PORTABILITY_SKIP+=	packaging/deb-in/*
CHECK_PORTABILITY_SKIP+=	storage/ndb/mcc/frontend/dojo/dojox/mobile/build/build.sh

post-extract:
	${MKDIR} ${WRKDIR}/build

# Ashamed to say I'm having difficulty trying to stop this wart being installed...
post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/docs

.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/libev/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
