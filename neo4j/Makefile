# $NetBSD$

DISTNAME=	neo4j-community-4.2.0-unix
PKGNAME=	${DISTNAME:S/-community//:S/-unix//}
CATEGORIES=	databases
MASTER_SITES=	http://neo4j.com/artifact.php?name=

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://neo4j.com/
COMMENT=	Highly scalable, robust native graph database
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/${DISTNAME:S/-unix//}

NO_BUILD=	yes
USE_JAVA2=	9
USE_LANGUAGES=	# none
USE_TOOLS+=	bash:run pax

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	VARBASE NEO4J_USER NEO4J_GROUP NEO4J_DATA NEO4J_PROJECT

FILES_SUBST+=	NEO4J_USER=${NEO4J_USER} NEO4J_GROUP=${NEO4J_GROUP} \
		NEO4J_DATA=${NEO4J_DATA} NEO4J_PROJECT=${NEO4J_PROJECT}

NEO4J_USER?=	neo4j
NEO4J_GROUP?=	neo4j
NEO4J_PROJECT?=	neo4j
NEO4J_DATA?=	${VARBASE}/db/neo4j

PKG_SYSCONFSUBDIR=	neo4j

PKG_GROUPS+=		${NEO4J_GROUP}
PKG_USERS+=		${NEO4J_USER}:${NEO4J_GROUP}
PKG_GECOS.${NEO4J_USER}=	Neo4J daemon user

OWN_DIRS_PERMS+=	${NEO4J_DATA} ${NEO4J_USER} ${NEO4J_GROUP} 0755
OWN_DIRS_PERMS+=	${VARBASE}/log/neo4j ${NEO4J_USER} ${NEO4J_GROUP} 0755
OWN_DIRS_PERMS+=	${NEO4J_DATA}/run ${NEO4J_USER} ${NEO4J_GROUP} 0755
CONF_FILES=		share/examples/neo4j/neo4j.conf ${PKG_SYSCONFDIR}/neo4j.conf

REPLACE_SH+=		bin/cypher-shell bin/neo4j bin/neo4j-admin
INSTALLATION_DIRS+=	neo4j share/examples/neo4j

pre-install:
	${RM} -f ${WRKSRC}/bin/neo4j.orig
	${RM} -f ${WRKSRC}/bin/neo4j-admin.orig

do-install:
	cd ${WRKSRC} && ${PAX} -rw -pp bin certificates labs lib plugins \
		${DESTDIR}${PREFIX}/neo4j
	${LN} -sf ${PKG_SYSCONFDIR} ${DESTDIR}${PREFIX}/neo4j/conf
	${LN} -sf ${NEO4J_DATA} ${DESTDIR}${PREFIX}/neo4j/data
	${LN} -sf ${VARBASE}/log/neo4j ${DESTDIR}${PREFIX}/neo4j/logs
	${LN} -sf ${NEO4J_DATA}/run ${DESTDIR}${PREFIX}/neo4j/run
	${INSTALL_DATA} ${WRKSRC}/conf/neo4j.conf ${DESTDIR}${PREFIX}/share/examples/neo4j

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
