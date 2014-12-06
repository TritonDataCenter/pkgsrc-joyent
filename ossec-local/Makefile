# $NetBSD$

PKGNAME=	${DISTNAME:S/hids/local/}
COMMENT=	Security tool to monitor logs and intrusions - local package

CONFLICTS+=	ossec-server-[0-9]* ossec-local-[0-9]*

CONF_FILES_PERMS+=	${OSSEC_DIR}/rules/local_rules.xml.sample ${OSSEC_DIR}/rules/local_rules.xml \
			${REAL_ROOT_USER} ${OSSEC_GROUP} 0440

BUILD_TARGET=		setlocal
INSTALL_TARGET=		local

.include "../../joyent/ossec-server/options.mk"
.include "../../joyent/ossec-server/Makefile.common"
.include "../../mk/bsd.pkg.mk"
