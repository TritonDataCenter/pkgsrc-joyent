# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.percona56-cluster

# ndb-cluster does not configure with cmake
PKG_SUPPORTED_OPTIONS+=	embedded-server ndb-cluster ssl
PKG_SUGGESTED_OPTIONS+=	ssl

.include "../../mk/bsd.options.mk"

###
### Enable OpenSSL support
###
.if !empty(PKG_OPTIONS:Mssl)
.  include "../../security/openssl/buildlink3.mk"
CMAKE_ARGS+=		-DWITH_SSL=system
.else
CMAKE_ARGS+=		-DWITH_SSL=no
.endif
