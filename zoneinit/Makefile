# $NetBSD$
#

DISTNAME=	zoneinit-1.6.3
CATEGORIES=	sysutils
MASTER_SITES=	-https://github.com/joyent/${DISTNAME:S|-|/archive/|}${EXTRACT_SUFX}

MAINTAINER=	filip@joyent.com
#HOMEPAGE=	#
COMMENT=	Joyent Instance initialization toolchain
LICENSE=	mit

CONFLICTS+=	smtools<20131016

PKG_DESTDIR_SUPPORT=	user-destdir

FETCH_USING=		curl
NO_BUILD=		yes

SMF_SRCDIR=		${WRKSRC}
SMF_MANIFEST=		zoneinit.xml
SMF_METHODS=		zoneinit mdata-fetch mdata-execute
SMF_METHOD_SRC.zoneinit=	${SMF_SRCDIR}/zoneinit
SMF_METHOD_SRC.mdata-fetch=	${SMF_SRCDIR}/mdata-fetch
SMF_METHOD_SRC.mdata-execute=	${SMF_SRCDIR}/mdata-execute

PKG_SYSCONFSUBDIR=	zoneinit

ZONEINIT_INCLUDES=	00-mdata.sh 01-reboot-file.sh 02-config.sh	\
			04-mdata.sh 11-files.sh 12-network.sh		\
			91-passwords.sh 92-sshd.sh 999-cleanup.sh

.for f in ${ZONEINIT_INCLUDES}
CONF_FILES+=		share/examples/zoneinit/${f} ${PKG_SYSCONFDIR}/${f}
.endfor
REQD_FILES+=		share/examples/zoneinit/zoneinit.json \
			${VARBASE}/zoneinit/zoneinit.json

INSTALLATION_DIRS+=	share/examples/zoneinit
OWN_DIRS+=		${VARBASE}/zoneinit

FILES_SUBST+=		PKG_SMF_MANIFEST_DIR=${PKG_SMF_MANIFEST_DIR}

SUBST_CLASSES+=		path
SUBST_STAGE.path=	post-patch
SUBST_MESSAGE.path=	Fixing paths
SUBST_FILES.path=	zoneinit zoneinit.json mdata.xml zoneinit.xml
SUBST_VARS.path=	PREFIX PKG_SYSCONFDIR PKGVERSION
SUBST_VARS.path+=	SMF_METHOD_FILE.mdata-fetch SMF_METHOD_FILE.mdata-execute

do-install:
	${INSTALL_DATA} ${WRKSRC}/mdata.xml ${DESTDIR}${PREFIX}/${PKG_SMF_MANIFEST_DIR}/
	${INSTALL_DATA} ${WRKSRC}/zoneinit.json ${DESTDIR}${PREFIX}/share/examples/zoneinit
.for f in ${ZONEINIT_INCLUDES}
	${INSTALL_SCRIPT} ${WRKSRC}/includes/${f} ${DESTDIR}${PREFIX}/share/examples/zoneinit
.endfor

.include "../../mk/bsd.pkg.mk"
