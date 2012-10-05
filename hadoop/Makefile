# $NetBSD$
#

DISTNAME=	hadoop-1.0.3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_APACHE:=hadoop/common/${DISTNAME}/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE
HOMEPAGE=	http://www.us.apache.org/dist/hadoop/common/hadoop-1.0.3/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=          c c++
USE_LIBTOOL=            yes
USE_TOOLS+=		gmake autoconf automake pax

BUILD_DEPENDS+= apache-ant-[0-9]*:../../devel/apache-ant

.if ${MACHINE_ARCH} == "x86_64"
HADOOP_ARCH=	${OPSYS}-amd64-64
.else
HADOOP_ARCH=	${OPSYS}-x86-32
.endif
PLIST_SUBST+=	HADOOP_ARCH=${HADOOP_ARCH}

HADOOP_HOME?=	${PREFIX}/hadoop

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

post-extract:
	${RM} -rf ${WRKSRC}/lib/native/Linux-*

do-build:
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} ant ${BUILD_TARGETS} ${MAKE_ARGS}

post-build:
	cd ${WRKSRC} && ant FreeBSD-dist
	(cd ${WRKSRC}/build/c++ && ${TAR} -cf - ${HADOOP_ARCH}/lib ${HADOOP_ARCH}/include) | \
		(cd ${WRKSRC}/c++ && ${TAR} -xf -)

do-install:
	${MKDIR} ${DESTDIR}${HADOOP_HOME}
	cd ${WRKSRC} && ${PAX} -rw -p e ${DIST} ${DESTDIR}${HADOOP_HOME}/
	cd ${WRKSRC}/c++/${HADOOP_ARCH} && ${PAX} -rw -p e  include lib ${DESTDIR}${PREFIX}/
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

.include "../../mk/java-vm.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
