# $NetBSD$

DISTNAME=		gcc-tools-0
CATEGORIES=		devel

MAINTAINER=		filip@joyent.com
HOMEPAGE=		http://www.joyent.com
COMMENT=		Subset of binutils needed for GCC
#LICENSE=		#

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=	find

BUILD_DEPENDS+=		binutils-[0-9]*:../../devel/binutils
CONFLICTS+=	binutils-[0-9]*

FILES_SUBST+=		PKGNAME=${PKGNAME}

DISTFILES=	#
NO_BUILD=	yes
NO_CHECKSUM=	yes
.include "../../mk/bsd.prefs.mk"

TOOLS_NEEDED=		addr2line ar as gprof objcopy objdump ranlib readelf

do-install:
	${MKDIR} -p ${DESTDIR}${PREFIX}/bin
.	for tool in ${TOOLS_NEEDED}
	${CP} -p ${PREFIX}/bin/${GNU_PROGRAM_PREFIX}${tool} ${DESTDIR}${PREFIX}/bin
.	endfor

GENERATE_PLIST+=                                                        \
	cd ${DESTDIR}${PREFIX} && ${FIND} * \( -type f -o -type l \) -print \
	| ${SED} -e 's/^\.//' | ${SORT} ;

.include "../../mk/bsd.pkg.mk"
