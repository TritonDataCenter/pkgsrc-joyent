# $NetBSD$
#

DISTNAME=	manta-1.2.2
CATEGORIES=	sysutils
MASTER_SITES=	#

MAINTAINER=	filip@joyent.com
HOMEPAGE=	https://github.com/joyent/node-manta
COMMENT=	Node.js SDK for Manta
LICENSE=	mit

SUBST_CLASSES+=		man
SUBST_STAGE.man=	post-install
SUBST_MESSAGE.man=	Fixing man path reference
SUBST_FILES.man=	${DESTDIR}${SDC_PREFIX}/lib/node_modules/manta/package.json
SUBST_SED.man=		-e 's,${FAKEHOMEDIR}/.npm/manta/${PKGVERSION_NOREV}/package,${SDC_PREFIX}/lib/node_modules/manta,'

.include "../../joyent/sdc-node/Makefile.common"
.include "../../mk/bsd.pkg.mk"
