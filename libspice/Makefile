# $NetBSD$
#

DISTNAME=	spice-0.12.2
PKGNAME= 	lib${DISTNAME}
CATEGORIES=	joyent
MASTER_SITES=	http://spice-space.org/download/releases/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	nshalman-pkgsrc@elys.com
HOMEPAGE=	http://spice-space.org/
COMMENT= 	Spice server code library for QEMU
LICENSE= 	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_MULTIARCH=	lib
USE_TOOLS+=	pkg-config

CONFIGURE_ARGS+= --disable-client --enable-smartcard=no

PKGCONFIG_OVERRIDE+=	spice-common/spice-protocol/spice-protocol.pc.in
PKGCONFIG_OVERRIDE+=	spice-server.pc.in

.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"
.include "../../joyent/celt051/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../graphics/libjpeg-turbo/buildlink3.mk"

.include "../../lang/python/extension.mk"
PYTHON_FOR_BUILD_ONLY=yes
BUILD_DEPENDS+= ${PYPKGPREFIX}-parsing-[0-9]*:../../wip/py-parsing

.include "../../mk/bsd.pkg.mk"
