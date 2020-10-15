# $NetBSD$
#
# To update:
#
#   $ curl https://pkgsrc.org/pkgsrc-security_pgp_key.asc | gpg2 --import
#   $ gpg2 --list-keys pkgserc-security
#   $ gpg2 --export <latest keyid> >files/pkgsrc-security.gpg
#
# Note that only the most recent keyid is exported rather than all of them,
# as for a while pkgsrc-security used a GPG key format that was incompatible
# with netpgp and still causes warnings if available in the keyring.
#

DISTNAME=	pkgsrc-gnupg-keys-20201014
CATEGORIES=	security
MASTER_SITES=	#empty
DISTFILES=	#empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://pkgsrc.joyent.com/
COMMENT=	GnuPG keys for pkgsrc infrastructure
LICENSE=	public-domain

NO_BUILD=	yes
NO_CHECKSUM=	yes

INSTALLATION_DIRS=	share/gnupg

do-install:
	${INSTALL_DATA} ${FILESDIR}/pkgsrc-security.gpg ${DESTDIR}${PREFIX}/share/gnupg/

.include "../../mk/bsd.pkg.mk"
