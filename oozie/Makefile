# $NetBSD$
#

DISTNAME=	oozie-3.3.1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.us.apache.org/dist/oozie/3.3.1/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://oozie.apache.org
COMMENT=	Workflow scheduler system to manage Apache Hadoop jobs
LICENSE=	apache-2.0

DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DISTFILES+=		ext-2.2.zip
SITES.ext-2.2.zip=	http://dev.sencha.com/deploy/

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	# none
USE_TOOLS=	unzip zip

BUILD_DEPENDS+=		apache-maven>=3:../../devel/apache-maven
DEPENDS+=		hadoop-[0-9]*:../../joyent/hadoop

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-build
SUBST_MESSAGE.path=	Fixing paths
SUBST_FILES.path=	distro/src/main/bin/oozie-sys.sh
SUBST_FILES.path+=	distro/src/main/bin/oozied.sh
SUBST_FILES.path+=	distro/src/main/bin/oozie-setup.sh
SUBST_FILES.path+=	core/src/main/conf/oozie-site.xml
SUBST_FILES.path+=	tools/src/main/bin/ooziedb.sh
SUBST_VARS.path=	PKG_SYSCONFBASE PKG_SYSCONFDIR
SUBST_VARS.path+=	OOZIE_DATA_DIR OOZIE_LOG_DIR OOZIE_PID_DIR

PKG_SYSCONFSUBDIR=	oozie

PKG_USERS+=		${OOZIE_USER}:${HADOOP_GROUP}
PKG_GECOS.${OOZIE_USER}=Oozie user
PKG_HOME.${OOZIE_USER}= ${OOZIE_DATA_DIR}
PKG_SHELL.${OOZIE_USER}=${BASH}

OWN_DIRS_PERMS+=	${OOZIE_DATA_DIR} ${OOZIE_USER} ${HADOOP_GROUP} 755
OWN_DIRS_PERMS+=	${OOZIE_LOG_DIR} ${OOZIE_USER} ${HADOOP_GROUP} 755
OWN_DIRS_PERMS+=	${OOZIE_PID_DIR} ${OOZIE_USER} ${HADOOP_GROUP} 755

CONF_FILES+=		share/examples/oozie/adminusers.txt		\
			${PKG_SYSCONFDIR}/adminusers.txt
CONF_FILES+=		share/examples/oozie/oozie-env.sh		\
			${PKG_SYSCONFDIR}/oozie-env.sh
CONF_FILES+=		share/examples/oozie/oozie-log4j.properties	\
			${PKG_SYSCONFDIR}/oozie-log4j.properties
CONF_FILES+=		share/examples/oozie/oozie-site.xml		\
			${PKG_SYSCONFDIR}/oozie-site.xml

MAKE_ARGS=		-Dhadoop.version=1.0.1 \
			-Dpig.version=0.10.1 \
			-DskipTests=true

INSTALLATION_DIRS+=	bin share/oozie share/examples/oozie

pre-build:
	${RM} -f ${WRKSRC}/distro/src/main/bin/*.orig 				\
	  ${WRKSRC}/core/src/main/conf/oozie-site.xml.orig			\
	  ${WRKSRC}/tools/src/main/bin/ooziedb.sh.orig

do-build:
	cd ${WRKSRC} && mvn clean package assembly:single ${MAKE_ARGS}

post-build:
	${MKDIR} ${WRKSRC}/distro/target/${DISTNAME}-distro/${DISTNAME}/tmp
	cd ${WRKSRC}/distro/target/${DISTNAME}-distro/${DISTNAME}/tmp && (	\
	unzip ../oozie.war ;							\
	${CP} ${PREFIX}/share/hadoop/hadoop-core-*.jar ./WEB-INF/lib/ ;		\
	${CP} ${PREFIX}/share/hadoop/lib/jackson*jar ./WEB-INF/lib/ ;		\
	${CP} ${PREFIX}/share/hadoop/lib/commons-configuration*jar ./WEB-INF/lib/ ;\
	${MV} ${WRKDIR}/ext-2.2 ./ ;						\
	zip -r ../oozie.war * )

do-install:
	cd ${WRKSRC}/distro/target/${DISTNAME}-distro/${DISTNAME} && (		\
	  ${PAX} -rw bin ${DESTDIR}${PREFIX}/share/oozie/ ;			\
	  ${PAX} -rw lib libtools oozie* ${DESTDIR}${PREFIX}/share/oozie/ )
	cd ${WRKSRC}/distro/target/${DISTNAME}-distro/${DISTNAME}/conf && 	\
	  ${PAX} -rw * ${DESTDIR}${PREFIX}/share/examples/oozie/
	${LN} -s ../share/oozie/bin/oozie ${DESTDIR}${PREFIX}/bin/oozie
	${LN} -s ../share/oozie/bin/oozie-run.sh ${DESTDIR}${PREFIX}/bin/oozie-run.sh
	${LN} -s ../share/oozie/bin/oozie-setup.sh ${DESTDIR}${PREFIX}/bin/oozie-setup.sh
	${LN} -s ../share/oozie/bin/oozie-start.sh ${DESTDIR}${PREFIX}/bin/oozie-start.sh
	${LN} -s ../share/oozie/bin/oozie-stop.sh ${DESTDIR}${PREFIX}/bin/oozie-stop.sh

post-install:
	${CHMOD} -R g-w,o-w ${DESTDIR}${PREFIX}

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
