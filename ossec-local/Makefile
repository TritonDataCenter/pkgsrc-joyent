# $NetBSD$

PKGNAME=	${DISTNAME:S/hids/local/}
COMMENT=	Security tool to monitor logs and intrusions - local package

CONFLICTS+=	ossec-server-[0-9]* ossec-local-[0-9]*

MAKE_FLAGS+=	TARGET=local

OWN_DIRS_PERMS+=	${OSSEC_DIR}/logs/alerts ${OSSEC_USER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/logs/archives ${OSSEC_USER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/logs/firewall ${OSSEC_USER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/queue/agent-info ${OSSEC_REMUSER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/queue/agentless ${OSSEC_USER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/queue/fts ${OSSEC_USER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/queue/rids ${OSSEC_REMUSER} ${OSSEC_GROUP} 0770
OWN_DIRS_PERMS+=	${OSSEC_DIR}/queue/rootcheck ${OSSEC_USER} ${OSSEC_GROUP} 0750
OWN_DIRS_PERMS+=	${OSSEC_DIR}/stats ${OSSEC_USER} ${OSSEC_GROUP} 0750

CONF_FILES_PERMS+=	${OSSEC_DIR}/rules/local_rules.xml.sample		\
			${OSSEC_DIR}/rules/local_rules.xml			\
			${REAL_ROOT_USER} ${OSSEC_GROUP} 0640

.include "../../joyent/ossec-server/options.mk"
.include "../../joyent/ossec-server/Makefile.common"
.include "../../mk/bsd.pkg.mk"
