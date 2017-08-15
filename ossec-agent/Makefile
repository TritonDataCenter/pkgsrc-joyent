# $NetBSD$

PKGNAME=	${DISTNAME:S/hids/agent/}
COMMENT=	Security tool to monitor and check logs and intrusions

CONFLICTS+=	ossec-server-[0-9]* ossec-local-[0-9]*

MAKE_FLAGS+=	TARGET=agent

OWN_DIRS_PERMS+=	${OSSEC_DIR}/queue/rids ${OSSEC_USER} ${OSSEC_GROUP} 0770

.include "../../joyent/ossec-server/Makefile.common"
.include "../../mk/bsd.pkg.mk"
