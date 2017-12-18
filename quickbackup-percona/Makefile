# $NetBSD$
#

DISTNAME=	quickbackup-percona-3.6
CATEGORIES=	sysutils

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://wiki.joyent.com/jpc2/Joyent+Percona+SmartMachine
COMMENT=	Percona quickbackup SMF service

NO_CHECKSUM=	yes
NO_BUILD=	yes

INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/quickbackup-percona \
	    ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
