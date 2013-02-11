# $NetBSD$
#

DISTNAME=	percona-xtrabackup-2.0.5
CATEGORIES=	databases
MASTER_SITES=	http://www.percona.com/redir/downloads/XtraBackup/LATEST/source/

MAINTAINER=	pkgsrc-users@netbsd.org
HOMEPAGE=	http://www.percona.com/software/percona-xtrabackup
COMMENT=	Percona XtraBackup

USE_LANGUAGES=	c c++
USE_TOOLS+=	bison cmake gmake perl:run

BUILD_DEPENDS+=	bzr-[0-9]*:../../devel/bzr
BUILD_DEPENDS+=	patch-[0-9]*:../../devel/patch

REPLACE_PERL=	innobackupex

# nbpatch is unable to parse the patch files.
TOOLS_PLATFORM.patch=	${LOCALBASE}/bin/gpatch

CFLAGS+=	-D_POSIX_PTHREAD_SEMANTICS
MAKE_ENV+=	AUTO_DOWNLOAD="yes"

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-build:
	${RUN} cd ${WRKSRC} && \
	    ${MAKE_ENV} ./utils/build.sh xtradb55

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/innobackupex ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xbstream ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xtrabackup_55 ${DESTDIR}${PREFIX}/bin/xtrabackup
	${INSTALL_MAN} ${WRKSRC}/doc/xtrabackup.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	
.include "../../archivers/xz/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
