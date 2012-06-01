# $NetBSD$
#

DISTNAME=	instantclient-${ORACLE_VERSION}
CATEGORIES=	devel
#MASTER_SITES=	#

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.oracle.com/technetwork/database/features/instant-client/index-100365.html
COMMENT=	Oracle Database Instant Client
#LICENSE=	# see LICENSE file

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=	pax unzip
NO_BUILD=	yes

DIST_SUBDIR=	instantclient
DISTFILES=	basic-${PKGVERSION}-${OS_PLATFORM}.zip
DISTFILES+=	sdk-${PKGVERSION}-${OS_PLATFORM}.zip
DISTFILES+=	sqlplus-${PKGVERSION}-${OS_PLATFORM}.zip
DISTINFO_FILE=	${.CURDIR}/distinfo.${OS_PLATFORM}

WRKSRC=		${WRKDIR}/instantclient_11_2

CHECK_SHLIBS_SUPPORTED=	no

.include "../../mk/bsd.prefs.mk"

ORACLE_VERSION=	11.2.0.2.0
.if ${OPSYS} == "SunOS"
. if ${MACHINE_ARCH} == "x86_64" || defined(ABI:M64)
OS_PLATFORM=	solaris-x64
. else
OS_PLATFORM=	solaris-x32
. endif
.endif

RESTRICTED=	Packaging prohibited by Oracle license
NO_BIN_ON_CDROM=	${RESTRICTED}
NO_BIN_ON_FTP=		${RESTRICTED}
NO_SRC_ON_CDROM=	${RESTRICTED}
NO_SRC_ON_FTP=		${RESTRICTED}

BINS_LIST=	adrci genezi sqlplus uidrvci
LIBS_LIST=	libclntsh.so.11.1 libclntsh.so libnnz11.so libocci.so.11.1    \
		libocci.so libociei.so libocijdbc11.so libsqlplus.so          \
		libsqlplusic.so
MISC_LIST=	glogin.sql ojdbc5.jar ojdbc6.jar xstreams.jar
SDK_LIST+=	SDK_README demo/demo.mk demo/cdemo81.c demo/occidemo.sql      \
		demo/occidemod.sql demo/occidml.cpp demo/occiobj.cpp          \
		demo/occiobj.typ include/occi.h include/occiCommon.h          \
		include/occiControl.h include/occiData.h                      \
		include/occiObjects.h include/occiAQ.h include/oci.h          \
		include/oci1.h include/oci8dp.h include/ociap.h               \
		include/ociapr.h include/ocidef.h include/ocidem.h            \
		include/ocidfn.h include/ociextp.h include/ocikpr.h           \
		include/ocixmldb.h include/ocixstream.h include/odci.h        \
		include/oratypes.h include/ori.h include/orid.h include/orl.h \
		include/oro.h include/ort.h include/xa.h include/nzt.h        \
		include/nzerror.h include/ldap.h ottclasses.zip

FETCH_MESSAGE =		" These files must be fetched manually:"
FETCH_MESSAGE+=		"  - basic-${PKGVERSION}-${OS_PLATFORM}.zip"
FETCH_MESSAGE+=		"  - sdk-${PKGVERSION}-${OS_PLATFORM}.zip"
FETCH_MESSAGE+=		"  - sqlplus-${PKGVERSION}-${OS_PLATFORM}.zip"
FETCH_MESSAGE+=         " from the Oracle download site:"
FETCH_MESSAGE+=		"    http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html"
FETCH_MESSAGE+=		" Save them in this directory:"
FETCH_MESSAGE+=         "    ${DISTDIR}/${DIST_SUBDIR}/"

INSTALLATION_DIRS+=	bin lib oracle/${ORACLE_VERSION}/instantclient

MESSAGE_SUBST+=		PKGVERSION=${PKGVERSION}

post-extract:
	cd ${WRKSRC} && ${LN} -s libclntsh.so.11.1 libclntsh.so \
		     && ${LN} -s libocci.so.11.1 libocci.so \
		     && ${CHMOD} -R g-w .

do-install:
.	for file in ${BINS_LIST}
	${INSTALL_PROGRAM} ${WRKSRC}/${file} \
	  ${DESTDIR}${PREFIX}/oracle/${ORACLE_VERSION}/instantclient/${file}
	${LN} -s ../oracle/${ORACLE_VERSION}/instantclient/${file} \
	  ${DESTDIR}${PREFIX}/bin/${file}
.	endfor
.	for file in ${LIBS_LIST}
	${INSTALL_LIB} ${WRKSRC}/${file} \
	  ${DESTDIR}${PREFIX}/oracle/${ORACLE_VERSION}/instantclient/${file}
	${LN} -s ../oracle/${ORACLE_VERSION}/instantclient/${file} \
	  ${DESTDIR}${PREFIX}/lib/${file}
.	endfor
.	for file in ${MISC_LIST}
	${INSTALL_LIB} ${WRKSRC}/${file} \
	  ${DESTDIR}${PREFIX}/oracle/${ORACLE_VERSION}/instantclient/${file}
.	endfor
.	for file in ${SDK_LIST}
	${INSTALL_DATA} ${WRKSRC}/sdk/${file} \
	  ${DESTDIR}${PREFIX}/oracle/${ORACLE_VERSION}/instantclient/sdk/${file}
.	endfor

.include "../../mk/bsd.pkg.mk"
