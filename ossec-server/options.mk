# $NetBSD$

PKG_OPTIONS_VAR=		PKG_OPTIONS.ossec
PKG_SUPPORTED_OPTIONS=		#
PKG_OPTIONS_OPTIONAL_GROUPS=	db
PKG_OPTIONS_GROUP.db=		mysql pgsql
PKG_SUGGESTED_OPTIONS=		#

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mmysql)
.  include "../../mk/mysql.buildlink3.mk"
MAKE_FLAGS+=	DATABASE=mysql
.endif

.if !empty(PKG_OPTIONS:Mpgsql)
.  include "../../mk/pgsql.buildlink3.mk"
MAKE_FLAGS+=	DATABASE=pgsql
.endif
