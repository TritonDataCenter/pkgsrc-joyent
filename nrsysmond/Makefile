# $NetBSD$
#

DISTNAME=	newrelic-sysmond-2.2.0.125-joyent
PKGNAME=	${DISTNAME:S/newrelic-/nr/:S/-joyent//}
CATEGORIES=	sysutils
MASTER_SITES=	http://download.newrelic.com/server_monitor/release/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://newrelic.com/
COMMENT=	New Relic Server Monitor
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		# none
NO_BUILD=		yes

BUILD_DEFS+=		VARBASE

.include "../../mk/bsd.fast.prefs.mk"

.if ${MACHINE_ARCH} == "x86_64"
NARCH=			x64
.else
NARCH=			x86
.endif

SUBST_CLASSES+=		etc
SUBST_STAGE.etc=	pre-install
SUBST_MESSAGE.etc=	Fixing default paths
SUBST_FILES.etc=	scripts/nrsysmond-config
SUBST_SED.etc=		-e 's,/etc/newrelic,${PKG_SYSCONFDIR},g'

CONF_FILES+=		share/examples/nrsysmond/nrsysmond.cfg \
			${PKG_SYSCONFDIR}/nrsysmond.cfg
INSTALLATION_DIRS=	sbin share/examples/nrsysmond
OWN_DIRS+=		${VARBASE}/log/newrelic

SMF_SRCDIR=		${WRKSRC}/scripts
SMF_MANIFEST=		nrsysmond.xml
SMF_MANIFEST.nrsysmond=	nrsysmond.xml
SMF_MANIFEST_SRC=	${SMF_SRCDIR}/${SMF_MANIFEST}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/daemon/nrsysmond.${NARCH}	\
	  ${DESTDIR}${PREFIX}/sbin/nrsysmond
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/nrsysmond-config	\
	  ${DESTDIR}${PREFIX}/sbin/
	${INSTALL_DATA} ${WRKSRC}/nrsysmond.cfg	\
	  ${DESTDIR}${PREFIX}/share/examples/nrsysmond/

.include "../../mk/bsd.pkg.mk"
