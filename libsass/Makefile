# $NetBSD$

DISTNAME=	libsass-${GITHUB_TAG}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=sass/}
GITHUB_TAG=	3.2.5

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	${MASTER_SITE_GITHUB:=sass/libsass/}
COMMENT=	C/C++ implementation of a Sass compiler
LICENSE=	mit

USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	aclocal autoconf autoheader automake gmake

GNU_CONFIGURE=	yes

pre-configure:
	${ECHO} ${GITHUB_TAG} >${WRKSRC}/VERSION
	cd ${WRKSRC} && libtoolize && aclocal && autoheader && autoconf \
	    && automake --add-missing

.include "../../mk/bsd.pkg.mk"
