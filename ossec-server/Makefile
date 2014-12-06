# $NetBSD$

PKGNAME=	${DISTNAME:S/hids/server/}
COMMENT=	Security tool to monitor logs and intrusions - server package

CONFLICTS+=	ossec-client-[0-9]* ossec-local-[0-9]*

CONF_FILES_PERMS+=	${OSSEC_DIR}/rules/local_rules.xml.sample ${OSSEC_DIR}/rules/local_rules.xml \
			${REAL_ROOT_USER} ${OSSEC_GROUP} 0440

INSTALL_TARGET=		server

.include "../../joyent/ossec-server/options.mk"
.include "../../joyent/ossec-server/Makefile.common"
.include "../../mk/bsd.pkg.mk"
