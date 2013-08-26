# $NetBSD$
#

DISTNAME=	zoneinit-1.6.0
CATEGORIES=	sysutils
MASTER_SITES=	-https://github.com/joyent/${DISTNAME:S|-|/archive/|}${EXTRACT_SUFX}

MAINTAINER=	filip@joyent.com
#HOMEPAGE=	#
COMMENT=	Joyent Instance initialization toolchain
LICENSE=	mit

PKG_DESTDIR_SUPPORT=	user-destdir

FETCH_USING=		curl
NO_BUILD=		yes

PKG_SYSCONFSUBDIR=	zoneinit

ZONEINIT_INCLUDES=	00-mdata.sh 01-reboot-file.sh 02-config.sh	\
			04-mdata.sh 11-files.sh 12-network.sh		\
			91-passwords.sh 92-sshd.sh 999-cleanup.sh

.for f in ${ZONEINIT_INCLUDES}
CONF_FILES+=		share/examples/zoneinit/${f} ${PKG_SYSCONFDIR}/${f}
.endfor

INSTALLATION_DIRS+=	libexec share/examples/zoneinit share/smf/zoneinit
OWN_DIRS+=		${VARBASE}/zoneinit

SUBST_CLASSES+=		path
SUBST_STAGE.path=	post-patch
SUBST_MESSAGE.path=	Fixing paths
SUBST_FILES.path=	zoneinit zoneinit.json mdata.xml zoneinit.xml
SUBST_VARS.path=	PREFIX PKG_SYSCONFDIR PKGVERSION

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit ${DESTDIR}${PREFIX}/libexec
	${INSTALL_SCRIPT} ${WRKSRC}/mdata-fetch ${DESTDIR}${PREFIX}/libexec
	${INSTALL_SCRIPT} ${WRKSRC}/mdata-execute ${DESTDIR}${PREFIX}/libexec
	${INSTALL_DATA} ${WRKSRC}/mdata.xml ${DESTDIR}${PREFIX}/share/smf/zoneinit/mdata.xml
	${INSTALL_DATA} ${WRKSRC}/zoneinit.xml ${DESTDIR}${PREFIX}/share/smf/zoneinit/zoneinit.xml
	${INSTALL_DATA} ${WRKSRC}/zoneinit.json ${DESTDIR}${PREFIX}/share/examples/zoneinit
.for f in ${ZONEINIT_INCLUDES}
	${INSTALL_SCRIPT} ${WRKSRC}/includes/${f} ${DESTDIR}${PREFIX}/share/examples/zoneinit
.endfor

.include "../../mk/bsd.pkg.mk"
