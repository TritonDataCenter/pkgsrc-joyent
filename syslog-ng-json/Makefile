# $NetBSD$

SYSLOG_MOD=	json
SYSLOG_MODDIR=	json-plugin
COMMENT=	Syslog-ng JSON module

.include "../../joyent/syslog-ng/Makefile.module"

CONFIGURE_ARGS+=	--with-jsonc=${BUILDLINK_PREFIX.jsonc}

BUILD_TARGET=	modules/${SYSLOG_MOD}/lib${SYSLOG_MODDIR}.la

.include "../../textproc/json-c/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
