# $NetBSD$
#

DISTNAME=	quickbackup-percona-3.7
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://wiki.joyent.com/jpc2/Joyent+Percona+SmartMachine
COMMENT=	Percona quickbackup SMF service
LICENSE=	public-domain

NO_CHECKSUM=	yes
NO_CONFIGURE=	yes

INSTALLATION_DIRS=	bin

do-build:
	${SED} ${FILES_SUBST_SED} ${FILESDIR}/quickbackup-percona \
	    >${WRKDIR}/quickbackup-percona

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/quickbackup-percona ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
