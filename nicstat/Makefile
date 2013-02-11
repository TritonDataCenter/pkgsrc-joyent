# $NetBSD$

PKGNAME=	${DISTNAME:C/-src//}
DISTNAME=	nicstat-src-1.92
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=nicstat/}

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://nicstat.sourceforge.net/
COMMENT=	Network traffic statics utility for Solaris and Linux
LICENSE=	artistic-2.0

ONLY_FOR_PLATFORM=	Linux-*-* SunOS-*-*

PKG_INSTALLATION_TYPES=	overwrite pkgviews

USE_LANGUAGES=	c

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Linux"
MAKE_FILE=	Makefile.Linux
.elif ${OPSYS} == "SunOS"
MAKE_FILE=	Makefile.Solaris
.endif

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.nicstat* ${DESTDIR}${PREFIX}/bin/nicstat
	${INSTALL_MAN} ${WRKSRC}/nicstat.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/

.include "../../mk/bsd.pkg.mk"
