# $NetBSD$

DISTNAME=	neo4j-community-2.1.7-unix
PKGNAME=	${DISTNAME:S/-community//:S/-unix//}
CATEGORIES=	databases
MASTER_SITES=	http://neo4j.com/artifact.php?name=

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://neo4j.com/
COMMENT=	Highly scalable, robust native graph database
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/${DISTNAME:S/-unix//}

NO_BUILD=	yes
USE_JAVA2=	7
USE_LANGUAGES=	# none
USE_TOOLS+=	pax

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	VARBASE NEO4J_USER NEO4J_GROUP NEO4J_DATA

FILES_SUBST+=	NEO4J_USER=${NEO4J_USER} NEO4J_GROUP=${NEO4J_GROUP} \
		NEO4J_DATA=${NEO4J_DATA}

NEO4J_USER?=	neo4j
NEO4J_GROUP?=	neo4j
NEO4J_DATA?=	${VARBASE}/db/neo4j

CONFIG_FILES=	custom-logback.xml logging.properties neo4j-http-logging.xml \
		neo4j-server.properties	neo4j-wrapper.conf neo4j.properties  \
		windows-wrapper-logging.properties

PKG_SYSCONFSUBDIR=	neo4j

PKG_GROUPS+=		${NEO4J_GROUP}
PKG_USERS+=		${NEO4J_USER}:${NEO4J_GROUP}
PKG_GECOS.${NEO4J_USER}=Neo4J daemon user

OWN_DIRS_PERMS+=	${NEO4J_DATA} ${NEO4J_USER} ${NEO4J_GROUP} 0755
OWN_DIRS_PERMS+=	${NEO4J_DATA}/log ${NEO4J_USER} ${NEO4J_GROUP} 0755
PKG_SYSCONFDIR_PERMS=	${NEO4J_USER} ${NEO4J_GROUP} 0755

.for f in ${CONFIG_FILES}
CONF_FILES_PERMS+=	share/examples/neo4j/${f} ${PKG_SYSCONFDIR}/${f} \
			${NEO4J_USER} ${NEO4J_GROUP} 0644
.endfor

INSTALLATION_DIRS+=	neo4j share/examples/neo4j

do-install:
	cd ${WRKSRC} && ${PAX} -rw -pp bin lib plugins system \
		${DESTDIR}${PREFIX}/neo4j
	${LN} -sf ${PKG_SYSCONFDIR} ${DESTDIR}${PREFIX}/neo4j/conf
	${LN} -sf ${NEO4J_DATA} ${DESTDIR}${PREFIX}/neo4j/data
.for f in ${CONFIG_FILES}
	${INSTALL_DATA} ${WRKSRC}/conf/${f} \
		${DESTDIR}${PREFIX}/share/examples/neo4j
.endfor

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
