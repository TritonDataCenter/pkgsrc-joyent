# $NetBSD$

.include "../../joyent/zabbix24/Makefile.common"

PKGNAME=		zabbix24-agent-${VER}

CONFLICTS+=     	zabbix22-agent-[0-9]*

CONFIGURE_ARGS+=	--enable-agent
CONFIGURE_ARGS+=	--disable-server

CONF_FILES+=	${EGDIR}/zabbix_agent.conf ${PKG_SYSCONFDIR}/zabbix_agent.conf
CONF_FILES+=	${EGDIR}/zabbix_agentd.conf ${PKG_SYSCONFDIR}/zabbix_agentd.conf

RCD_SCRIPTS=	zabbix_agentd
SMF_NAME=	zabbix-agent

.include "../../mk/bsd.pkg.mk"
