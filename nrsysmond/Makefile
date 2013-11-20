# $NetBSD$
#

DISTNAME=	newrelic-sysmond-${PKGVERSION}-joyent
PKGVERSION=	1.3.1.437
PKGNAME=	nrsysmond-${PKGVERSION}
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

SMF_SRCDIR=		${WRKSRC}/scripts
SMF_MANIFEST=		nrsysmond.xml
SMF_MANIFEST_SRC=	${SMF_SRCDIR}/${SMF_MANIFEST}
OWN_DIRS+=		${VARBASE}/log/newrelic

CONF_FILES+=		share/examples/nrsysmond/nrsysmond.cfg \
			${PKG_SYSCONFDIR}/nrsysmond.cfg
INSTALLATION_DIRS=	sbin share/examples/nrsysmond

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/daemon/nrsysmond		\
	  ${DESTDIR}${PREFIX}/sbin/
	${INSTALL_DATA} ${WRKSRC}/daemon/nrsysmond.cfg	\
	  ${DESTDIR}${PREFIX}/share/examples/nrsysmond/
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/nrsysmond-config	\
	  ${DESTDIR}${PREFIX}/sbin/

.include "../../mk/bsd.pkg.mk"
