# $NetBSD$
#

DISTNAME=	percona-xtrabackup-2.4.7
PKGNAME=	${MYSQL_PKG_PREFIX}-${DISTNAME:S/percona-//}
CATEGORIES=	databases
MASTER_SITES=	http://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-${PKGVERSION_NOREV}/source/tarball/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.percona.com/software/percona-xtrabackup
COMMENT=	Percona XtraBackup
LICENSE=	gnu-gpl-v2 AND modified-bsd

BUILD_DEPENDS+=	patch-[0-9]*:../../devel/patch
DEPENDS+=	qpress-[0-9]*:../../joyent/qpress
DEPENDS+=	p5-DBD-${MYSQL_PKG_PREFIX}-[0-9]*:../../databases/p5-DBD-mysql

# MySQL requires a specific version of boost, so we use our own
# copy here
BOOST=			boost_1_59_0
LIBTAR=			libtar-1.2.11
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${LIBTAR}.tar.gz ${BOOST}.tar.bz2
SITES.${BOOST}.tar.bz2=	${MASTER_SITE_SOURCEFORGE:=boost/}
SITES.${LIBTAR}.tar.gz=	ftp://ftp.feep.net/pub/software/libtar

.include "../../mk/mysql.buildlink3.mk"

# Help out <2013Q1 branches
MYSQL_PKG_PREFIX?=	percona55

.if empty(MYSQL_PKG_PREFIX:Mpercona*)
BROKEN=			Only supports Percona packages
.endif

USE_CMAKE=		yes
USE_GCC_RUNTIME=	yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		bison cmake gmake patch perl

# nbpatch is unable to parse the patch files.
TOOLS_PLATFORM.patch=	${LOCALBASE}/bin/gpatch

CMAKE_ARGS+=		-DENABLE_DTRACE=ON
CMAKE_ARGS+=		-DENABLE_OPENSSL=ON

CMAKE_ARGS+=		-DWITH_BOOST=${WRKDIR}/${BOOST}
CMAKE_ARGS+=		-DWITH_LIBEV=system
CMAKE_ARGS+=		-DWITH_SSL=system
CMAKE_ARGS+=		-DWITH_ZLIB=system
CMAKE_ARGS+=		-DLIBEV_INCLUDE_PATHS=${BUILDLINK_PREFIX.libev}/include/ev
CMAKE_ARGS+=		-DLIBEV_LIB_PATHS=${BUILDLINK_PREFIX.libev}/lib/ev

CMAKE_ARGS+=		-DBUILD_CONFIG=xtrabackup_release
CMAKE_ARGS+=		-DINSTALL_MYSQLTESTDIR=percona-xtrabackup-test

CFLAGS+=		-D_POSIX_PTHREAD_SEMANTICS
LDFLAGS.SunOS+=		-lsocket -lnsl

CHECK_PORTABILITY_SKIP+=	storage/ndb/mcc/frontend/dojo/dojox/mobile/build/build.sh
CHECK_INTERPRETER_SKIP+=	percona-xtrabackup-test/*

post-patch:
	cat ${FILESDIR}/tar4ibd_libtar-1.2.11.patch \
	    | (cd ${WRKDIR}/${LIBTAR}; ${PATCH} -p1)

post-configure:
	cd ${WRKDIR}/${LIBTAR} && \
	  ${SETENV} ${CONFIGURE_ENV} ${CONFIG_SHELL} ${CONFIGURE_SCRIPT} ${CONFIGURE_ARGS}

pre-build:
	${RM} -rf ${BUILDLINK_DIR}/include/mysql
	cd ${WRKDIR}/${LIBTAR} && ${BUILD_MAKE_CMD} ${BUILD_TARGET}

post-install:
	${INSTALL_PROGRAM} ${WRKDIR}/${LIBTAR}/libtar/tar4ibd ${DESTDIR}${PREFIX}/bin

.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/libev/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
