# $NetBSD$

DISTNAME=		ioncube_loaders_${IONCUBE_OPSYS}_${IONCUBE_ARCH}
PKGNAME=		${PHP_PKG_PREFIX}-ioncube
MODNAME=		ioncube_loader_${IONCUBE_OPSYS}_${IONCUBE_PHP}
CATEGORIES+=		devel
MASTER_SITES=		http://downloads3.ioncube.com/loader_downloads/

MAINTAINER=		filip@joyent.com
COMMENT=		PHP ionCube Encoder
#LICENSE=		# unknown

.include "../../mk/bsd.prefs.mk"

IONCUBE_OPSYS=		${LOWER_OPSYS:S/solaris/sunos/:C/(...).*/\1/}
IONCUBE_ARCH=		${MACHINE_ARCH:S/i386/x86/:S/_/-/}
IONCUBE_PHP=		${PKG_PHP_VERSION:S/5/5./}

ONLY_FOR_PLATFORM=	FreeBSD-[467-9].*-* OpenBSD-4.[5-7]-*		\
			Darwin-*-* Linux-*-* SunOS-*-i386

PHP_VERSIONS_ACCEPTED=	55 54 53

NO_CHECKSUM=		yes
NO_BUILD=		yes
NO_CONFIGURE=		yes

.include "../../lang/php/ext.mk"

EXTRACT_ELEMENTS=	# empty
WRKSRC=			${WRKDIR}/ioncube
MODULESDIR=		${WRKSRC}
MESSAGE_SRC=		${.CURDIR}/MESSAGE
PLIST_SRC=		${.CURDIR}/PLIST
DISTINFO_FILE=		${.CURDIR}/distinfo

INSTALLATION_DIRS+=	share/examples/ioncube

.include "../../mk/bsd.pkg.mk"
