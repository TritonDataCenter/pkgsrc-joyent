# $NetBSD$

.include "../../joyent/llvm6/version.mk"

DISTNAME=	libcxx-${LLVM_VERSION}.src
PKGNAME=	libcxx6-${LLVM_VERSION}
CATEGORIES=	lang devel
MASTER_SITES=	${LLVM_MASTER_SITE}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://libcxx.llvm.org/
COMMENT=	C++ Standard Library
LICENSE=	modified-bsd OR mit

# libcxx6 requires libcxxabi6's cxxabi.h to build, but libcxxabi6 requires
# libcxx6's includes to build, so we have this unholy extra distfiles thing
# in both of them to get them to build against each other without causing
# circular dependencies.  This must be kept in sync with libcxxabi6/Makefile.
#
LIBCXXABI=	libcxxabi-${LLVM_VERSION}.src
DISTFILES=	${DEFAULT_DISTFILES} ${LIBCXXABI}${EXTRACT_SUFX}

CONFIGURE_DIRS=		${WRKDIR}/build
CMAKE_ARG_PATH=		${WRKSRC}

USE_LANGUAGES=		c c++
USE_CMAKE=		yes
GCC_REQD+=		4.8

CMAKE_INSTALL_PREFIX=	${PREFIX}/llvm6
BUILDLINK_PASSTHRU_RPATHDIRS+=	${CMAKE_INSTALL_PREFIX}/lib
LDFLAGS+=		-L${CMAKE_INSTALL_PREFIX}/lib
LDFLAGS+=		${COMPILER_RPATH_FLAG}${CMAKE_INSTALL_PREFIX}/lib

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
CMAKE_ARGS+=	-DCMAKE_C_COMPILER=${CC:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER=${CXX:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_LINK_FLAGS=${LDFLAGS:Q}
CMAKE_ARGS+=	-DLIBCXX_CXX_ABI=libcxxabi
CMAKE_ARGS+=	-DLIBCXX_CXX_ABI_INCLUDE_PATHS=${WRKDIR}/${LIBCXXABI}/include
CMAKE_ARGS+=	-DLIBCXX_ENABLE_ABI_LINKER_SCRIPT:BOOL=OFF

post-extract:
	${RUN} mkdir -p ${WRKDIR}/build

.include "../../joyent/libcxxabi6/buildlink3.mk"
.include "../../joyent/llvm6/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
