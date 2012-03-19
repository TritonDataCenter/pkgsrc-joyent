# $NetBSD$
#

DISTNAME=	joyent-tools-1.0
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.joyent.com/
COMMENT=	Various tools relevant to Joyent SmartOS and products
#LICENSE=	#

PKG_DESTDIR_SUPPORT=	user-destdir

NO_BUILD=	yes
INSTALLATION_DIRS+=	bin
WRKSRC=		${WRKDIR}

.include "../../mk/bsd.prefs.mk"

SCRIPTS=	jinf pkghelp
PLIST_VARS+=	sdc5

FILES_SUBST+=	PKGVERSION=${PKGVERSION}

do-extract:
.	for file in ${SCRIPTS}
	${SED} ${FILES_SUBST_SED} ${FILESDIR}/${file} > ${WRKSRC}/${file}
.	endfor

do-install:
.	for file in ${SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/${file} ${DESTDIR}${PREFIX}/bin/${file}
.	endfor

.include "../../mk/bsd.pkg.mk"
