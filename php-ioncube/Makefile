# $NetBSD$

PKGNAME=		${PHP_PKG_PREFIX}-ioncube
DISTNAME=		ioncube_loaders_sun_x86
MODNAME=		ioncube_loader_sun_5.3
CATEGORIES+=		devel
MASTER_SITES=		http://downloads2.ioncube.com/loader_downloads/

MAINTAINER=		filip@joyent.com
COMMENT=		PHP ionCube Encoder

PKG_DESTDIR_SUPPORT=	user-destdir

NO_CHECKSUM=		yes
NO_BUILD=		yes
NO_CONFIGURE=		yes
EXTRACT_ELEMENTS=	# empty
WRKSRC=			${WRKDIR}/ioncube
MODULESDIR=		${WRKSRC}
INSTALLATION_DIRS+=	share/examples/ioncube
PLIST_SRC=		${.CURDIR}/PLIST

.include "../../lang/php/ext.mk"
.include "../../mk/bsd.pkg.mk"
