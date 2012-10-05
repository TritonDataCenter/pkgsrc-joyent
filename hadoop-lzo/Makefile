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

BUILD_DEPENDS+=	apache-ant-[0-9]*:../../devel/apache-ant

MAKE_ENV+=		JAVA_HOME=${PKG_JAVA_HOME}			\
			C_INCLUDE_PATH=${BUILDLINK_PREFIX.lzo}/include	\
			LIBRARY_PATH=${BUILDLINK_PREFIX.lzo}/lib

.if defined(MACHINE_ARCH) && ${MACHINE_ARCH} == "x86_64"
JAVA_ARCH=		amd64
.else
JAVA_ARCH=		i386
.endif

SUBST_CLASSES+=		ldflags
SUBST_STAGE.ldflags=	pre-build
SUBST_MESSAGE.ldflags=	Fixing LDFLAGS
SUBST_FILES.ldflags=	build.xml
SUBST_VARS.ldflags=	LDFLAGS JAVA_ARCH

HADOOP_HOME?=		hadoop
INSTALLATION_DIRS+=	${HADOOP_HOME}/${DISTNAME}

do-build:
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} ant package

do-test:
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} ant test

do-install:
	cd ${WRKSRC} && ${CP} -Rp build/${PKGNAME_NOREV}-SNAPSHOT/* ${DESTDIR}${PREFIX}/${HADOOP_HOME}/${DISTNAME}/

.include "../../wip/mk/git-package.mk"
.include "../../archivers/lzo/buildlink3.mk"
.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
