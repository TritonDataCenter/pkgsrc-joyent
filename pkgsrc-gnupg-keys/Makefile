# $NetBSD$
#
# To update:
#
#   $ gpg --keyserver hkp://pgp.mit.edu/ --search-keys pkgsrc-security@NetBSD.org
#   $ gpg --keyserver hkp://pgp.mit.edu/ --recv-keys <newkeyid>
#   $ gpg --export pkgsrc-security@NetBSD.org >files/pkgsrc-security.gpg
#

DISTNAME=	pkgsrc-gnupg-keys-20190423
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
