# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.ossec
PKG_SUPPORTED_OPTIONS=	mysql pgsql
PKG_SUGGESTED_OPTIONS=	#

INCLUDE_PREFIX?= /opt/local

BUILDLINK_PREFIX.openssl= ${INCLUDE_PREFIX}

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mmysql) || !empty(PKG_OPTIONS:Mpgsql)
BUILD_TARGET+=	setdb
.endif

.if !empty(PKG_OPTIONS:Mmysql)
.  include "../../mk/mysql.buildlink3.mk"
MAKE_FLAGS+=	ENABLE_MYSQL=1
.endif

.if !empty(PKG_OPTIONS:Mpgsql)
.  include "../../mk/pgsql.buildlink3.mk"
MAKE_FLAGS+=	ENABLE_PGSQL=1
.endif
