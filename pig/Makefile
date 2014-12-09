# $NetBSD$
#

DISTNAME=	pig-0.13.0
CATEGORIES=	parallel
MASTER_SITES=	${MASTER_SITE_APACHE:=pig/${DISTNAME}/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://pig.apache.org/
COMMENT=	Platform for analyzing large data sets
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	hadoop-[0-9]*:../../joyent/hadoop

USE_LANGUAGES=	# none
USE_TOOLS+=	pax
NO_BUILD=	yes

PKG_SYSCONFSUBDIR=	pig

PKG_USERS+=		${PIG_USER}:${HADOOP_GROUP}
PKG_GECOS.${PIG_USER}=	Pig user
PKG_HOME.${PIG_USER}=	${PIG_LOG_DIR}
PKG_SHELL.${PIG_USER}=	${BASH}

OWN_DIRS_PERMS+=	${PIG_LOG_DIR} ${PIG_USER} ${HADOOP_GROUP} 750
OWN_DIRS_PERMS+=	${PIG_PID_DIR} ${PIG_USER} ${HADOOP_GROUP} 750

CONF_FILES+=		share/examples/pig/log4j.properties.template \
			${PKG_SYSCONFDIR}/log4j.properties
CONF_FILES+=		share/examples/pig/pig.properties \
			${PKG_SYSCONFDIR}/pig.properties

INSTALLATION_DIRS+=	bin sbin share/doc/pig share/examples/pig share/pig \
			share/pig/lib share/pig/templates/conf

REPLACE_BASH+=		bin/pig src/packages/*.sh

SUBST_CLASSES+=		conf
SUBST_STAGE.conf=	pre-install
SUBST_MESSAGE.conf=	Fixing default paths
SUBST_FILES.conf=	bin/pig
SUBST_VARS.conf=	PIG_LOG_DIR PKG_JAVA_HOME PKG_SYSCONFDIR PREFIX

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/pig \
	  ${DESTDIR}${PREFIX}/bin/pig
	${INSTALL_SCRIPT} ${WRKSRC}/src/packages/*.sh \
	  ${DESTDIR}${PREFIX}/sbin/
	${INSTALL_DATA} ${WRKSRC}/conf/* \
	  ${DESTDIR}${PREFIX}/share/examples/pig/
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}-withouthadoop.jar \
	  ${DESTDIR}${PREFIX}/share/pig/
	${INSTALL_DATA} ${WRKSRC}/lib/jython-2.5.0.jar \
	  ${DESTDIR}${PREFIX}/share/pig/lib/
	${INSTALL_DATA} ${WRKSRC}/src/packages/templates/conf/pig-env.sh \
	  ${DESTDIR}${PREFIX}/share/pig/templates/conf/
	cd ${WRKSRC} && ${PAX} -rw contrib test tutorial \
	  ${DESTDIR}${PREFIX}/share/pig/
	cd ${WRKSRC}/docs && ${PAX} -rw * \
	  ${DESTDIR}${PREFIX}/share/doc/pig/
	cd ${WRKSRC} && ${PAX} -rw *.txt license \
	  ${DESTDIR}${PREFIX}/share/doc/pig/

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
