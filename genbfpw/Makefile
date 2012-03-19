# $NetBSD$
#

DISTNAME=	genbfpw
PKGNAME=	genbfpw-0
CATEGORIES=	sysutils
MASTER_SITES=	http://toves.freeshell.org/bf/files/
EXTRACT_SUFX=	.tar

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://toves.freeshell.org/bf/
COMMENT=	Simple tool to generate Blowfish crypts of passwords
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=	gmake tar curl
BUILD_TARGET=	${DISTNAME}

BUILD_DEPENDS+=	curl-[0-9]*:../../www/curl

CRYPT_BF=crypt_blowfish-1.0.2
CRYPT_BF_URL=http://www.openwall.com/crypt/${CRYPT_BF}.tar.gz

MAKE_ENV+=	CRYPT_BF=${CRYPT_BF}
AUTO_MKDIRS=	yes

post-extract:
	cd ${WRKSRC} && ( curl ${CRYPT_BF_URL} | ${TAR} -xzf - )

pre-build:
	cd ${WRKSRC}/${CRYPT_BF} && gmake

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${DISTNAME} ${DESTDIR}${PREFIX}/bin/

.include "../../mk/bsd.pkg.mk"
