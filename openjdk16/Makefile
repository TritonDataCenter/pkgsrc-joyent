# $NetBSD$

DISTNAME=	il-jdk-16.0.2-ga
PKGNAME=	${DISTNAME:S/il-jdk/openjdk16/:S/-ga//}
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GITHUB:=illumos/}
GITHUB_PROJECT=	jdk
GITHUB_TAG=	${DISTNAME}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://openjdk.java.net/
COMMENT=	Open-source implementation of the Java Platform, Standard Edition
LICENSE=	gnu-gpl-v2

JAVA_NAME=	openjdk16
JAVA_HOME=	${PREFIX}/java/${JAVA_NAME}
JAVA_WRAPPERS=	jar java javac javadoc javah javap jcmd jhat jps jstack \
		keytool orbd policytool rmid rmiregistry servertool tnameserv

BUILD_DEPENDS+=	mozilla-rootcerts-[0-9]*:../../security/mozilla-rootcerts
DEPENDS+=	dejavu-ttf-[0-9]*:../../fonts/dejavu-ttf

BUILD_TARGET=	images

GNU_CONFIGURE=	yes
CONFIG_SHELL=	bash
USE_LANGUAGES=	c c++
USE_TOOLS+=	autoconf bash gmake pax tar unzip:run zip:run

UNLIMIT_RESOURCES=	datasize stacksize

BUILDLINK_TRANSFORM+=	rm:-Werror

CONFIGURE_ARGS+=	--disable-option-checking # for --with-libiconv-prefix
CONFIGURE_ARGS+=	--prefix=${PREFIX:Q}
CONFIGURE_ARGS+=	--build=${MACHINE_GNU_PLATFORM:Q}
CONFIGURE_ARGS+=	--host=${MACHINE_GNU_PLATFORM:Q}
CONFIGURE_ARGS+=	--target=${MACHINE_GNU_PLATFORM:Q}
CONFIGURE_ARGS+=	--disable-ccache
CONFIGURE_ARGS+=	--disable-precompiled-headers
CONFIGURE_ARGS+=	--disable-warnings-as-errors
CONFIGURE_ARGS+=	--enable-deprecated-ports=yes
CONFIGURE_ARGS+=	--enable-unlimited-crypto
CONFIGURE_ARGS+=	--with-cacerts-file=${CACERTS_STORE}
CONFIGURE_ARGS+=	--with-cups-include=${BUILDLINK_PREFIX.cups-base}/include
CONFIGURE_ARGS+=	--with-debug-level=release
CONFIGURE_ARGS+=	--with-extra-cflags=${CFLAGS:Q}
CONFIGURE_ARGS+=	--with-extra-cxxflags=${CXXFLAGS:Q}
CONFIGURE_ARGS+=	--with-extra-ldflags=${LDFLAGS:Q}
CONFIGURE_ARGS+=	--with-fontconfig=${BUILDLINK_PREFIX.fontconfig}
CONFIGURE_ARGS+=	--with-freetype-include=${BUILDLINK_PREFIX.freetype2}/include
CONFIGURE_ARGS+=	--with-freetype-lib=${BUILDLINK_PREFIX.freetype2}/lib
CONFIGURE_ARGS+=	--with-freetype=system
CONFIGURE_ARGS+=	--with-giflib=bundled
CONFIGURE_ARGS+=	--with-jobs=${MAKE_JOBS:U1}
CONFIGURE_ARGS+=	--with-jvm-variants=server
CONFIGURE_ARGS+=	--with-libjpeg=system
CONFIGURE_ARGS+=	--with-native-debug-symbols=none
CONFIGURE_ARGS+=	--with-num-cores=${MAKE_JOBS:U1}
CONFIGURE_ARGS+=	--with-toolchain-type=gcc
CONFIGURE_ARGS+=	--with-x=yes
CONFIGURE_ARGS+=	--x-includes=${X11BASE}/include
CONFIGURE_ARGS+=	--x-libraries=${X11BASE}/lib
CONFIGURE_ARGS+=	--with-zlib=system

# Causes unresolved symbols (GCId::print_prefix, LogTagSet::LogTagSet) that are
# proving difficult to track down.
CONFIGURE_ARGS.SunOS+=	--disable-dtrace

MAKE_JOBS_SAFE=		no # Set manually

BUILDLINK_PASSTHRU_RPATHDIRS+=	${JAVA_HOME}/lib

CHECK_SSP_SKIP+=	java/${JAVA_NAME}/lib/libjsig.so
CHECK_SSP_SKIP+=	java/${JAVA_NAME}/lib/server/libjsig.so

SUBST_CLASSES+=		libpaths
SUBST_STAGE.libpaths=	pre-configure
SUBST_FILES.libpaths=	make/autoconf/lib-bundled.m4
SUBST_FILES.libpaths+=	make/autoconf/spec.gmk.in
SUBST_FILES.libpaths+=	make/common/modules/LauncherCommon.gmk
SUBST_VARS.libpaths=	BUILDLINK_PREFIX.zlib COMPILER_RPATH_FLAG
SUBST_VARS.libpaths+=	JAVA_HOME

.include "../../mk/bsd.prefs.mk"

