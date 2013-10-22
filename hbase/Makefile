# $NetBSD$
#

DISTNAME=	hbase-0.94.7
CATEGORIES=	databases
MASTER_SITES=	http://www.us.apache.org/dist/hbase/${DISTNAME}/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://hbase.apache.org/
COMMENT=	Distributed, scalable, big data store for Hadoop
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	hadoop-[0-9]*:../../joyent/hadoop
DEPENDS+=	zookeeper-server-[0-9]*:../../wip/zookeeper-server

USE_LANGUAGES=	c++
NO_BUILD=	yes

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-install
SUBST_MESSAGE.paths=	Fixing paths
SUBST_FILES.paths=	../hbase bin/get-active-master.rb bin/hbase-config.sh
SUBST_FILES.paths+=	conf/hbase-env.sh
SUBST_VARS.paths=	PREFIX PKG_SYSCONFDIR PKG_SYSCONFBASE PKG_JAVA_HOME
SUBST_VARS.paths+=	HBASE_LOG_DIR HBASE_PID_DIR

PKG_SYSCONFSUBDIR=	hbase

PKG_USERS+=			${HBASE_USER}:${HADOOP_GROUP}
PKG_GECOS.${HBASE_USER}=	HBase user
PKG_HOME.${HBASE_USER}=		${HBASE_LOG_DIR}
PKG_SHELL.${HBASE_USER}=	${BASH}

OWN_DIRS_PERMS+=	${HBASE_LOG_DIR} ${HBASE_USER} ${HADOOP_GROUP} 755
OWN_DIRS_PERMS+=	${HBASE_PID_DIR} ${HBASE_USER} ${HADOOP_GROUP} 755

REPLACE_BASH+=		bin/*

INSTALLATION_DIRS+=	bin share/doc/hbase share/examples/hbase share/hbase

CONFIG_FILES=		hadoop-metrics.properties hbase-policy.xml		\
			hbase-site.xml log4j.properties regionservers

.for file in ${CONFIG_FILES}
CONF_FILES+=	share/examples/hbase/${file} ${PKG_SYSCONFDIR}/${file}
.endfor

CONF_FILES_PERMS+=	share/examples/hbase/hbase-env.sh			\
			${PKG_SYSCONFDIR}/hbase-env.sh				\
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0755

post-extract:
	${CP} ${FILESDIR}/hbase ${WRKDIR}/hbase
	${RM} -rf ${WRKSRC}/lib/native

pre-install:
	${RM} -f ${WRKSRC}/bin/*.orig ${WRKSRC}/conf/*.orig

do-install:
	cd ${WRKSRC} && (\
          ${PAX} -rw bin ${DESTDIR}${PREFIX}/ ;\
	  ${PAX} -rw LICENSE.txt NOTICE.txt README.txt \
	    ${DESTDIR}${PREFIX}/share/doc/hbase/ ;\
	  ${PAX} -rw hbase* lib ${DESTDIR}${PREFIX}/share/hbase/ ;\
	)
	cd ${WRKSRC}/conf && \
          ${PAX} -rw * ${DESTDIR}${PREFIX}/share/examples/hbase/
#	${INSTALL_SCRIPT} ${WRKDIR}/hbase ${DESTDIR}${PREFIX}/bin/hbase

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
