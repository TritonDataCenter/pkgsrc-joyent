# $NetBSD$
#

DISTNAME=	hcatalog-src-0.4.0-incubating
PKGNAME=	hcatalog-0.4.0
CATEGORIES=	databases
MASTER_SITES=	http://www.us.apache.org/dist/incubator/hcatalog/${PKGNAME}-incubating/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://incubator.apache.org/hcatalog/
COMMENT=	Table and storage management service for Apache Hadoop
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	hive-[0-9]*:../../joyent/hive

USE_LANGUAGES=	# none

BUILD_TARGET=	package

PKG_SYSCONFSUBDIR=	hcatalog

CONF_FILES=	share/examples/hcatalog/jndi.properties \
		${PKG_SYSCONFDIR}/jndi.properties
CONF_FILES+=	share/examples/hcatalog/proto-hive-site.xml \
		${PKG_SYSCONFDIR}/proto-hive-site.xml

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-build
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	bin/hcat bin/hcat_server.sh
SUBST_VARS.path=	HCAT_LOG_DIR PKG_SYSCONFDIR PKG_SYSCONFBASE PREFIX

REPLACE_BASH+=	bin/hcat bin/hcat_server.sh src/packages/update-hcatalog-env.sh

INSTALLATION_DIRS+=	share/examples/hcatalog

do-install:
	cd ${WRKSRC}/build/${PKGNAME}-dev && \
	  ${PAX} -rw bin libexec sbin share ${DESTDIR}${PREFIX}/
	${INSTALL_DATA} ${WRKSRC}/build/${PKGNAME}-dev/etc/hcatalog/jndi.properties \
	  ${DESTDIR}${PREFIX}/share/examples/hcatalog/
	${INSTALL_DATA} ${WRKSRC}/build/${PKGNAME}-dev/etc/hcatalog/proto-hive-site.xml \
	  ${DESTDIR}${PREFIX}/share/examples/hcatalog/

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
