# $NetBSD$
#

DISTNAME=	hadoop-lzo
PKGNAME=	${DISTNAME}-0.4.17${GIT_TAG}
CATEGORIES=	archivers

MAINTAINER=	filip@joyent.com
HOMEPAGE=	https://github.com/twitter/hadoop-lzo
COMMENT=	Refactored version of hadoop-gpl-compression with LZO
LICENSE=	mit

GIT_REPOSITORIES=	hadoop-lzo
GIT_REPO.hadoop-lzo=	git://github.com/twitter/hadoop-lzo.git

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes

.include "../../joyent/hadoop/Makefile.common"

DEPENDS+=		hadoop-[0-9]*:../../joyent/hadoop

MAKE_ENV+=		JAVA_HOME=${PKG_JAVA_HOME}			\
			C_INCLUDE_PATH=${BUILDLINK_PREFIX.lzo}/include	\
			LIBRARY_PATH=${BUILDLINK_PREFIX.lzo}/lib

SUBST_CLASSES+=		ldflags
SUBST_STAGE.ldflags=	pre-build
SUBST_MESSAGE.ldflags=	Fixing LDFLAGS
SUBST_FILES.ldflags=	build.xml
SUBST_VARS.ldflags=	LDFLAGS JAVA_ARCH

HADOOP_HOME?=		hadoop
INSTALLATION_DIRS+=	${HADOOP_HOME}/lib/native/${HADOOP_ARCH}

BUILD_TARGETS+=	compile jar

do-test:
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} ant test ${MAKE_ARGS}

do-install:
	cd ${WRKSRC}/build/native/${HADOOP_ARCH}/lib && \
	  ${PAX} -rw -p e * ${DESTDIR}${HADOOP_HOME}/lib/native/${HADOOP_ARCH}
	${INSTALL_DATA} ${WRKSRC}/build/hadoop-lzo-0.4.17-SNAPSHOT.jar ${DESTDIR}${HADOOP_HOME}

.include "../../archivers/lzo/buildlink3.mk"
.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
