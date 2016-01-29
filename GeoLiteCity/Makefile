# $NetBSD$
#

DISTNAME=	GeoLiteCity.dat
PKGNAME=	${DISTNAME:S/.dat//}-${VERSION}
CATEGORIES=	net
MASTER_SITES=	http://geolite.maxmind.com/download/geoip/database/
EXTRACT_SUFX=	.gz

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://geolite.maxmind.com/download/geoip/database/
COMMENT=	Free alternative for the GeoIP City database
LICENSE=	cc-by-sa-v3.0

PKG_DESTDIR_SUPPORT=	user-destdir

VERSION!=	date +%Y%m

NO_CHECKSUM=	yes

DEPENDS+=	GeoIP-[0-9]*:../../net/GeoIP

NO_BUILD=	yes
WRKSRC=		${WRKDIR}
INSTALLATION_DIRS+=	share/GeoIP

do-install:
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME} ${DESTDIR}${PREFIX}/share/GeoIP
	cd ${DESTDIR}${PREFIX}/share/GeoIP && ${LN} -s ${DISTNAME} GeoIPCity.dat
	${INSTALL_DATA} ${FILESDIR}/${DISTNAME:S/.dat//}.license ${DESTDIR}${PREFIX}/share/GeoIP

USE_LANGUAGES=	# none

.include "../../mk/bsd.pkg.mk"
