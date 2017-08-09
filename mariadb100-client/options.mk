# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.mariadb100

PKG_SUPPORTED_OPTIONS+=	dtrace embedded-server ssl tokudb
PKG_SUGGESTED_OPTIONS+=	embedded-server ssl

.include "../../mk/bsd.options.mk"

.if ${OPSYS} == "SunOS"
PKG_SUGGESTED_OPTIONS+=	dtrace
.else
PKG_SUPPORTED_OPTIONS+=	mroonga
PKG_SUGGESTED_OPTIONS+=	mroonga
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

# Enable mroonga plugin
.if !empty(PKG_OPTIONS:Mmroonga)
CMAKE_ARGS+=		-DWITH_MROONGA=yes
.else
CMAKE_ARGS+=		-DWITHOUT_MROONGA=yes
.endif

# Enable TokuDB engine
.if !empty(PKG_OPTIONS:Mtokudb)
CMAKE_ARGS+=		-DWITH_TOKUDB=yes
.else
CMAKE_ARGS+=		-DWITHOUT_TOKUDB=yes
.endif
