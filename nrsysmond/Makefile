# $NetBSD$
#

DISTNAME=	newrelic-sysmond-1.5.1.93
PKGVERSION=	1.5.1.93
PKGNAME=	${DISTNAME:S/newrelic-/nr/}
CATEGORIES=	sysutils
MASTER_SITES=	# none

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://newrelic.com/
COMMENT=	New Relic Server Monitor
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		# none
NO_BUILD=		yes

BUILD_DEFS+=		VARBASE

.include "../../mk/bsd.fast.prefs.mk"

SUBST_CLASSES+=		etc
SUBST_STAGE.etc=	pre-install
SUBST_MESSAGE.etc=	Fixing default paths
SUBST_FILES.etc=	nrsysmond-config
SUBST_SED.etc=		-e 's,/etc/newrelic,${PKG_SYSCONFDIR},g'

CONF_FILES+=		share/examples/nrsysmond/nrsysmond.cfg \
			${PKG_SYSCONFDIR}/nrsysmond.cfg
INSTALLATION_DIRS=	sbin share/examples/nrsysmond
OWN_DIRS+=		${VARBASE}/log/newrelic

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/nrsysmond.x64	\
	  ${DESTDIR}${PREFIX}/sbin/nrsysmond
	${INSTALL_SCRIPT} ${WRKSRC}/nrsysmond-config	\
	  ${DESTDIR}${PREFIX}/sbin/
	${INSTALL_DATA} ${FILESDIR}/nrsysmond.cfg	\
	  ${DESTDIR}${PREFIX}/share/examples/nrsysmond/

.include "../../mk/bsd.pkg.mk"
