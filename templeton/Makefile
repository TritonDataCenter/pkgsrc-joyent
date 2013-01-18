# $NetBSD$
#

DISTNAME=	templeton-0.1.0
CATEGORIES=	www
MASTER_SITES=	http://people.apache.org/~thejas/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://people.apache.org/~thejas/templeton_doc_latest/
COMMENT=	REST-like web API for Hadoop
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	hadoop-[0-9]*:../../joyent/hadoop

USE_LANGUAGES=	# none
NO_BUILD=	yes

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-install
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	conf/templeton-site.xmla libexec/templeton_config.sh
SUBST_VARS.path=	PKGNAME PKG_SYSCONFDIR TEMPLETON_PID_DIR TEMPLETON_LOG_DIR

REPLACE_BASH+=		sbin/templeton_server.sh sbin/update-templeton-env.sh	\
			libexec/templeton_config.sh

INSTALLATION_DIRS+=	libexec sbin share/examples/templeton			\
			share/doc/templeton share/templeton

PKG_SYSCONFSUBDIR=	templeton
CONF_FILES+=		share/examples/templeton/templeton-log4j.properties	\
			  ${PKG_SYSCONFDIR}/templeton-log4j.properties
CONF_FILES+=		share/examples/templeton/templeton-site.xml		\
			  ${PKG_SYSCONFDIR}/templeton-site.xml

PKG_USERS+=			${TEMPLETON_USER}:${HADOOP_GROUP}
PKG_GECOS.${TEMPLETON_USER}=	templeton user
PKG_HOME.${TEMPLETON_USER}=	${TEMPLETON_LOG_DIR}
PKG_SHELL.${TEMPLETON_USER}=	${BASH}

OWN_DIRS_PERMS+=	${TEMPLETON_LOG_DIR} ${TEMPLETON_USER} ${HADOOP_GROUP} 755
OWN_DIRS_PERMS+=	${TEMPLETON_PID_DIR} ${TEMPLETON_USER} ${HADOOP_GROUP} 755

do-install:
	${RM} -f ${WRKSRC}/conf/templeton-site.xml.orig				\
	  ${WRKSRC}/libexec/templeton_config.sh.orig
	cd ${WRKSRC} && (\
	  ${PAX} -rw libexec sbin share ${DESTDIR}${PREFIX}/ ;			\
	  ${PAX} -rw *.jar ${DESTDIR}${PREFIX}/share/templeton/ ;		\
	)
	${INSTALL_DATA} ${WRKSRC}/conf/* ${DESTDIR}${PREFIX}/share/examples/templeton/
	${INSTALL_DATA} ${WRKSRC}/docs/*.txt ${DESTDIR}${PREFIX}/share/doc/templeton/
	${LN} -s templeton.jar ${DESTDIR}${PREFIX}/share/templeton/${PKGBASE}.jar

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
