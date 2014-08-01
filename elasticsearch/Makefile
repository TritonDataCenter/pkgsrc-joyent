# $NetBSD$

DISTNAME=	elasticsearch-1.1.2
CATEGORIES=	textproc
MASTER_SITES=	http://download.elasticsearch.org/elasticsearch/elasticsearch/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.elasticsearch.org/
COMMENT=	Distributed RESTful Search Engine
LICENSE=	apache-2.0

USE_LANGUAGES=	# none
USE_JAVA=	run
USE_JAVA2=	6
NO_BUILD=	yes

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	ES_DBDIR ES_LOGDIR ES_WRKDIR VARBASE

LUCVER=		4.7.2
ES_JARS=	${DISTNAME} jna-3.3.0 jts-1.13 log4j-1.2.17		\
		lucene-analyzers-common-${LUCVER} lucene-codecs-${LUCVER} \
		lucene-core-${LUCVER} lucene-grouping-${LUCVER}		\
		lucene-highlighter-${LUCVER} lucene-join-${LUCVER}	\
		lucene-memory-${LUCVER} lucene-misc-${LUCVER}		\
		lucene-queries-${LUCVER} lucene-queryparser-${LUCVER}	\
		lucene-sandbox-${LUCVER} lucene-spatial-${LUCVER}	\
		lucene-suggest-${LUCVER} spatial4j-0.4.1
ES_DOCS=	LICENSE.txt NOTICE.txt README.textile

.if ${OPSYS} == "Darwin"
SIGAR_OPSYS=	macosx
.  if ${LOWER_ARCH} == "i386"
SIGAR_ARCH=	universal
.  else
SIGAR_ARCH=	universal64
.  endif
.else
SIGAR_OPSYS=	${LOWER_OPSYS}
SIGAR_ARCH=	${LOWER_ARCH:S|x86_64|amd64|:S|i386|x86|}
.endif

.if ${OPSYS} == "FreeBSD"
.  if ${OS_VERSION} < 6.0
FREEBSD_REL=	-5
.  else
FREEBSD_REL=	-6
.  endif
.endif

.if ${_OPSYS_SHLIB_TYPE} == "dylib"
SHLIB_EXT=	dylib
.else
SHLIB_EXT=	so
.endif

SIGAR_LIB=	libsigar-${SIGAR_ARCH}-${SIGAR_OPSYS}${FREEBSD_REL}.${SHLIB_EXT}

ES_USER?=	elastic
ES_GROUP?=	${ES_USER}
ES_DBDIR?=	${VARBASE}/db/elasticsearch
ES_LOGDIR?=	${VARBASE}/log/elasticsearch
ES_WRKDIR?=	${VARBASE}/tmp/elasticsearch

PKG_USERS=		${ES_USER}:${ES_GROUP}
PKG_GROUPS=		${ES_GROUP}
PKG_GECOS.${ES_USER}=	ElasticSearch user

FILES_SUBST+=	ES_USER=${ES_USER}
FILES_SUBST+=	ES_GROUP=${ES_GROUP}
FILES_SUBST+=	ES_WRKDIR=${ES_WRKDIR}
PLIST_SUBST+=	LUCVER=${LUCVER}
PLIST_SUBST+=	SIGAR_LIB=${SIGAR_LIB}

PRINT_PLIST_AWK+=	/lucene/{gsub(/-$(LUCVER)\./,"-$${LUCVER}.", $$0);}
PRINT_PLIST_AWK+=	{gsub(/$(SIGAR_LIB)/,"$${SIGAR_LIB}", $$0);}

SUBST_CLASSES+=		es
SUBST_STAGE.es=		pre-configure
SUBST_MESSAGE.es=	Fixing default paths
SUBST_FILES.es=		bin/elasticsearch.in.sh config/elasticsearch.yml
SUBST_VARS.es=		PREFIX PKG_SYSCONFDIR ES_DBDIR ES_LOGDIR ES_WRKDIR

INSTALLATION_DIRS+=	bin lib/elasticsearch lib/elasticsearch/sigar	\
			share/doc/elasticsearch	share/examples/elasticsearch

PKG_SYSCONFSUBDIR=	elasticsearch

OWN_DIRS_PERMS+=	${ES_DBDIR} ${ES_USER} ${ES_GROUP} 0755
OWN_DIRS_PERMS+=	${ES_LOGDIR} ${ES_USER} ${ES_GROUP} 0755
OWN_DIRS_PERMS+=	${ES_WRKDIR} ${ES_USER} ${ES_GROUP} 0755

CONF_FILES+=		share/examples/elasticsearch/elasticsearch.yml	\
			${PKG_SYSCONFDIR}/elasticsearch.yml		\
			share/examples/elasticsearch/logging.yml	\
			${PKG_SYSCONFDIR}/logging.yml

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/elasticsearch 		\
	  ${DESTDIR}${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/bin/elasticsearch.in.sh 	\
	  ${DESTDIR}${PREFIX}/bin/
	${INSTALL_SCRIPT} ${WRKSRC}/bin/plugin 			\
	  ${DESTDIR}${PREFIX}/bin/
.for file in ${ES_JARS}
	${INSTALL_DATA} ${WRKSRC}/lib/${file}.jar 		\
	  ${DESTDIR}${PREFIX}/lib/elasticsearch/
.endfor
	${INSTALL_DATA} ${WRKSRC}/lib/sigar/sigar-1.6.4.jar	\
	  ${DESTDIR}${PREFIX}/lib/elasticsearch/sigar/
	${INSTALL_LIB} ${WRKSRC}/lib/sigar/${SIGAR_LIB}	\
	  ${DESTDIR}${PREFIX}/lib/elasticsearch/sigar/
	${INSTALL_DATA} ${WRKSRC}/config/elasticsearch.yml 	\
	  ${DESTDIR}${PREFIX}/share/examples/elasticsearch/
	${INSTALL_DATA} ${WRKSRC}/config/logging.yml 		\
	  ${DESTDIR}${PREFIX}/share/examples/elasticsearch/
.for file in ${ES_DOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} 			\
	  ${DESTDIR}${PREFIX}/share/doc/elasticsearch/
.endfor

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
