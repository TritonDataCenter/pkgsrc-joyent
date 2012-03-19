# $NetBSD: Makefile,v 1.33 2007/06/16 21:17:52 rillig Exp $

PKGNAME=	${DISTNAME:tl}
DISTNAME=	FreeImage-3.13.1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=freeimage/}
EXTRACT_SUFX=	.zip

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://freeimage.sourceforge.net/
COMMENT=	An open source graphics library

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=			${WRKDIR}/FreeImage

EXTRACT_OPTS_ZIP=	-aqo
USE_ZIP=		yes
USE_GMAKE=		yes
USE_TOOLS+=		gunzip

USE_LANGUAGES+=		c c++

INSTALLATION_DIRS+=	include lib

post-patch:
	${CP} ${WRKSRC}/Makefile.solaris ${WRKSRC}/Makefile

.include "../../mk/bsd.pkg.mk"
