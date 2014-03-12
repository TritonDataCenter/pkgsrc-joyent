# $NetBSD$

COLLECTD_PACKAGE=	snmp

COMMENT=		Statistics collection daemon - snmp plugin

.include "../../joyent/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libnetsnmp=${BUILDLINK_PREFIX.net-snmp}/bin/net-snmp-config

.include "../../net/net-snmp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
