# $NetBSD$

.include "../../joyent/llvm6/version.mk"

DISTNAME=	lldb-${LLVM_VERSION}.src
PKGNAME=	lldb6-${LLVM_VERSION}
CATEGORIES=	lang devel
MASTER_SITES=	${LLVM_MASTER_SITE}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://lldb.llvm.org/
COMMENT=	Next generation, high-performance debugger
LICENSE=	modified-bsd OR mit

CONFIGURE_DIRS=		${WRKDIR}/build
CMAKE_ARG_PATH=		${WRKSRC}

USE_LANGUAGES=		c c++
USE_CMAKE=		yes
GCC_REQD+=		4.8

CMAKE_INSTALL_PREFIX=	${PREFIX}/llvm6

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
CMAKE_ARGS+=	-DCMAKE_C_COMPILER=${CC:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER=${CXX:Q}
CMAKE_ARGS+=	-DLLVM_CONFIG=${LLVM_CONFIG_PATH:Q}

post-extract:
	${RUN} mkdir -p ${WRKDIR}/build

.include "../../devel/swig2/buildlink3.mk"
.include "../../joyent/clang6/buildlink3.mk"
.include "../../joyent/llvm6/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
