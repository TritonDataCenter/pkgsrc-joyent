# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.mariadb10

PKG_SUPPORTED_OPTIONS+=	dtrace ssl tokudb
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

# Enable TokuDB engine
.if !empty(PKG_OPTIONS:Mtokudb)
CMAKE_ARGS+=		-DWITH_TOKUDB=yes
.else
CMAKE_ARGS+=		-DWITHOUT_TOKUDB=yes
.endif
