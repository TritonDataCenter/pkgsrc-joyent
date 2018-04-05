# $NetBSD$

.include "../../joyent/llvm6/version.mk"

DISTNAME=	libcxxabi-${LLVM_VERSION}.src
PKGNAME=	libcxxabi6-${LLVM_VERSION}
CATEGORIES=	lang devel
MASTER_SITES=	${LLVM_MASTER_SITE}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://libcxxabi.llvm.org/
COMMENT=	C++ Standard Library
LICENSE=	modified-bsd OR mit

# libcxx6 requires libcxxabi6's cxxabi.h to build, but libcxxabi6 requires
# libcxx6's includes to build, so we have this unholy extra distfiles thing
# in both of them to get them to build against each other without causing
# circular dependencies.  This must be kept in sync with libcxxabi6/Makefile.
#
LIBCXX=		libcxx-${LLVM_VERSION}.src
DISTFILES=	${DEFAULT_DISTFILES} ${LIBCXX}${EXTRACT_SUFX}

CONFIGURE_DIRS=		${WRKDIR}/build
CMAKE_ARG_PATH=		${WRKSRC}

USE_LANGUAGES=		c c++
USE_CMAKE=		yes
GCC_REQD+=		4.8

CMAKE_INSTALL_PREFIX=	${PREFIX}/llvm6

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
CMAKE_ARGS+=	-DCMAKE_C_COMPILER=${CC:Q}
CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER=${CXX:Q}
CMAKE_ARGS+=	-DLIBCXXABI_LIBCXX_INCLUDES=${WRKDIR}/${LIBCXX}/include
CMAKE_ARGS+=	-DLIBCXXABI_USE_LLVM_UNWINDER=YES

post-extract:
	${RUN} mkdir -p ${WRKDIR}/build

.include "../../joyent/libunwind6/buildlink3.mk"
.include "../../joyent/llvm6/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
