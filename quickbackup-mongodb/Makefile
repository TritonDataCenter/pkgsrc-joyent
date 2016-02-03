# $NetBSD$
#

DISTNAME=	quickbackup-mongodb-3.6
CATEGORIES=	sysutils

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://wiki.joyent.com/wiki/display/jpc2/Joyent+MongoDB+SmartMachine
COMMENT=	MongoDB quickbackup SMF service

GIT_REPOSITORIES=	qb-mongodb
GIT_REPO.qb-mongodb=	git@git.joyent.com:qb-mongodb.git
GIT_TAG=		3.6

DEPENDS+=	findutils-[0-9]*:../../sysutils/findutils
.if exists(${.CURDIR}/../../databases/mongodb)
DEPENDS+=	mongodb>=2.6.0:../../databases/mongodb
.else
DEPENDS+=	mongodb>=2.6.0:../../wip/mongodb
.endif

NO_CHECKSUM=	yes
NO_BUILD=	yes

WRKSRC=			${WRKDIR}/${GIT_REPOSITORIES}
INSTALLATION_DIRS=	bin
OWN_DIRS_PERMS+=	${VARBASE}/backups/mongodb mongodb mongodb 0755

SMF_SRCDIR=		${WRKSRC}
SMF_MANIFEST=		manifest.xml
SMF_MANIFEST_SRC=	${SMF_SRCDIR}/${SMF_MANIFEST}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/quickbackup-mongodb ${DESTDIR}${PREFIX}/bin

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
