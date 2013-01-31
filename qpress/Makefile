# $NetBSD$
#

DISTNAME=	qpress-11-source
PKGNAME=	qpress-1.1
CATEGORIES=	archivers
MASTER_SITES=	http://www.quicklz.com/
EXTRACT_SUFX=	.zip
EXTRACT_DIR=	${WRKSRC}

MAINTAINER=	pkgsrc-users@netbsd.org
HOMEPAGE=	http://www.quicklz.com/
COMMENT=	qpress file archiver

USE_LANGUAGES=	c++

INSTALLATION_DIRS=	bin

do-build:
	${RUN} cd ${WRKSRC} && \
	    ${CXX} ${CXXFLAGS} -o qpress qpress.cpp aio.cpp quicklz.c utilities.cpp -lpthread

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/qpress ${DESTDIR}${PREFIX}/bin
	
.include "../../mk/bsd.pkg.mk"
