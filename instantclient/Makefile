# $NetBSD$
#

DISTNAME=	instantclient-${ORACLE_VERSION:S/_/./}.0.3.0
CATEGORIES=	devel
#MASTER_SITES=	#

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.oracle.com/technetwork/database/features/instant-client/index-100365.html
COMMENT=	Oracle Database Instant Client
#LICENSE=	# see LICENSE file

PKG_DESTDIR_SUPPORT=	user-destdir

.include "version.mk"

USE_TOOLS+=	pax unzip
NO_BUILD=	yes

DIST_SUBDIR=	instantclient
DISTFILES=	instantclient-basiclite-${OS_PLATFORM}-${PKGVERSION_NOREV}.zip
DISTFILES+=	instantclient-sdk-${OS_PLATFORM}-${PKGVERSION_NOREV}.zip
DISTFILES+=	instantclient-sqlplus-${OS_PLATFORM}-${PKGVERSION_NOREV}.zip
DISTINFO_FILE=	${.CURDIR}/distinfo.${OS_PLATFORM}

WRKSRC=		${WRKDIR}/instantclient_${ORACLE_VERSION}

CHECK_SHLIBS_SUPPORTED=	no

RESTRICTED=	Packaging prohibited by Oracle license
NO_BIN_ON_CDROM=	${RESTRICTED}
NO_BIN_ON_FTP=		${RESTRICTED}
NO_SRC_ON_CDROM=	${RESTRICTED}
NO_SRC_ON_FTP=		${RESTRICTED}

BINS_LIST=	adrci genezi sqlplus uidrvci
LIBS_LIST=	libclntsh.so.11.1 libclntsh.so libnnz11.so libocci.so.11.1	\
		libocci.so libocijdbc11.so libsqlplus.so libsqlplusic.so
MISC_LIST=	glogin.sql ojdbc5.jar ojdbc6.jar xstreams.jar
SDK_LIST+=	SDK_README demo/demo.mk demo/cdemo81.c demo/occidemo.sql	\
		demo/occidemod.sql demo/occidml.cpp demo/occiobj.cpp		\
		demo/occiobj.typ include/occi.h include/occiCommon.h		\
		include/occiControl.h include/occiData.h			\
		include/occiObjects.h include/occiAQ.h include/oci.h		\
		include/oci1.h include/oci8dp.h include/ociap.h			\
		include/ociapr.h include/ocidef.h include/ocidem.h		\
		include/ocidfn.h include/ociextp.h include/ocikpr.h		\
		include/ocixmldb.h include/ocixstream.h include/odci.h		\
		include/oratypes.h include/ori.h include/orid.h include/orl.h	\
		include/oro.h include/ort.h include/xa.h include/nzt.h		\
		include/nzerror.h include/ldap.h ottclasses.zip

FETCH_MESSAGE =	" These files must be fetched manually:"
FETCH_MESSAGE+=	"  - basic-${PKGVERSION_NOREV}-${OS_PLATFORM}.zip"
FETCH_MESSAGE+=	"  - sdk-${PKGVERSION_NOREV}-${OS_PLATFORM}.zip"
FETCH_MESSAGE+=	"  - sqlplus-${PKGVERSION_NOREV}-${OS_PLATFORM}.zip"
FETCH_MESSAGE+=	" from the Oracle download site:"
FETCH_MESSAGE+=	"    http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html"
FETCH_MESSAGE+=	" Save them in this directory:"
FETCH_MESSAGE+=	"    ${DISTDIR}/${DIST_SUBDIR}/"

INSTALLATION_DIRS+=	bin lib ${ORACLE_IC_HOME}/sdk

post-extract:
	cd ${WRKSRC} && ${LN} -s libclntsh.so.11.1 libclntsh.so \
		     && ${LN} -s libocci.so.11.1 libocci.so \
		     && ${CHMOD} -R g-w . \
		     && ${CHMOD} u+w sqlplus

do-install:
.for file in ${BINS_LIST}
	${INSTALL_PROGRAM} ${WRKSRC}/${file} \
	    ${DESTDIR}${PREFIX}/${ORACLE_IC_HOME}/${file}
	${LN} -s ../${ORACLE_IC_HOME}/${file} \
	    ${DESTDIR}${PREFIX}/bin/${file}
.endfor
.for file in ${LIBS_LIST}
	${INSTALL_LIB} ${WRKSRC}/${file} \
	    ${DESTDIR}${PREFIX}/${ORACLE_IC_HOME}/${file}
	${LN} -s ../${ORACLE_IC_HOME}/${file} \
	    ${DESTDIR}${PREFIX}/lib/${file}
.endfor
.for file in ${MISC_LIST}
	${INSTALL_DATA} ${WRKSRC}/${file} \
	    ${DESTDIR}${PREFIX}/${ORACLE_IC_HOME}/${file}
.endfor
.for file in ${SDK_LIST}
	${INSTALL_DATA} ${WRKSRC}/sdk/${file} \
	    ${DESTDIR}${PREFIX}/${ORACLE_IC_HOME}/sdk/${file}
.endfor

.include "../../mk/bsd.pkg.mk"
