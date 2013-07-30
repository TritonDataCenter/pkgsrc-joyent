# $NetBSD$
#

DISTNAME=	dtracetools-0.2
CATEGORIES=	sysutils

MAINTAINER=	derek@joyent.com
HOMEPAGE=	http://wiki.joyent.com/display/jpc2/Collecting+Data+with+DTraceTools
COMMENT=	DTraceTools for Joyent SmartMachines
#LICENSE=	#

PKG_DESTDIR_SUPPORT=	user-destdir

GIT_REPOSITORIES=	dtracetools
GIT_REPO.dtracetools=	git@git.joyent.com:dtracetools.git
GIT_TAG=		0.2

NO_CHECKSUM=	yes
NO_BUILD=	yes

WRKSRC=			${WRKDIR}/${PKGBASE}
INSTALLATION_DIRS+=	bin

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/*.d ${DESTDIR}${PREFIX}/bin

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
