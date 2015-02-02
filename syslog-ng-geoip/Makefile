# $NetBSD$

SYSLOG_MOD=	geoip
SYSLOG_MODDIR=	tfgeoip
COMMENT=	Syslog-ng GeoIP module

.include "../../joyent/syslog-ng/Makefile.module"

CONFIGURE_ENV+=	GEOIP_LIBS="-L${BUILDLINK_PREFIX.GeoIP}/lib -lGeoIP"

.include "../../net/GeoIP/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
