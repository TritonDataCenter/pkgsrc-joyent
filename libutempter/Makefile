# $NetBSD$

PKGNAME=	libutempter-1.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=illumos/}

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://github.com/illumos/illumos-gate
COMMENT=	Local copy of the illumos libutempter library
LICENSE=	2-clause-bsd

NO_CHECKSUM=	yes
USE_LANGUAGES=	c

INSTALLATION_DIRS=	lib include

do-build:
	${MKDIR} ${WRKSRC}
	${CC} ${CFLAGS} -fPIC -shared \
	    -Wl,-soname,libutempter.so.1 -Wl,-M,${FILESDIR}/mapfile-vers \
	    ${FILESDIR}/utempter.c -o ${WRKSRC}/libutempter.so.1

do-install:
	${INSTALL_LIB} ${WRKSRC}/libutempter.so.1 \
		${DESTDIR}${PREFIX}/lib
	${INSTALL_DATA} ${FILESDIR}/utempter.h \
		${DESTDIR}${PREFIX}/include
	${RM} -f ${DESTDIR}${PREFIX}/lib/libutempter.so
	${LN} -s libutempter.so.1 ${DESTDIR}${PREFIX}/lib/libutempter.so

.include "../../mk/bsd.pkg.mk"
