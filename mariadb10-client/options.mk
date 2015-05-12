# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.mariadb

PKG_SUPPORTED_OPTIONS+=	dtrace ssl
PKG_SUGGESTED_OPTIONS+=	ssl

.include "../../mk/bsd.options.mk"

.if ${OPSYS} == "SunOS"
PKG_SUGGESTED_OPTIONS+=	dtrace
.endif

# Enable DTrace support
PLIST_VARS+=		dtrace
.if !empty(PKG_OPTIONS:Mdtrace)
CMAKE_ARGS+=		-DENABLE_DTRACE=ON
PLIST.dtrace=		yes
.endif

# Enable OpenSSL support
.if !empty(PKG_OPTIONS:Mssl)
.	include "../../security/openssl/buildlink3.mk"
CMAKE_ARGS+=		-DWITH_SSL=system
.else
CMAKE_ARGS+=		-DWITH_SSL=no
.endif
