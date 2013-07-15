# $NetBSD$
#

DISTNAME=	percona-xtrabackup-2.1.3
CATEGORIES=	databases
MASTER_SITES=	http://www.percona.com/redir/downloads/XtraBackup/LATEST/source/

MAINTAINER=	pkgsrc-users@netbsd.org
HOMEPAGE=	http://www.percona.com/software/percona-xtrabackup
COMMENT=	Percona XtraBackup

LIBTAR=		libtar-1.2.11
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${LIBTAR}.tar.gz
SITES.${LIBTAR}.tar.gz=	ftp://ftp.feep.net/pub/software/libtar

USE_GCC_RUNTIME=yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	bison cmake gmake perl:run

BUILD_DEPENDS+=	bzr-[0-9]*:../../devel/bzr
BUILD_DEPENDS+=	patch-[0-9]*:../../devel/patch

CONFIGURE_DIRS=	${WRKDIR}/${LIBTAR}
GNU_CONFIGURE=	YES

REPLACE_PERL=	innobackupex

# nbpatch is unable to parse the patch files.
TOOLS_PLATFORM.patch=	${LOCALBASE}/bin/gpatch

CFLAGS+=	-D_POSIX_PTHREAD_SEMANTICS
MAKE_ENV+=	AUTO_DOWNLOAD="yes"

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

post-patch:
	cat ${FILESDIR}/tar4ibd_libtar-1.2.11.patch \
	    | (cd ${WRKDIR}/${LIBTAR}; ${PATCH} -p1)

post-build:
	${RUN} cd ${WRKSRC} && \
	    ${MAKE_ENV} ./utils/build.sh xtradb55

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/innobackupex ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xbstream ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xtrabackup_55 ${DESTDIR}${PREFIX}/bin/xtrabackup
	${INSTALL_PROGRAM} ${WRKDIR}/${LIBTAR}/libtar/tar4ibd ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/xtrabackup.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	
.include "../../archivers/xz/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
