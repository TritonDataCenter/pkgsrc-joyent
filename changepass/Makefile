# $NetBSD$
#

DISTNAME=	cgipaf-1.3.3
PKGNAME=	${DISTNAME:S/cgipaf/changepass/}
CATEGORIES=	sysutils
MASTER_SITES=	http://www.wagemakers.be/uploads/54/67/54679ae49d9c89c319e932a46da34745/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.wagemakers.be/english/programs/cgipaf/changepass_manpage
COMMENT=	Simple tool to set user passwords non-interactively
LICENSE=	gnu-gpl-v3

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	c
GNU_CONFIGURE=	yes
AUTO_MKDIRS=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/changepass ${DESTDIR}${PREFIX}/sbin/
	${INSTALL_MAN} ${WRKSRC}/changepass.man ${DESTDIR}${PREFIX}/${PKGMANDIR}/man8/changepass.8

.include "../../mk/bsd.pkg.mk"
