# $NetBSD$

.include "../../joyent/llvm6/version.mk"

DISTNAME=	libunwind-${LLVM_VERSION}.src
PKGNAME=	libunwind6-${LLVM_VERSION}
CATEGORIES=	lang devel
MASTER_SITES=	${LLVM_MASTER_SITE}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/llvm-project/libunwind
COMMENT=	C++ Standard Library
LICENSE=	modified-bsd OR mit

USE_LANGUAGES=	c c++
USE_CMAKE=	yes
GCC_REQD+=	4.8

SSP_SUPPORTED=	no

CONFIGURE_DIRS=	${WRKDIR}/build
CMAKE_ARG_PATH=	${WRKSRC}

CMAKE_INSTALL_PREFIX=	${PREFIX}/llvm6

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
CMAKE_ARGS+=	-DCMAKE_C_COMPILER=${CC:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER=${CXX:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_LINK_FLAGS=${LDFLAGS:Q}
CMAKE_ARGS+=	-DLLVM_CONFIG_PATH=${LLVM_CONFIG_PATH:Q}

post-extract:
	${RUN} mkdir -p ${WRKDIR}/build

.include "../../joyent/llvm6/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
