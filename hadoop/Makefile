# $NetBSD$
#

DISTNAME=	hadoop-1.0.4
PKGREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_APACHE:=hadoop/common/${DISTNAME}/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://hadoop.apache.org/
COMMENT=	Framework for distributed processing of large data sets
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake autoconf automake pax tar

.include "../../joyent/hadoop/Makefile.common"

BUILD_DEFS+=	VARBASE HADOOP_USER HADOOP_GROUP HADOOP_DIR HADOOP_LOGDIR

HADOOP_USER?=			hadoop
HADOOP_GROUP?=			hadoop
HADOOP_DIR?=			${VARBASE}/hadoop
HADOOP_LOGDIR?=			${VARBASE}/log/hadoop

PKG_GROUPS+=			${HADOOP_USER}
PKG_USERS+=			${HADOOP_USER}:${HADOOP_GROUP}
PKG_GECOS.${HADOOP_USER}=	Hadoop user
PKG_HOME.${HADOOP_USER}=	${HADOOP_DIR}
PKG_SHELL.${HADOOP_USER}=	${BASH}

OWN_DIRS_PERMS+=		${HADOOP_DIR} ${HADOOP_USER} ${HADOOP_GROUP} 750
OWN_DIRS_PERMS+=		${HADOOP_LOGDIR} ${HADOOP_USER} ${HADOOP_GROUP} 750

CHECK_PORTABILITY_SKIP+=	src/contrib/streaming/src/test/system/scripts/StreamMapper.sh
REPLACE_BASH+=			bin/hadoop bin/rcc bin/*.sh src/contrib/hdfsproxy/bin/*	\
				src/contrib/hod/bin/checknodes sbin/* src/packages/*.sh

MAKE_ARGS=	-Dversion=${PKGVERSION_NOREV} -Dmake.cmd=${GMAKE:Q}			\
		-Dcompile.native=true -Dcompile.c++=true -Dlibhdfs=1 -Dlibrecordio=true	\
		-Dskip.record-parser=true

BUILD_TARGETS=	bin-package

CPPFLAGS=	-D_POSIX_C_SOURCE=199506L -D__EXTENSIONS__

SUBST_CLASSES+=		java
SUBST_STAGE.java=	pre-build
SUBST_FILES.java=	bin/hadoop bin/hadoop-config.sh conf/hadoop-env.sh		\
			src/core/core-default.xml src/mapred/mapred-default.xml		\
			src/mapred/org/apache/hadoop/mapred/TaskRunner.java build.xml
SUBST_MESSAGE.java=	Fixing Java args
SUBST_VARS.java=	HADOOP_DIR HADOOP_LOGDIR JAVA_ARCH_FLAG PKG_JAVA_HOME		\
			PKG_SYSCONFDIR BUILDLINK_PREFIX.snappy

CONFIG_FILES=	capacity-scheduler.xml configuration.xsl core-site.xml			\
		fair-scheduler.xml hadoop-env.sh hadoop-metrics2.properties		\
		hadoop-policy.xml hdfs-site.xml log4j.properties mapred-queue-acls.xml	\
		mapred-site.xml masters slaves taskcontroller.cfg

.for f in ${CONFIG_FILES}
CONF_FILES+=	share/examples/hadoop/${f} ${PKG_SYSCONFDIR}/${f}
.endfor

post-extract:
	set -e; cd ${WRKSRC} && (							\
		${CHMOD} -R g-w *; ${MKDIR} build/classes;				\
		${RM} -rf bin/task-controller hadoop-core-*.jar lib/native		\
	)

pre-build:
	cd ${WRKSRC} && ${RM} bin/*.orig conf/hadoop-env.sh.orig

do-install:
	cd ${WRKSRC}/build/${PKGNAME_NOREV} && ${PAX} -rw -p e * ${DESTDIR}${PREFIX}/

.include "../../devel/snappy/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
# Used by librecordio, doesn't seem to build
#.include "../../textproc/xerces-c/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
