# $NetBSD$

DISTNAME=	kafka-0.8.2.1-src
PKGNAME=	${DISTNAME:S/-src//}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_APACHE:=kafka/${PKGVERSION_NOREV}/}
EXTRACT_SUFX=	.tgz

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://kafka.apache.org/
COMMENT=	High-throughput distributed messaging system
LICENSE=	apache-2.0

USE_LANGUAGES=	# none

BUILD_DEPENDS+=	gradle-[0-9]*:../../joyent/gradle
DEPENDS+=	zookeeper-server-[0-9]*:../../wip/zookeeper-server

REPLACE_SH+=	bin/kafka-*

MAKE_ENV+=	GRADLE_USER_HOME=${WRKDIR}/.gradle
FILES_SUBST+=	KAFKA_USER=${KAFKA_USER} KAFKA_GROUP=${KAFKA_GROUP}

PKG_SYSCONFSUBDIR=	kafka

.include "../../mk/bsd.prefs.mk"

KAFKA_DATADIR?=	${VARBASE}/db/kafka
KAFKA_LOGDIR?=	${VARBASE}/log/kafka
KAFKA_USER?=	kafka
KAFKA_GROUP?=	kafka

PKG_GROUPS+=		${KAFKA_GROUP}
PKG_USERS+=		${KAFKA_USER}:${KAFKA_GROUP}
PKG_GECOS.${KAFKA_USER}=Kafka service user
PKG_HOME.${KAFKA_USER}=	${KAFKA_DATADIR}

OWN_DIRS_PERMS+=	${KAFKA_DATADIR} ${KAFKA_USER} ${KAFKA_GROUP} 0755
OWN_DIRS_PERMS+=	${KAFKA_LOGDIR} ${KAFKA_USER} ${KAFKA_GROUP} 0755

CONFIG_FILES=		consumer log4j producer server test-log4j tools-log4j

.for file in ${CONFIG_FILES}
CONF_FILES+=		share/examples/kafka/${file}.properties		\
			${PKG_SYSCONFDIR}/${file}.properties
.endfor

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-build
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	bin/kafka-run-class.sh bin/kafka-server-start.sh
SUBST_FILES.path+=	config/server.properties
SUBST_VARS.path=	KAFKA_DATADIR KAFKA_LOGDIR PKG_SYSCONFDIR PKG_JAVA_HOME

INSTALLATION_DIRS+=	bin share/examples/kafka share/kafka/libs

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} gradle releaseTarGz

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/kafka-*.sh			\
		${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/clients/build/libs/*.jar		\
		${WRKSRC}/core/build/dependant-libs-2.10.4/*.jar	\
		${WRKSRC}/core/build/libs/*.jar				\
		${DESTDIR}${PREFIX}/share/kafka/libs
.for file in ${CONFIG_FILES}
	${INSTALL_DATA} ${WRKSRC}/config/${file}.properties		\
		${DESTDIR}${PREFIX}/share/examples/kafka
.endfor

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
