# $NetBSD$
#

DISTNAME=	usbredir-0.4.4
CATEGORIES=	joyent
MASTER_SITES=	http://spice-space.org/download/usbredir/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	nshalman-pkgsrc@elys.com
HOMEPAGE=	http://spice-space.org/page/UsbRedir
COMMENT= USB redirection library
LICENSE= gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	usbredirhost/libusbredirhost.pc.in
PKGCONFIG_OVERRIDE+=	usbredirparser/libusbredirparser.pc.in
USE_MULTIARCH=lib

.include "../../mk/bsd.pkg.mk"
