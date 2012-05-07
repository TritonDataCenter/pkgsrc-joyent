# $NetBSD$
#

DISTNAME=	davepacheco-mod_usdt-82d6828
PKGNAME=	${APACHE_PKG_PREFIX}-usdt-20120402
CATEGORIES=	sysutils
MASTER_SITES=	https://nodeload.github.com/davepacheco/mod_usdt/tarball/master?

MAINTAINER=	filip@joyent.com
HOMEPAGE=	https://github.com/davepacheco/mod_usdt
COMMENT=	DTrace provider for Apache
LICENSE=	mit

PKG_DESTDIR_SUPPORT=	user-destdir

PKG_APACHE_ACCEPTED=	apache2 apache22
APACHE_MODULE=		YES
USE_TOOLS+=	gmake

INSTALLATION_DIRS+=	lib/dtrace lib/httpd share/examples/${PKGBASE}

do-install:
	${INSTALL_LIB} ${WRKSRC}/build/mod_usdt.so ${DESTDIR}${PREFIX}/lib/httpd
	${INSTALL_DATA} ${WRKSRC}/src/httpd.d ${DESTDIR}${PREFIX}/lib/dtrace
	${INSTALL_DATA} ${WRKSRC}/examples/http-requests-bylatency.d \
		${DESTDIR}${PREFIX}/share/examples/${PKGBASE}
	${INSTALL_DATA} ${WRKSRC}/examples/http-requests.d \
		${DESTDIR}${PREFIX}/share/examples/${PKGBASE}

.include "../../mk/apache.mk"
.include "../../mk/bsd.pkg.mk"
