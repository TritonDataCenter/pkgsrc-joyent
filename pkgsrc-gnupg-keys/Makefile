# $NetBSD$
#

DISTNAME=	pkgsrc-gnupg-keys-1.0
CATEGORIES=	security

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://pkgsrc.joyent.com/
COMMENT=	GnuPG keys for pkgsrc infrastructure

NO_BUILD=	yes
NO_CHECKSUM=	yes

do-install:
	${INSTALL_DATA} ${FILESDIR}/pkgsrc-security.gpg ${DESTDIR}${PREFIX}/share/gnupg/

.include "../../mk/bsd.pkg.mk"
