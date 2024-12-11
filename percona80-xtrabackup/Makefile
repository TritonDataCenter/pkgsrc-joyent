# $NetBSD$

DISTNAME=	percona-xtrabackup-8.0.35-31
PKGNAME=	percona-xtrabackup-8.0.35
CATEGORIES=	databases
MASTER_SITES=	https://downloads.percona.com/downloads/Percona-XtraBackup-LATEST/Percona-XtraBackup-8.0.35-31/source/tarball/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.percona.com/software/percona-xtrabackup
COMMENT=	Percona XtraBackup (8.0 series)
LICENSE=	gnu-gpl-v2 AND modified-bsd

DEPENDS+=	qpress-[0-9]*:../../joyent/qpress

# Requires a specific version of boost, so we use our own copy here
BOOST=			boost_1_77_0
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${BOOST}.tar.bz2
SITES.${BOOST}.tar.bz2=	${MASTER_SITE_SOURCEFORGE:=boost/}

USE_LANGUAGES=		c c++
USE_TOOLS+=		bison gmake patch perl

CMAKE_CONFIGURE_ARGS+=	-DBUILD_CONFIG=xtrabackup_release
CMAKE_CONFIGURE_ARGS+=	-DFORCE_UNSUPPORTED_COMPILER=ON
CMAKE_CONFIGURE_ARGS+=	-DHAVE_EPOLL=NO
CMAKE_CONFIGURE_ARGS+=	-DINSTALL_MYSQLTESTDIR=percona-xtrabackup-test
CMAKE_CONFIGURE_ARGS+=	-DLIBEV_INCLUDE_PATHS=${BUILDLINK_PREFIX.libev}/include/ev
CMAKE_CONFIGURE_ARGS+=	-DLIBEV_LIB_PATHS=${BUILDLINK_PREFIX.libev}/lib/ev
CMAKE_CONFIGURE_ARGS+=	-DWITH_BOOST=${WRKDIR}/${BOOST}
CMAKE_CONFIGURE_ARGS+=	-DWITH_LIBEVENT=system
CMAKE_CONFIGURE_ARGS+=	-DWITH_PROTOBUF=system
CMAKE_CONFIGURE_ARGS+=	-DWITH_SSL=system
CMAKE_CONFIGURE_ARGS+=	-DWITH_ZLIB=system

CFLAGS.SunOS+=		-D_POSIX_PTHREAD_SEMANTICS
CXXFLAGS.SunOS+=	-fpermissive
LDFLAGS.SunOS+=		-lsocket -lnsl

BUILDLINK_TRANSFORM+=	rm:-Wmissing-include-dirs
# cc1plus: warning: '-Wformat-security' ignored without '-Wformat'
BUILDLINK_TRANSFORM+=	rm:-Wformat-security

CHECK_INTERPRETER_SKIP+=	percona-xtrabackup-test/*
CHECK_PORTABILITY_SKIP+=	packaging/deb-in/*
CHECK_PORTABILITY_SKIP+=	storage/ndb/mcc/frontend/dojo/dojox/mobile/build/build.sh

post-extract:
	${MKDIR} ${WRKDIR}/build

# Ashamed to say I'm having difficulty trying to stop this wart being installed...
post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/docs
	${RM} -f ${DESTDIR}${PREFIX}/include/kmip.h
	${RM} -f ${DESTDIR}${PREFIX}/include/kmippp.h
	${RM} -f ${DESTDIR}${PREFIX}/lib/libkmip.a
	${RM} -f ${DESTDIR}${PREFIX}/lib/libkmippp.a

.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../devel/libev/buildlink3.mk"
.include "../../devel/libevent/buildlink3.mk"
.include "../../devel/protobuf/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
