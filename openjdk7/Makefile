# $NetBSD: Makefile,v 1.43 2013/02/16 11:22:52 wiz Exp $

JDK_UPDATE_VERSION=	14
BUILD_NUMBER=		14

DISTNAME=	# set below
PKGNAME=	openjdk7-1.7.0.${JDK_UPDATE_VERSION}.${BUILD_NUMBER}
CATEGORIES=	lang
MASTER_SITES=	http://hg.openjdk.java.net/jdk7u/jdk7u/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://openjdk.java.net/
COMMENT=	Open-source implementation of the Java Platform, Standard Edition
LICENSE=	gnu-gpl-v2

DIST_SUBDIR=	openjdk7

#
# Distfiles with tag jdk7u14-b14
#
JDK7U=				bb97ad0c9e5a
DISTFILES=			${JDK7U}.tar.bz2
SITES.${JDK7U}.tar.bz2=		${MASTER_SITES}/archive/
#
CORBA=				9e8bde2586a1
DISTFILES+=			${CORBA}.tar.bz2
SITES.${CORBA}.tar.bz2=		${MASTER_SITES}/corba/archive/
#
HOTSPOT=			e3d2c238e29c
DISTFILES+=			${HOTSPOT}.tar.bz2
SITES.${HOTSPOT}.tar.bz2=	${MASTER_SITES}/hotspot/archive/
#
JAXP=				7038ca4959e5
DISTFILES+=			${JAXP}.tar.bz2
SITES.${JAXP}.tar.bz2=		${MASTER_SITES}/jaxp/archive/
#
JAXWS=				a2b2e716637a
DISTFILES+=			${JAXWS}.tar.bz2
SITES.${JAXWS}.tar.bz2=		${MASTER_SITES}/jaxws/archive/
#
JDK=				3982fc37bc25
DISTFILES+=			${JDK}.tar.bz2
SITES.${JDK}.tar.bz2=		${MASTER_SITES}/jdk/archive/
#
LANGTOOLS=			5febc4e479fa
DISTFILES+=			${LANGTOOLS}.tar.bz2
SITES.${LANGTOOLS}.tar.bz2=	${MASTER_SITES}/langtools/archive/
#

#
# Ant is required for building, we cannot depend on the pkgsrc devel/apache-ant
# as that would cause circular depedencies.
#
ANT=				apache-ant-1.8.1
ANT_TGZ=			${ANT}-bin.tar.bz2
DISTFILES+=			${ANT_TGZ}
SITES.${ANT_TGZ}=		http://archive.apache.org/dist/ant/binaries/
ANT_BIN=			${WRKDIR}/${ANT}/bin
PREPEND_PATH+=			${ANT_BIN}

# diff between distfile and bsd-port branch. To check out, use:
# "hg fclone http://hg.openjdk.java.net/bsd-port/bsd-port/"
#PATCHFILES+=	jdk-7-bsd-port-147.20110811.diff.bz2
#PATCH_SITES+=	${MASTER_SITE_LOCAL:=openjdk7/}

#CACERTS=	cacerts-20091013.tar.bz2
#DISTFILES+=	${CACERTS}
#EXTRACT_ONLY+=	${CACERTS}

JAVA_NAME=	openjdk7
JAVA_HOME=	${PREFIX}/java/${JAVA_NAME}
JAVA_WRAPPERS=	jar java javac javadoc javah javap keytool orbd \
		policytool rmid rmiregistry servertool tnameserv

MAKE_ENV+=		PKGSRC_ZIPEXE=${TOOLS_PATH.zip}
MAKE_ENV+=		PKGSRC_UNZIP=${TOOLS_PATH.unzip}
MAKE_ENV+=		PKGSRC_UNZIPSFX=${TOOLS_PATH.unzip}sfx

