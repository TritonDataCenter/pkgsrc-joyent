# $NetBSD$
#

DISTNAME=	sqoop-1.4.2
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_APACHE:=sqoop/1.4.2/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://sqoop.apache.org
COMMENT=	Efficiently transfer bulk data between Hadoop and structured datastores
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_DEPENDS+=	asciidoc-[0-9]*:../../textproc/asciidoc
BUILD_DEPENDS+=	xmlto-[0-9]*:../../textproc/xmlto
DEPENDS+=	hadoop-[0-9]*:../../joyent/hadoop
DEENDS+=	hbase-[0-9]*:../../joyent/hbase

PYTHON_FOR_BUILD_ONLY=	yes

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-build
SUBST_MESSAGE.path=	Fix paths
SUBST_FILES.path=	build.xml bin/configure-sqoop
SUBST_VARS.path=	PYTHONBIN PREFIX PKG_SYSCONFBASE PKG_SYSCONFDIR

USE_LANGUAGES=	# none
USE_TOOLS=	gmake

BUILD_TARGET=	package

MAKE_ARGS+=	-Dhadoopversion=100
SQOOP_BUILD_DIR=	${WRKSRC}/build/${PKGNAME_NOREV}.bin__hadoop-1.0.0

PKG_SYSCONFSUBDIR=	sqoop
EXAMPLES=		sqoop-env-template.sh sqoop-site-template.xml
.for file in ${EXAMPLES}
CONF_FILES+=		share/examples/sqoop/${file} ${PKG_SYSCONFDIR}/${file:S/-template//}
.endfor

INSTALLATION_DIRS=	bin share/sqoop share/doc/sqoop share/examples/sqoop

pre-build:
	${RM} -f ${WRKSRC}/bin/configure-sqoop.orig

do-build: ant-build

do-install:
	cd ${SQOOP_BUILD_DIR} && (					\
	  ${PAX} -rw bin ${DESTDIR}${PREFIX}/ ;				\
	  ${PAX} -rw lib *.jar ${DESTDIR}${PREFIX}/share/sqoop/	;	\
	  ${PAX} -rw *.txt ${DESTDIR}${PREFIX}/share/doc/sqoop/	)
	cd ${SQOOP_BUILD_DIR}/docs && (					\
	  ${PAX} -rw man ${DESTDIR}${PREFIX}/ ;				\
	  ${PAX} -rw *.html api docbook.css images index.html 		\
	    ${DESTDIR}${PREFIX}/share/doc/sqoop/ )
.for file in ${EXAMPLES}
	${INSTALL_DATA} ${SQOOP_BUILD_DIR}/conf/${file} \
	  ${DESTDIR}${PREFIX}/share/examples/sqoop/${file}
.endfor

.include "../../joyent/hadoop/Makefile.common"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
