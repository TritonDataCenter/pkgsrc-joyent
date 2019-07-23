# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.percona80

PKG_SUPPORTED_OPTIONS+=	dtrace memcached

.include "../../mk/bsd.options.mk"

# Enable DTrace support
.if !empty(PKG_OPTIONS:Mdtrace)
CMAKE_ARGS+=		-DENABLE_DTRACE=ON
.else
CMAKE_ARGS+=		-DENABLE_DTRACE=OFF
.endif

# Enable InnoDB Memcached support
PLIST_VARS+=		memcached
.if !empty(PKG_OPTIONS:Mmemcached)
PLIST.memcached=	yes
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=ON
CMAKE_ARGS+=		-DWITH_BUNDLED_MEMCACHED=ON
.else
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=OFF
.endif
