# $NetBSD$

SYSLOG_MOD=	mongodb
SYSLOG_MODDIR=	afmongodb
COMMENT=	Syslog-ng MongoDB module

.include "../../joyent/syslog-ng/Makefile.module"

CONFIGURE_ARGS+=	--with-libmongo-client=system

.include "../../databases/libmongo-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
