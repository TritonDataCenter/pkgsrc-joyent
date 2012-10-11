# $NetBSD$
#

DISTNAME=	enstratus-agent-smartos-latest
PKGNAME=	enstratus-agent-17
CATEGORIES=	sysutils
MASTER_SITES=	http://es-download.s3.amazonaws.com/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.enstratus.com/
COMMENT=	enStratus agent
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}/enstratus
USE_LANGUAGES=	# none
USE_TOOLS+=	bash:run pax
NO_BUILD=	yes

.include "../../mk/java-vm.mk"

BUILDLINK_DEPMETHOD.sun-jdk6=	full

DEPENDS+=	coreutils-[0-9]*:../../sysutils/coreutils
DEPENDS+=	findutils-[0-9]*:../../sysutils/findutils
DEPENDS+=	gmake-[0-9]*:../../devel/gmake
DEPENDS+=	gtar-base-[0-9]*:../../archivers/gtar-base
DEPENDS+=	less-[0-9]*:../../misc/less
DEPENDS+=	postfix-[0-9]*:../../mail/postfix
DEPENDS+=	sudo-[0-9]*:../../security/sudo
DEPENDS+=	unzip-[0-9]*:../../archivers/unzip
DEPENDS+=	zip-[0-9]*:../../archivers/zip

ENSTRATUS_DIR?=	${VARBASE}/enstratus
ENSTRATUS_USER?=enstratus

PKG_GROUPS+=	${ENSTRATUS_USER}
PKG_USERS+=	${ENSTRATUS_USER}:${ENSTRATUS_USER}
PKG_GECOS.${ENSTRATUS_USER}=	enStratus agent user
PKG_HOME.${ENSTRATUS_USER}=	${PREFIX}/enstratus/home
PKG_SHELL.${ENSTRATUS_USER}=	${BASH}

OWN_DIRS+=	${PREFIX}/enstratus/home
OWN_DIRS+=	${PREFIX}/enstratus/ws/tomcat/logs
OWN_DIRS+=	${ENSTRATUS_DIR} ${ENSTRATUS_DIR}/tmp
OWN_DIRS_PERMS+=	${ENSTRATUS_DIR} ${ENSTRATUS_USER} ${ENSTRATUS_USER} 0770
OWN_DIRS_PERMS+=	${ENSTRATUS_DIR}/tmp ${ENSTRATUS_USER} ${ENSTRATUS_USER} 0770

INSTALLATION_DIRS+=	enstratus

SUBST_CLASSES+=		vars
SUBST_STAGE.vars=	post-patch
SUBST_MESSAGE.vars=	Setting variables
SUBST_FILES.vars=	bin/enstratus-service
SUBST_SED.vars=		-e 's,javaHome,${PKG_JAVA_HOME},'

FILES_SUBST+=		ENSTRATUS_USER=${ENSTRATUS_USER}

post-extract:
	${CP} ${FILESDIR}/enstratus-webservices.cfg \
	  ${WRKSRC}/ws/content/WEB-INF/classes/

do-install:
	cd ${WRKSRC} && ${PAX} -rw -p e * ${DESTDIR}${PREFIX}/enstratus/
	${RM} ${DESTDIR}${PREFIX}/enstratus/install.sh

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
