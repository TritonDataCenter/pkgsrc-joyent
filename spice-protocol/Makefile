# $NetBSD$
#

DISTNAME=	spice-protocol-0.12.3
CATEGORIES=	joyent
MASTER_SITES=	http://spice-space.org/download/releases/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	nshalman-pkgsrc@elys.com
HOMEPAGE=	http://spice-space.org/
COMMENT= Spice Protocol headers
LICENSE= modified-bsd

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	# none

PKGCONFIG_OVERRIDE+=	spice-protocol.pc.in

.include "../../mk/bsd.pkg.mk"
