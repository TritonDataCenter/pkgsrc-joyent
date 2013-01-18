# $NetBSD$

DISTNAME=		procps-${PKGVERSION}
PKGNAME=		watch-3.2.8
CATEGORIES=		sysutils
MASTER_SITES=		http://procps.sourceforge.net/

MAINTAINER=		reed@reedmedia.net
HOMEPAGE=		http://procps.sourceforge.net/
COMMENT=		The Linux watch utility
LICENSE=		gnu-gpl-v2

CONFLICTS+=		procps-[0-9]*

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake

BUILD_TARGET=		watch

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/watch ${DESTDIR}${PREFIX}/bin/watch
	${INSTALL_MAN} ${WRKSRC}/watch.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/watch.1

.include "../../devel/ncurses/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
