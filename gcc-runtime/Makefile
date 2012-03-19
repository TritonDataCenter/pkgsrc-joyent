# $NetBSD: Makefile,v 1.13 2010/05/06 10:21:17 adam Exp $

PKGNAME=		${DISTNAME:S/gcc/gcc-runtime/}

MAINTAINER=		filip@joyent.com
HOMEPAGE=		http://gcc.gnu.org/
COMMENT=		GNU Compiler Collection 4.6 Runtime libs

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../mk/bsd.prefs.mk"

BUILD_DEPENDS+=	rpath-[0-9]*:../../joyent/rpath
.if ${SUNOS_FLAVOR} == "joyent"
BUILD_DEPENDS+=	gcc-tools-[0-9]*:../../joyent/gcc-tools
.endif

PKG_PRESERVE=	yes

RPATH_LIBS=	libgfortran libgomp libobjc libssp libstdc++

do-install:
	cd ${WRKDIR}/obj && \
	  ${SETENV} ${MAKE_ENV} ${GMAKE} install-target DESTDIR=${DESTDIR}
	${RM} -rf \
	  ${DESTDIR}${PREFIX}/include \
	  ${DESTDIR}${PREFIX}/share \
	  ${DESTDIR}${PREFIX}/lib/gcc

post-install:
.	for LIB in ${RPATH_LIBS}
	rpath ${DESTDIR}${PREFIX}/lib/${LIB}.so '$$ORIGIN'
	rpath ${DESTDIR}${PREFIX}/lib/amd64/${LIB}.so '$$ORIGIN' 
.	endfor

.include "../../joyent/gcc/Makefile.common"
.include "../../mk/bsd.pkg.mk"
