# $NetBSD: Makefile,v 1.13 2010/05/06 10:21:17 adam Exp $

PKGNAME=		${DISTNAME:S/gcc/gcc-compiler/}

MAINTAINER=		filip@joyent.com
HOMEPAGE=		http://gcc.gnu.org/
COMMENT=		GNU Compiler Collection 4.6

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../mk/bsd.prefs.mk"

.if ${SUNOS_FLAVOR} == "joyent"
DEPENDS+=		gcc-tools-[0-9]*:../../joyent/gcc-tools
.endif
DEPENDS+=		gcc-runtime-${PKGVERSION}*:../../joyent/gcc-runtime

do-install:
	(cd ${WRKDIR}/obj && ${SETENV} ${MAKE_ENV} ${GMAKE} install DESTDIR=${DESTDIR} \
	 && ${TEST} -f ${DESTDIR}${PREFIX}/bin/cc || ${LN} -f ${DESTDIR}${PREFIX}/bin/gcc ${DESTDIR}${PREFIX}/bin/cc  \
	 && ${RM} ${DESTDIR}${PREFIX}/lib/lib* ${DESTDIR}${PREFIX}/lib/amd64/lib*)

post-install:
	(cd ${WRKSRC} && \
	 ${TOOLS_PATH.ksh} -f ${WRKDIR}/values.c ${DESTDIR}${PREFIX}/bin/gcc && \
	 ${TOOLS_PATH.ksh} -f ${WRKDIR}/values.c ${DESTDIR}${PREFIX}/bin/gcc -m64)

.include "../../joyent/gcc/Makefile.common"
.include "../../mk/bsd.pkg.mk"
