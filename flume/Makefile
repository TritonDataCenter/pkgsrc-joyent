# $NetBSD$
#

DISTNAME=	apache-flume-1.5.0-src
PKGNAME=	flume-1.5.0
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_APACHE:=flume/${PKGVERSION_NOREV}/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://flume.apache.org/
COMMENT=	Distributed log collection and aggregation
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_DEPENDS+=		apache-maven>=3:../../devel/apache-maven
DEPENDS+=		hadoop-[0-9]*:../../joyent/hadoop
DEPENDS+=		hbase-[0-9]*:../../joyent/hbase

USE_LANGUAGES=		# none
USE_TOOLS+=		gtar

MAKE_ENV+=		MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"

INSTALLATION_DIRS+=	bin share/examples share/flume

.include "../../mk/bsd.prefs.mk"

PKG_SYSCONFSUBDIR=	flume
FLUME_LOG_DIR?=		${VARBASE}/log/flume
OWN_DIRS+=		${FLUME_LOG_DIR}

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-build
SUBST_MESSAGE.paths=	Fixing default paths
SUBST_FILES.paths=	bin/flume-ng conf/log4j.properties
SUBST_VARS.paths=	FLUME_LOG_DIR PKG_SYSCONFDIR

CONF_FILES+=		share/examples/flume/flume-conf.properties.template	\
			${PKG_SYSCONFDIR}/flume-conf.properties
CONF_FILES_PERMS+=	share/examples/flume/flume-env.sh.template		\
			${PKG_SYSCONFDIR}/flume-env.sh				\
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0755
CONF_FILES+=		share/examples/flume/log4j.properties			\
			${PKG_SYSCONFDIR}/log4j.properties

post-extract:
	${CHOWN} -R ${ROOT_USER}:${ROOT_GROUP} ${WRKSRC}


do-build:
	${ECHO} '<settings>\
<localRepository>${WRKDIR}/.m2</localRepository>\
</settings>' > ${WRKDIR}/settings.xml
	${RM} -f ${WRKSRC}/bin/flume-ng.orig				\
	  ${WRKSRC}/conf/log4j.properties.orig
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} mvn		\
	  -DskipTests -s ${WRKDIR}/settings.xml install

do-install:
	cd ${DESTDIR}${PREFIX} && ${GTAR} --strip-components=1 -xzf	\
	  ${WRKSRC}/flume-ng-dist/target/${DISTNAME:S/src/bin/}.tar.gz	\
	  ${DISTNAME:S/src/bin/}/bin					\
	  ${DISTNAME:S/src/bin/}/conf					\
	  ${DISTNAME:S/src/bin/}/lib
	mv ${DESTDIR}${PREFIX}/conf					\
	  ${DESTDIR}${PREFIX}/share/examples/flume
	mv ${DESTDIR}${PREFIX}/lib					\
	  ${DESTDIR}${PREFIX}/share/flume/lib
	${LN} -sf ${PKG_SYSCONFDIR} ${DESTDIR}${PREFIX}/share/flume/conf

.include "../../joyent/hadoop/Makefile.common"
.include "../../devel/snappy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