BUILD_DEPENDS+=		sun-jdk6-[0-9]*:../../lang/sun-jdk6
DEPENDS+=		dejavu-ttf-[0-9]*:../../fonts/dejavu-ttf
#DEPENDS+=		ja-sazanami-ttf-[0-9]*:../../fonts/ja-sazanami-ttf
#DEPENDS+=		baekmuk-ttf-[0-9]*:../../fonts/baekmuk-ttf

NO_CONFIGURE=		yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake pax unzip:run zip:run patch
UNLIMIT_RESOURCES=	datasize stacksize
WRKSRC=			${WRKDIR}/openjdk

BUILDLINK_PASSTHRU_DIRS+=	${ALT_BOOTDIR}
PREPEND_PATH+=			${ALT_BOOTDIR}/bin

MAKE_ENV+=	ALT_BOOTDIR=${ALT_BOOTDIR}
MAKE_ENV+=	ALT_DROPS_DIR=${DISTDIR}/${DIST_SUBDIR}
MAKE_ENV+=	ALT_FREETYPE_LIB_PATH=${BUILDLINK_PREFIX.freetype2}/lib
MAKE_ENV+=	ALT_FREETYPE_HEADERS_PATH=${BUILDLINK_PREFIX.freetype2}/include
MAKE_ENV+=	ALT_CUPS_HEADERS_PATH=${BUILDLINK_PREFIX.cups}/include
MAKE_ENV+=	ALT_COMPILER_PATH=${WRAPPER_DIR}/bin/
MAKE_ENV+=	ALT_GCC_COMPILER_PATH=${WRAPPER_DIR}/bin/

MAKE_ENV+=	ALT_JDK_IMPORT_PATH=${ALT_BOOTDIR}
MAKE_ENV+=	ALT_PACKAGE_PATH=${PREFIX}
MAKE_ENV+=	ALT_X11_PATH=${X11BASE}
MAKE_ENV+=	RHINO_JAR=${WRKDIR}/${RHINO}/js.jar

MAKE_ENV+=	ALT_PARALLEL_COMPILE_JOBS=${MAKE_JOBS:U1}
MAKE_ENV+=	HOTSPOT_BUILD_JOBS=${MAKE_JOBS}

MAKE_ENV+=	HOTSPOT_BUILD_USER=pkgsrc
MAKE_ENV+=	NO_DOCS=true
MAKE_ENV+=	SKIP_COMPARE_IMAGES=true
MAKE_ENV+=	SKIP_FASTDEBUG_BUILD=yes
MAKE_ENV+=	SKIP_DEBUG_BUILD=yes

MAKE_ENV+=	MILESTONE=fcs
MAKE_ENV+=	JDK_UPDATE_VERSION=${JDK_UPDATE_VERSION}
MAKE_ENV+=	BUILD_NUMBER=b${BUILD_NUMBER}

# Avoid build errors when JAVA_HOME and CLASSPATH are defined by user.
MAKE_ENV+=	JAVA_HOME=
MAKE_ENV+=	CLASSPATH=

MAKE_ENV+=	USE_GCC=1
MAKE_ENV+=	EXTRA_CFLAGS="-DDEFAULT_LIBPATH=\\\"${PREFIX}/lib/jni:${PREFIX}/lib:/lib:/usr/lib\\\""
BUILDDIR=	${WRKSRC}/build/${OPSYS:C/.*BSD/bsd/:S/DragonFly/bsd/:S/SunOS/solaris/}-${MACHINE_ARCH:S/i386/i586/:S/x86_64/amd64/}
#MAKE_ENV+=	LD_LIBRARY_PATH=${BUILDDIR}/lib/${MACHINE_ARCH:S/x86_64/amd64/}:${BUILDDIR}/lib/${MACHINE_ARCH:S/x86_64/amd64/}/jli
BUILDLINK_PASSTHRU_RPATHDIRS+=	${PREFIX}/java/openjdk7/jre/lib/${MACHINE_ARCH:S/x86_64/amd64/}

