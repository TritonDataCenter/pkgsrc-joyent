# $NetBSD$
#

DISTNAME=	rpath
PKGNAME=	${DISTNAME}-0
CATEGORIES=	sysutils
MASTER_SITES=	http://blogs.sun.com/ali/resource/
EXTRACT_SUFX=	.tgz

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://blogs.sun.com/ali/entry/changing_elf_runpaths
COMMENT=	Set/get runpath of ELF dynamic objects
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_TARGET=	${PKGBASE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rpath ${DESTDIR}${PREFIX}/sbin/rpath
	${INSTALL_MAN} ${WRKSRC}/rpath.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/rpath.1

.include "../../mk/bsd.pkg.mk"
