# $NetBSD$

SYSLOG_MOD=	redis
SYSLOG_MODDIR=	redis
COMMENT=	Syslog-ng Redis module

.include "../../joyent/syslog-ng/Makefile.module"

CONFIGURE_ARGS+=	--with-libhires=${BUILDLINK_PREFIX.hiredis}

.include "../../databases/hiredis/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
