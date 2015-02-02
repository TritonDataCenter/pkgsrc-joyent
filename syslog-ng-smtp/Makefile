# $NetBSD$

SYSLOG_MOD=	smtp
SYSLOG_MODDIR=	afsmtp
COMMENT=	Syslog-ng SMTP module

.include "../../joyent/syslog-ng/Makefile.module"

CONFIGURE_ARGS+=	--with-libesmtp=${BUILDLINK_PREFIX.libesmtp}

.include "../../mail/libesmtp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
