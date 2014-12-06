# $NetBSD$

PKGNAME=	${DISTNAME:S/hids/agent/}
COMMENT=	Security tool to monitor and check logs and intrusions

CONFLICTS+=	ossec-server-[0-9]* ossec-local-[0-9]*

BUILD_TARGET=		setagent
INSTALL_TARGET=		agent

.include "../../joyent/ossec-server/Makefile.common"
.include "../../mk/bsd.pkg.mk"
