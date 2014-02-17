# $NetBSD$
#

DISTNAME=	percona-xtrabackup-2.1.7
PKGNAME=	${MYSQL_PKG_PREFIX}-xtrabackup-2.1.7
CATEGORIES=	databases
MASTER_SITES=	http://www.percona.com/redir/downloads/XtraBackup/LATEST/source/

MAINTAINER=	pkgsrc-users@netbsd.org
HOMEPAGE=	http://www.percona.com/software/percona-xtrabackup
COMMENT=	Percona XtraBackup

.include "../../mk/mysql.buildlink3.mk"

.if empty(MYSQL_PKG_PREFIX:Mpercona*)
BROKEN=		Only ${MYSQL_PKG_PREFIX} supports Percona
.endif

PERCONA_VERSION=	${MYSQL_PKG_PREFIX:C/percona//:C/-cluster.*//}
PLIST_SUBST+=		PERCONA_VERSION=${PERCONA_VERSION:Q}

LIBTAR=		libtar-1.2.11
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${LIBTAR}.tar.gz
SITES.${LIBTAR}.tar.gz=	ftp://ftp.feep.net/pub/software/libtar

USE_GCC_RUNTIME=yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	bison cmake gmake perl:run

BUILD_DEPENDS+=	patch-[0-9]*:../../devel/patch

DEPENDS+=	p5-DBD-${MYSQL_PKG_PREFIX}-[0-9]*:../../databases/p5-DBD-mysql
DEPENDS+=	qpress-[0-9]*:../../joyent/qpress

CONFIGURE_DIRS=	${WRKDIR}/${LIBTAR}
GNU_CONFIGURE=	YES

REPLACE_PERL=	innobackupex.pl

# nbpatch is unable to parse the patch files.
TOOLS_PLATFORM.patch=	${LOCALBASE}/bin/gpatch

CFLAGS+=	-D_POSIX_PTHREAD_SEMANTICS
LDFLAGS.SunOS+=	-lsocket -lnsl
MAKE_ENV+=	AUTO_DOWNLOAD="yes"

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

post-patch:
	cat ${FILESDIR}/tar4ibd_libtar-1.2.11.patch \
	    | (cd ${WRKDIR}/${LIBTAR}; ${PATCH} -p1)

post-build:
	${RUN} cd ${WRKSRC} && \
	    ${MAKE_ENV} ./utils/build.sh xtradb${PERCONA_VERSION}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/innobackupex ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xbstream ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xtrabackup_${PERCONA_VERSION} ${DESTDIR}${PREFIX}/bin
	${RM} -f ${DESTDIR}${PREFIX}/bin/xtrabackup
	${LN} -s xtrabackup_${PERCONA_VERSION} ${DESTDIR}${PREFIX}/bin/xtrabackup
	${INSTALL_PROGRAM} ${WRKDIR}/${LIBTAR}/libtar/tar4ibd ${DESTDIR}${PREFIX}/bin
	# Requires sphinx-build and doesn't actually build right now
	#${INSTALL_MAN} ${WRKSRC}/doc/xtrabackup.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	
.include "../../archivers/xz/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
