# $NetBSD$

DISTNAME=	cgatools-1.8.0.1-source
PKGNAME=	${DISTNAME:S/-source//}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=cgatools/}

MAINTAINER=	pkgsrc@joyent.com
HOMEPAGE=	http://cgatools.sourceforge.net/
COMMENT=	The Complete Genomics Analysis Tools
LICENSE=	apache-2.0

BUILD_DEPENDS+=	doxygen-[0-9]*:../../devel/doxygen

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

CMAKE_ARG_PATH=	..
CONFIGURE_DIRS=	_build

CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=YES

pre-configure:
	${MKDIR} ${WRKSRC}/_build

.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
