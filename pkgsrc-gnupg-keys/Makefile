# $NetBSD$
#

DISTNAME=	pkgsrc-gnupg-keys-20150225
CATEGORIES=	security
MASTER_SITES=	#empty
DISTFILES=	#empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://pkgsrc.joyent.com/
COMMENT=	GnuPG keys for pkgsrc infrastructure
LICENSE=	public-domain

NO_BUILD=	yes
NO_CHECKSUM=	yes

INSTALLATION_DIRS=	share/gnupg

do-install:
	${INSTALL_DATA} ${FILESDIR}/pkgsrc-security.gpg ${DESTDIR}${PREFIX}/share/gnupg/

.include "../../mk/bsd.pkg.mk"