PLIST_SUBST+=	ARCH=${MACHINE_ARCH:S/x86_64/amd64/}
PLIST_SUBST+=	LOWER_OPSYS=${LOWER_OPSYS}

.include "../../mk/compiler.mk"

.if !empty(PKGSRC_COMPILER:Mclang)
_WRAP_EXTRA_ARGS.CXX+=	-Wno-parentheses -Wno-sign-conversion \
			-Wno-shorten-64-to-32 -Wno-conversion \
			-Wno-unused-value -Wno-switch-enum -Wno-switch \
			-Wno-tautological-compare \
			-Wno-delete-non-virtual-dtor \
			-Wno-return-type -Wno-unused-parameter \
			-Wno-parentheses-equality -Wno-empty-body
.endif

#
# Use LD_LIBRARY_PATH to find support libraries during the build.
#
SUBST_CLASSES+=		ldpath
SUBST_STAGE.ldpath=	pre-build
SUBST_FILES.ldpath=	jdk/make/com/sun/jmx/Makefile
SUBST_SED.ldpath=	-e "s,@LD_LIBRARY_PATH@,${BUILDDIR}/lib/${MACHINE_ARCH:S/x86_64/amd64/}/jli,g"

#
# SmartOS has ccs tools in /usr/bin
#
.if ${OS_VARIANT} == "SmartOS"
SUBST_CLASSES+=		ccspath
SUBST_STAGE.ccspath=	pre-build
SUBST_FILES.ccspath=	jdk/make/common/shared/Defs-utils.gmk
SUBST_FILES.ccspath+=	hotspot/make/solaris/makefiles/build_vm_def.sh
SUBST_SED.ccspath=	-e 's/UNIXCCS_PATH/UNIXCOMMAND_PATH/g'
SUBST_SED.ccspath+=	-e 's,/usr/ccs/bin,/usr/bin,g'
.endif

#
# GCC does not have __fsr_init_value
#
.if !empty(PKGSRC_COMPILER:Mgcc)
SUBST_CLASSES+=		gccfix
SUBST_STAGE.gccfix=	pre-build
SUBST_FILES.gccfix=	jdk/make/java/main/java/mapfile-i586
SUBST_SED.gccfix=	-e '/__fsr_init_value/d'
.endif

.include "bootstrap.mk"

.include "options.mk"

SUBST_CLASSES+=			add-rpaths
SUBST_STAGE.add-rpaths=		pre-build
SUBST_MESSAGE.add-rpaths=	adding X11 run path flags to Makefiles
SUBST_FILES.add-rpaths=		jdk/make/sun/awt/Makefile		\
				jdk/make/sun/awt/mawt.gmk		\
				jdk/make/sun/jawt/Makefile		\
				jdk/make/sun/jdga/Makefile		\
				jdk/make/sun/splashscreen/Makefile	\
				jdk/make/sun/xawt/Makefile
SUBST_SED.add-rpaths=		-e 's|-L$$(OPENWIN_LIB)|-L$$(OPENWIN_LIB) -Wl,-R$$(OPENWIN_LIB)|g'

SUBST_CLASSES+=			fontpaths
SUBST_STAGE.fontpaths=		pre-build
SUBST_MESSAGE.fontpaths=	fixing font paths
SUBST_FILES.fontpaths=		jdk/src/solaris/classes/sun/awt/fontconfigs/bsd.fontconfig.properties
SUBST_FILES.fontpaths+=		jdk/src/solaris/native/sun/awt/fontpath.c
SUBST_SED.fontpaths=		-e 's|@PREFIX@|${PREFIX}|g'
SUBST_SED.fontpaths+=		-e 's|@BUILDLINK_PREFIX.fontconfig@|${BUILDLINK_PREFIX.fontconfig}|g'

PLIST_VARS+=	i386 jce
.if ${MACHINE_ARCH} == "i386"
PLIST.i386=	yes
.endif

