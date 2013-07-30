# $NetBSD$
#

DISTNAME=	quickbackup-mongodb-3.5
CATEGORIES=	sysutils

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://wiki.joyent.com/wiki/display/jpc2/Joyent+MongoDB+SmartMachine
COMMENT=	MongoDB quickbackup SMF service

GIT_REPOSITORIES=	qb-mongodb
GIT_REPO.qb-mongodb=	git@git.joyent.com:qb-mongodb.git
GIT_TAG=		3.5

DEPENDS+=	findutils-[0-9]*:../../sysutils/findutils
DEPENDS+=	mongodb-[0-9]*:../../wip/mongodb

NO_CHECKSUM=	yes
NO_BUILD=	yes

WRKSRC=			${WRKDIR}/${GIT_REPOSITORIES}
INSTALLATION_DIRS=	bin
OWN_DIRS_PERMS+=	${VARBASE}/backups/mongodb mongodb mongodb 0755
SMF_MANIFEST_SRC=	${WRKSRC}/manifest.xml

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/quickbackup-mongodb ${DESTDIR}${PREFIX}/bin

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
