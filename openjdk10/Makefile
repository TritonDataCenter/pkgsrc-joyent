# $NetBSD$

DISTNAME=	openjdk10-10.0.46
CATEGORIES=	lang
MASTER_SITES=	https://us-east.manta.joyent.com/pkgsrc/public/pkg-distfiles/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://openjdk.java.net/
COMMENT=	Open-source implementation of the Java Platform, Standard Edition
LICENSE=	gnu-gpl-v2

JAVA_NAME=	openjdk10
JAVA_HOME=	${PREFIX}/java/${JAVA_NAME}
JAVA_WRAPPERS=	jar java javac javadoc javah javap jcmd jhat jps jstack \
		keytool orbd policytool rmid rmiregistry servertool tnameserv

BUILD_DEPENDS+=		mozilla-rootcerts>=1.0.20140820nb2:../../security/mozilla-rootcerts

BUILD_TARGET=		images

USE_LANGUAGES=		c c++
USE_TOOLS+=		autoconf bash gmake pax unzip:run zip:run

GNU_CONFIGURE=		yes
CONFIG_SHELL=		bash
UNLIMIT_RESOURCES=	datasize stacksize

BUILDLINK_TRANSFORM+=	rm:-Werror

CONFIGURE_ARGS+=	--disable-option-checking # for --with-libiconv-prefix
CONFIGURE_ARGS+=	--prefix=${PREFIX:Q}
CONFIGURE_ARGS+=	--build=${MACHINE_GNU_PLATFORM:Q}
CONFIGURE_ARGS+=	--host=${MACHINE_GNU_PLATFORM:Q}
# XXX
CONFIGURE_ARGS+=	--with-boot-jdk=/var/tmp/openjdk9
CONFIGURE_ARGS+=	--with-zlib=system
CONFIGURE_ARGS+=	--with-giflib=bundled
CONFIGURE_ARGS+=	--with-cups-include=${BUILDLINK_PREFIX.cups-base}/include
CONFIGURE_ARGS+=	--with-freetype-lib=${BUILDLINK_PREFIX.freetype2}/lib
CONFIGURE_ARGS+=	--with-freetype-include=${BUILDLINK_PREFIX.freetype2}/include
CONFIGURE_ARGS+=	--disable-freetype-bundling
CONFIGURE_ARGS+=	--with-jobs=${MAKE_JOBS:U1}
CONFIGURE_ARGS+=	--with-num-cores=${MAKE_JOBS:U1}
CONFIGURE_ARGS+=	--with-memory-size=768
CONFIGURE_ARGS+=	--disable-precompiled-headers
CONFIGURE_ARGS+=	--disable-ccache
CONFIGURE_ARGS+=	--with-extra-cflags=${CFLAGS:Q}
CONFIGURE_ARGS+=	--with-extra-cxxflags=${CXXFLAGS:Q}
CONFIGURE_ARGS+=	--with-extra-ldflags=${LDFLAGS:Q}
CONFIGURE_ARGS+=	--with-native-debug-symbols=none
CONFIGURE_ARGS+=	--with-jvm-variants=server
CONFIGURE_ARGS+=	--with-debug-level=release

# Causes unresolved symbols (GCId::print_prefix, LogTagSet::LogTagSet) that are proving
# difficult to track down.
CONFIGURE_ARGS.SunOS+=	--disable-dtrace

MAKE_JOBS_SAFE=		no # Set manually

# Avoid build errors when JAVA_HOME and CLASSPATH are defined by user.
MAKE_ENV+=	JAVA_HOME=
MAKE_ENV+=	CLASSPATH=

BUILD_OPSYS=	${OPSYS:C/.*BSD/bsd/:S/DragonFly/bsd/:S/SunOS/solaris/:S/Linux/linux/}
BUILD_ARCH=	${MACHINE_ARCH:S/i386/x86/:S/sparc64/sparcv9/:C/^e?arm.*$/arm/}
SERVER_DIR=	${BUILD_OPSYS}-${BUILD_ARCH}-normal-server-release
IMAGEJDKDIR=	${WRKSRC}/build/${SERVER_DIR}/images/jdk

.include "../../mk/bsd.prefs.mk"

pre-configure:
	cd ${WRKSRC} && ${BASH} make/autoconf/autogen.sh

.PHONY: fixup-rpath
fixup-rpath:
	for f in ${IMAGEJDKDIR}/bin/*; do \
		/usr/bin/elfedit -e 'dyn:runpath $$ORIGIN/../lib:$$ORIGIN/../lib/jli:$$ORIGIN/../lib/server' $$f; \
	done
	for f in ${IMAGEJDKDIR}/lib/*.so; do \
		/usr/bin/elfedit -e 'dyn:runpath $$ORIGIN:$$ORIGIN/jli:$$ORIGIN:/server' $$f; \
	done

CACERTS_FILE=	${WRKDIR}/cacerts.out

post-build: ${CACERTS_FILE}

.if ${OPSYS} == "SunOS"
${CACERTS_FILE}: fixup-rpath
.else
${CACERTS_FILE}:
.endif
	${MKDIR} ${WRKDIR}/cacerts
	cd ${WRKDIR}/cacerts && ${PREFIX}/sbin/mozilla-rootcerts extract
	for cert in ${WRKDIR}/cacerts/*.pem; do				\
		${INFO_MSG} "Importing $$cert"; 			\
		${IMAGEJDKDIR}/bin/keytool				\
		  -noprompt						\
		  -importcert						\
		  -keystore ${.TARGET}					\
		  -alias `${BASENAME} $$cert | sed 's,.pem,,'`		\
		  -file $$cert						\
		  -storepass changeit;					\
	done

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${JAVA_HOME}
	cd ${IMAGEJDKDIR} && pax -rwpp . ${DESTDIR}${JAVA_HOME}/.
	${INSTALL_DATA} ${CACERTS_FILE}	${DESTDIR}${JAVA_HOME}/lib/security/cacerts
	rm -f ${DESTDIR}${JAVA_HOME}/include/jni_md.h
	ln -s ${LOWER_OPSYS:S/sunos/solaris/}/jni_md.h			\
	  ${DESTDIR}${JAVA_HOME}/include/jni_md.h

.include "options.mk"

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
# Headers from CUPS are required to build the native implementation of
# sun.print.* which is used by java.awt.print.
BUILDLINK_DEPMETHOD.cups-base?=	build
.include "../../print/cups-base/buildlink3.mk"
.include "../../mk/java-env.mk"
.include "../../mk/bsd.pkg.mk"