post-extract:
	${MV} ${WRKDIR}/jdk7u-${JDK7U} ${WRKSRC}
	${MV} ${WRKDIR}/corba-${CORBA} ${WRKSRC}/corba
	${MV} ${WRKDIR}/hotspot-${HOTSPOT} ${WRKSRC}/hotspot
	${MV} ${WRKDIR}/jaxp-${JAXP} ${WRKSRC}/jaxp
	${MV} ${WRKDIR}/jaxws-${JAXWS} ${WRKSRC}/jaxws
	${MV} ${WRKDIR}/jdk-${JDK} ${WRKSRC}/jdk
	${MV} ${WRKDIR}/langtools-${LANGTOOLS} ${WRKSRC}/langtools

do-build: ${WRKDIR}/stage3-done

# stage 1 builds a native JDK using the bootstrap binaries
${WRKDIR}/stage1-done:
	${_ULIMIT_CMD} cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM}
	rm -rf ${WRKDIR}/bootstrap
	cd ${BUILDDIR} && mv j2sdk-image ${WRKDIR}/bootstrap
	rm -rf ${BUILDDIR}
	touch ${WRKDIR}/stage1-done

# stage 2 rebuilds the JDK using native tools
${WRKDIR}/stage2-done: ${WRKDIR}/stage1-done
	${_ULIMIT_CMD} cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM}
	touch ${BUILDDIR}/j2sdk-image/jre/lib/applet/.keep
	touch ${WRKDIR}/stage2-done

# stage 3 builds third party add-ons
${WRKDIR}/stage3-done: ${WRKDIR}/stage2-done # ${WRKDIR}/cacerts.out
	touch ${WRKDIR}/stage3-done

${WRKDIR}/cacerts.out:
	for cert in ${WRKDIR}/cacerts/*.crt; do			\
		${ECHO} yes | LC_ALL=C LD_LIBRARY_PATH=/home/pbulk/build/upstream-trunk32/lang/openjdk7/work/openjdk/build/solaris-i586/lib/i386/jli ${BUILDDIR}/bin/keytool		\
		  -importcert						\
		  -keystore ${.TARGET}					\
		  -alias `${ECHO} $$cert | sed 's,.*/\\([^/]*\\)\\.crt,\\1,'` \
		  -file $$cert						\
		  -storepass pkgsrc;					\
	done

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${JAVA_HOME}
	cd ${BUILDDIR}/j2sdk-image && pax -rwpp .			\
	  ${DESTDIR}${JAVA_HOME}/.
	#${INSTALL_DATA} ${WRKDIR}/cacerts.out				\
	#  ${DESTDIR}${JAVA_HOME}/jre/lib/security/cacerts
	rm -f ${DESTDIR}${JAVA_HOME}/include/jni_md.h
	ln -s ${LOWER_OPSYS}/jni_md.h					\
	  ${DESTDIR}${JAVA_HOME}/include/jni_md.h

.if !empty(MACHINE_PLATFORM:MNetBSD-4.*-*)
MAKE_ENV+=	PTHREAD_STACKSIZE=1024
.endif

.if ${OPSYS} == "NetBSD"
TOOLS_PLATFORM.unzip=
.endif

# Include binutils for objcopy and GNU strip on SmartOS
.if ${OS_VARIANT} == "SmartOS"
.include "../../devel/binutils/buildlink3.mk"
BUILDLINK_DEPMETHOD.binutils?=	build
MAKE_ENV+=	ALT_OBJCOPY=${PREFIX}/bin/gobjcopy
MAKE_ENV+=	STRIP=${PREFIX}/bin/gstrip
.endif

.include "../../converters/libiconv/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
BUILDLINK_DEPMETHOD.cups?=	build
.include "../../print/cups/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXp?=	build
.include "../../x11/libXp/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXt?=	build
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../mk/java-env.mk"
.include "../../mk/bsd.pkg.mk"
