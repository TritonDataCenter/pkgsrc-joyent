# $NetBSD$

DISTNAME=	nutcracker-0.3.0
PKGREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://twemproxy.googlecode.com/files/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://github.com/twitter/twemproxy/
COMMENT=	Fast, light-weight proxy for memcached and redis (aka twemproxy)
LICENSE=	apache-2.0

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

.include "../../mk/bsd.prefs.mk"

NUTC_USER?=		nutcrack
NUTC_GROUP?=		nutcrack
NUTC_LOG_DIR?=		${VARBASE}/log/nutcracker

PKG_GROUPS?=		${NUTC_USER}
PKG_USERS?=		${NUTC_USER}:${NUTC_GROUP}
PKG_GECOS.${NUTC_USER}=	nutcracker daemon user
OWN_DIRS_PERMS+=	${NUTC_LOG_DIR} ${NUTC_USER} ${NUTC_GROUP} 0755

BUILD_DEFS+=		VARBASE NUTC_LOG_DIR NUTC_USER NUTC_GROUP
FILES_SUBST+=		NUTC_LOG_DIR=${NUTC_LOG_DIR} \
			NUTC_USER=${NUTC_USER} \
			NUTC_GROUP=${NUTC_GROUP}

CONF_FILES+=		share/examples/nutcracker/nutcracker.yml \
			${PKG_SYSCONFDIR}/nutcracker.yml

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	src/nc.c
SUBST_VARS.path=	PKG_SYSCONFDIR NUTC_LOG_DIR

CPPFLAGS.SunOS+=	-D_REENTRANT

INSTALLATION_DIRS+=	sbin share/examples/nutcracker

post-install:
	${INSTALL_DATA} ${WRKSRC}/conf/nutcracker.yml \
	  ${DESTDIR}${PREFIX}/share/examples/nutcracker/

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
