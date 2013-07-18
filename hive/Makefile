# $NetBSD$
#

DISTNAME=	hive-0.11.0
CATEGORIES=	databases
MASTER_SITES=	http://www.us.apache.org/dist/hive/${DISTNAME}/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://hive.apache.org/
COMMENT=	Data warehouse system for Hadoop
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=		hadoop-[0-9]*:../../joyent/hadoop
DEPENDS+=		hbase-[0-9]*:../../joyent/hbase
DEPENDS+=		zookeeper-server-[0-9]*:../../wip/zookeeper-server

USE_LANGUAGES=		c c++
USE_TOOLS+=		bash:run pax

WRKSRC=			${WRKDIR}/${DISTNAME}/src
BUILD_TARGET=		package

SUBST_CLASSES+=	paths
SUBST_STAGE.paths=	pre-build
SUBST_MESSAGE.paths=	Fixing default paths
SUBST_FILES.paths=	${WRKDIR}/hive bin/hive-config.sh bin/hive-update.sh
SUBST_FILES.paths+=	common/src/java/conf/hive-log4j.properties
SUBST_FILES.paths+=	ql/src/java/conf/hive-exec-log4j.properties
SUBST_VARS.paths=	PREFIX PKG_JAVA_HOME PKG_SYSCONFDIR HIVE_LOG_DIR

PKG_SYSCONFSUBDIR=	hive

PKG_USERS+=		${HIVE_USER}:${HADOOP_GROUP}
PKG_GECOS.${HIVE_USER}=	Hive user
PKG_HOME.${HIVE_USER}=	${HIVE_LOG_DIR}
PKG_SHELL.${HIVE_USER}=	${BASH}

OWN_DIRS_PERMS+=	${HIVE_LOG_DIR} ${HIVE_USER} ${HADOOP_GROUP} 755

REPLACE_BASH+=		bin/beeline bin/hive bin/hiveserver2 bin/hive-config.sh bin/metatool bin/ext/*.sh
CHECK_INTERPRETER_SKIP=	share/hive/lib/py/*
CONFIG_FILES=		hive-default.xml.template hive-env.sh.template \
			hive-exec-log4j.properties.template \
			hive-log4j.properties.template hive-site.xml

.for file in ${CONFIG_FILES}
CONF_FILES+=		share/examples/hive/${file} \
			${PKG_SYSCONFDIR}/${file:S/.template$//}
.endfor

INSTALLATION_DIRS+=	bin share/doc/hive share/hive share/examples/hive

post-extract:
	${CP} ${FILESDIR}/hive ${WRKDIR}/hive

do-build: ant-build

do-install:
	cd ${WRKSRC}/build/dist && (\
	  ${PAX} -rw bin ${DESTDIR}${PREFIX}/;\
	  ${PAX} -rw lib scripts ${DESTDIR}${PREFIX}/share/hive/;\
	  ${PAX} -rw LICENSE NOTICE README.txt RELEASE_NOTES.txt \
	    ${DESTDIR}${PREFIX}/share/doc/hive/;\
	)
#	cd ${WRKSRC}/build/dist/lib && (\
#	  ${PAX} -rw *.jar *.war ${DESTDIR}${PREFIX}/lib/;\
#	  ${PAX} -rw php py ${DESTDIR}${PREFIX}/share/hive/;\
#	)
	cd ${WRKSRC}/build/dist/conf && \
	  ${PAX} -rw * ${DESTDIR}${PREFIX}/share/examples/hive/
	cd ${WRKSRC}/build/dist/examples && \
	  ${PAX} -rw * ${DESTDIR}${PREFIX}/share/examples/hive/
	${INSTALL_DATA} ${WRKSRC}/conf/hive-site.xml \
	  ${DESTDIR}${PREFIX}/share/examples/hive/
#	${INSTALL_SCRIPT} ${WRKDIR}/hive ${DESTDIR}${PREFIX}/bin/hive

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
