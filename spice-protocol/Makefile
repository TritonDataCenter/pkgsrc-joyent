# $NetBSD$
#

DISTNAME=	spice-protocol-0.12.5
CATEGORIES=	joyent
MASTER_SITES=	http://spice-space.org/download/releases/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	nshalman-pkgsrc@elys.com
HOMEPAGE=	http://spice-space.org/
COMMENT= 	Spice Protocol headers
LICENSE= 	modified-bsd

GNU_CONFIGURE=	yes
USE_LANGUAGES=	# none
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	spice-protocol.pc.in

.include "../../mk/bsd.pkg.mk"
