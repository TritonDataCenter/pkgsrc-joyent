# $NetBSD: Makefile,v 1.13 2012/10/03 21:54:07 wiz Exp $
#

DISTNAME=	onbld-g4071726
#PKGREVISION=	1
CATEGORIES=	joyent
MASTER_SITES=	http://download.joyent.com/pub/pkgsrc-inputs/

MAINTAINER=	nshalman-pkgsrc@elys.com
HOMEPAGE=	http://www.illumos.org/
COMMENT=	onbld tools from ON build tree
LICENSE= cddl-1.0

NO_BUILD=	yes

INSTALLATION_DIRS=	bin lib

do-install:
	${INSTALL_LIB_DIR} ${DESTDIR}${PREFIX}/lib/i386
	${INSTALL_PROGRAM_DIR} ${DESTDIR}${PREFIX}/bin/i386
	${INSTALL_LIB} ${WRKSRC}/lib/i386/libdwarf.so.1 ${DESTDIR}${PREFIX}/lib/i386
	ln -s libdwarf.so.1 ${DESTDIR}${PREFIX}/lib/i386/libdwarf.so
	${INSTALL_SCRIPT} ${WRKSRC}/bin/i386/cscope-fast ${DESTDIR}${PREFIX}/bin/i386 
	${INSTALL_SCRIPT} ${WRKSRC}/bin/i386/ctfconvert ${DESTDIR}${PREFIX}/bin/i386 
	${INSTALL_SCRIPT} ${WRKSRC}/bin/i386/ctfdump ${DESTDIR}${PREFIX}/bin/i386 
	${INSTALL_SCRIPT} ${WRKSRC}/bin/i386/ctfmerge ${DESTDIR}${PREFIX}/bin/i386 
	${INSTALL_SCRIPT} ${WRKSRC}/bin/i386/ctfstabs ${DESTDIR}${PREFIX}/bin/i386 
	${INSTALL_SCRIPT} ${WRKSRC}/bin/i386/ctfstrip ${DESTDIR}${PREFIX}/bin/i386 
	ln -s i386/cscope-fast ${DESTDIR}${PREFIX}/bin/
	ln -s i386/ctfconvert ${DESTDIR}${PREFIX}/bin/
	ln -s i386/ctfdump ${DESTDIR}${PREFIX}/bin/
	ln -s i386/ctfmerge ${DESTDIR}${PREFIX}/bin/
	ln -s i386/ctfstabs ${DESTDIR}${PREFIX}/bin/
	ln -s i386/ctfstrip ${DESTDIR}${PREFIX}/bin/
.include "../../mk/bsd.pkg.mk"
