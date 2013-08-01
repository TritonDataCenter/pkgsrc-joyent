# $NetBSD$
#

DISTNAME=	duo_unix-1.9.2
PKGNAME=	${DISTNAME:S/_/-/}
CATEGORIES=	security
MASTER_SITES=	https://dl.duosecurity.com/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.duosecurity.com/
COMMENT=	2 Factor Authentication provided by Duo Security
LICENSE=	gnu-gpl-v2

USE_LIBTOOL=	yes
USE_TOOLS+=	gmake pkg-config
GNU_CONFIGURE=	yes
FETCH_USING=	curl

PKGCONFIG_OVERRIDE+=	lib/libduo.pc.in

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}

INSTALLATION_DIRS=	share/examples/duo_unix

CONF_FILES+=	share/examples/duo_unix/login_duo.conf \
		${PKG_SYSCONFDIR}/login_duo.conf

SUBST_CLASSES+=		man
SUBST_STAGE.man=	post-patch
SUBST_MESSAGE.man=	Fixing sysconfdir references
SUBST_FILES.man=	login_duo/login_duo.8 pam_duo/pam_duo.8
SUBST_SED.man=		-e 's,/etc/duo,${PKG_SYSCONFDIR},g'

post-install:
	${INSTALL_DATA} ${WRKSRC}/login_duo/login_duo.conf ${DESTDIR}${PREFIX}/share/examples/duo_unix/

.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
