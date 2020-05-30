# $NetBSD$
#
# To update:
#
#   $ curl https://pkgsrc.org/pkgsrc-security_pgp_key.asc | gpg2 --import
#   $ gpg2 --export pkgsrc-security@NetBSD.org >files/pkgsrc-security.gpg
#

DISTNAME=	pkgsrc-gnupg-keys-20200530
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
