# $NetBSD$

DISTNAME=	qpress-20230507
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GITHUB:=PierreLvx/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@pkgsrc.org
HOMEPAGE=	https://github.com/PierreLvx/qpress
COMMENT=	Portable high-speed file archiver
LICENSE=	gnu-gpl-v2

USE_LANGUAGES=	c++

INSTALLATION_DIRS=	bin

SUBST_CLASSES+=		crlf
SUBST_MESSAGE.crlf=	Converting files from CRLF to LF
SUBST_STAGE.crlf=	post-extract
SUBST_FILES.crlf=	*.c *.cpp *.h *.hpp
SUBST_FILTER_CMD.crlf=	${TR} -d '\r'

do-build:
	cd ${WRKSRC} && \
	    ${CXX} ${CXXFLAGS} -lpthread -o qpress \
	    qpress.cpp aio.cpp quicklz.c utilities.cpp

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/qpress ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
