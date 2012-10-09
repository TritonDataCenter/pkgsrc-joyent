# $NetBSD$
#

DISTNAME=	hadoop-1.0.3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_APACHE:=hadoop/common/${DISTNAME}/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://hadoop.apache.org/
COMMENT=	Framework for distributed processing of large data sets
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=          c c++
USE_LIBTOOL=            yes
USE_TOOLS+=		gmake autoconf automake pax tar

.include "../../joyent/hadoop/Makefile.common"

CHECK_PORTABILITY_SKIP+=	src/contrib/streaming/src/test/system/scripts/StreamMapper.sh
REPLACE_BASH+=	bin/hadoop bin/rcc bin/*.sh contrib/hdfsproxy/bin/*	\
		contrib/hod/bin/checknodes

MAKE_ARGS=	-Dbuild.classes=${WRKSRC}/hadoop-core-${PKGVERSION_NOREV}.jar \
		-Dversion=${PKGVERSION_NOREV} -Dcompile.native=true \
		-Dcompile.c++=true -Dmake.cmd=${GMAKE} -Dlibhdfs=1 \
		-Dlibrecordio=true  -Dskip.record-parser=true

BUILD_TARGETS=	compile-core-native compile-c++ compile-c++-libhdfs \
		compile-c++-pipes compile-c++-utils

DEFAULTS=	src/core/core-default.xml src/hdfs/hdfs-default.xml \
		src/mapred/mapred-default.xml hadoop-examples-1.0.3.jar
DIST=		bin contrib hadoop-ant-${PKGVERSION_NOREV}.jar hadoop-core-${PKGVERSION_NOREV}.jar \
		hadoop-test-${PKGVERSION_NOREV}.jar hadoop-tools-${PKGVERSION_NOREV}.jar lib webapps
CONF=		capacity-scheduler.xml configuration.xsl core-site.xml hadoop-env.sh hadoop-metrics2.properties \
		hadoop-policy.xml hdfs-site.xml log4j.properties mapred-queue-acls.xml mapred-site.xml taskcontroller.cfg

.for f in ${CONF}
CONF_FILES+=	share/examples/hadoop/${f} ${PKG_SYSCONFDIR}/${f}
.endfor

CPPFLAGS=	-D_POSIX_C_SOURCE=199506L -D__EXTENSIONS__

SUBST_CLASSES+=	java
SUBST_STAGE.java=	pre-build
SUBST_FILES.java=	bin/hadoop bin/hadoop-config.sh conf/hadoop-env.sh
SUBST_MESSAGE.java=	Fixing Java args
SUBST_VARS.java=	JAVA_ARCH_FLAG PKG_SYSCONFDIR

post-extract:
	${RM} -rf ${WRKSRC}/lib/native/Linux-*

post-build:
	cd ${WRKSRC} && ${RM} bin/hadoop.orig bin/hadoop-config.sh.orig conf/hadoop-env.sh.orig
	cd ${WRKSRC} && ant FreeBSD-dist
	(cd ${WRKSRC}/build/c++ && ${TAR} -cf - ${HADOOP_ARCH}/lib ${HADOOP_ARCH}/include) | \
		(cd ${WRKSRC}/c++ && ${TAR} -xf -)

do-install:
	${MKDIR} ${DESTDIR}${HADOOP_HOME}
	cd ${WRKSRC} && ${PAX} -rw -p e ${DIST} ${DESTDIR}${HADOOP_HOME}/
	cd ${WRKSRC}/c++/${HADOOP_ARCH} && ${PAX} -rw -p e  include lib ${DESTDIR}${PREFIX}
	${MKDIR} ${DESTDIR}${PREFIX}/share/examples/hadoop
.for f in ${DEFAULTS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/share/examples/hadoop
.endfor
	cd ${WRKSRC}/conf && ${PAX} -rw -p e * ${DESTDIR}${PREFIX}/share/examples/hadoop
	${MKDIR} ${DESTDIR}${PREFIX}/share/doc/hadoop
	cd ${WRKSRC} && ${PAX} -rw -p e docs ${DESTDIR}${PREFIX}/share/doc/hadoop
.for f in ${DOC}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/share/doc/hadoop
.endfor

#.include "../../devel/snappy/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