# Bootstrap support, using pre-built OpenJDK15 binaries.
.if !empty(MACHINE_PLATFORM:MSunOS-*-x86_64) || make(distinfo) || make (makesum) || make(mdi)
BOOTSTRAP_JDK:=		openjdk15-15.0.0rc24-x86_64-sun-solaris.tar.gz
SITES.${BOOTSTRAP_JDK}=	https://us-east.manta.joyent.com/pkgsrc/public/pkg-bootstraps/
DISTFILES:=		${DEFAULT_DISTFILES} ${BOOTSTRAP_JDK}
.endif

BOOTJDK_DIR=		${WRKDIR}/openjdk15
CACERTS_STORE=		${WRKDIR}/cacerts.keystore

CONFIGURE_ARGS+=	--with-boot-jdk=${BOOTJDK_DIR}

BUILD_OPSYS=	${OPSYS:C/.*BSD/bsd/:S/DragonFly/bsd/:S/SunOS/solaris/:S/Linux/linux/}
BUILD_ARCH=	${MACHINE_ARCH:S/i386/x86/:S/sparc64/sparcv9/:C/^e?arm.*$/arm/}
SERVER_DIR=	${BUILD_OPSYS}-${BUILD_ARCH}-server-release
IMAGEJDKDIR=	${WRKSRC}/build/${SERVER_DIR}/images/jdk

PLIST_SUBST+=		JAVA_NAME=${JAVA_NAME}
PRINT_PLIST_AWK+=	{ gsub(/${JAVA_NAME}/, "$${JAVA_NAME}") }

pre-configure: ${CACERTS_STORE}
${CACERTS_STORE}:
	${MKDIR} ${WRKDIR}/cacerts
	cd ${WRKDIR}/cacerts &&	${PREFIX}/sbin/mozilla-rootcerts extract
	for cert in ${WRKDIR}/cacerts/*.pem; do				\
		${SETENV} ${CONFIGURE_ENV} LC_ALL=C			\
		    ${BOOTJDK_DIR}/bin/keytool				\
			-noprompt					\
			-importcert					\
			-keystore ${.TARGET}.tmp			\
			-alias `basename "$$cert" .pem`			\
			-file $${cert}					\
			-storetype jks					\
			-storepass changeit;				\
	done
	${MV} ${.TARGET}.tmp ${.TARGET}

do-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${BASH} configure autogen ${CONFIGURE_ARGS}

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${JAVA_HOME}
	cd ${IMAGEJDKDIR} && ${PAX} -rwpp . ${DESTDIR}${JAVA_HOME}/.

ELFEDIT?=	/usr/bin/elfedit

.PHONY: bootstrap
bootstrap: install
	${RM} -rf ${WRKDIR}/bootstrap/${JAVA_NAME}
	${MKDIR} ${WRKDIR}/bootstrap/${JAVA_NAME}
	cd ${DESTDIR}${JAVA_HOME} && ${PAX} -rwpp . ${WRKDIR}/bootstrap/${JAVA_NAME}/
.if ${OPSYS} == "SunOS"
	${MKDIR} ${WRKDIR}/bootstrap/${JAVA_NAME}/lib/pkgsrc
	for lib in libgcc_s.so.1 libssp.so.0 libstdc++.so.6; do \
		${CP} `${PKG_CC} -print-file-name=$${lib}` \
		    ${WRKDIR}/bootstrap/${JAVA_NAME}/lib/pkgsrc/; \
	done
	for lib in libX11.so.6 libXau.so.6 libXdmcp.so.6 libXext.so.0 \
		   libXi.so.6 libXrender.so.1 libXtst.so.6 libbz2.so.0 \
		   libfreetype.so.6 libiconv.so.2 libintl.so.8 libjpeg.so.8 \
		   libpng16.so.16 libxcb.so.1 libz.so.1; do \
		${CP} ${PREFIX}/lib/$${lib} \
		    ${WRKDIR}/bootstrap/${JAVA_NAME}/lib/pkgsrc/; \
	done
	for f in ${WRKDIR}/bootstrap/${JAVA_NAME}/bin/*; do \
		${ELFEDIT} -e 'dyn:runpath $$ORIGIN/../lib:$$ORIGIN/../lib/pkgsrc' $$f; \
	done
	for f in ${WRKDIR}/bootstrap/${JAVA_NAME}/lib/{jspawnhelper,*.so}; do \
		${ELFEDIT} -e 'dyn:runpath $$ORIGIN:$$ORIGIN/server:$$ORIGIN/pkgsrc' $$f; \
	done
	for f in ${WRKDIR}/bootstrap/${JAVA_NAME}/lib/pkgsrc/*.so*; do \
		${ELFEDIT} -e 'dyn:runpath $$ORIGIN' $$f; \
	done
	for f in ${WRKDIR}/bootstrap/${JAVA_NAME}/lib/server/*.so; do \
		${ELFEDIT} -e 'dyn:runpath $$ORIGIN/../pkgsrc' $$f; \
	done
	(cd ${WRKDIR}/bootstrap; \
	    ${TAR} -zcf ${PKGNAME}-x86_64-sun-solaris.tar.gz ${JAVA_NAME})
.endif

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
# Headers from CUPS are required to build the native implementation of
# sun.print.* which is used by java.awt.print.
BUILDLINK_DEPMETHOD.cups-base?=	build
.include "../../print/cups-base/buildlink3.mk"
.include "../../mk/java-env.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXt?=     build
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXrandr?= build
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
