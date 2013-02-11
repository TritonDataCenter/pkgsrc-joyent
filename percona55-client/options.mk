# $NetBSD: options.mk,v 1.1.1.1 2011/04/25 21:12:53 adam Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.percona55

# ndb-cluster does not configure with cmake
PKG_SUPPORTED_OPTIONS+=	embedded-server ndb-cluster ssl
PKG_SUGGESTED_OPTIONS+=	ssl

.include "../../mk/bsd.options.mk"

###
### Enable OpenSSL support
###
.if !empty(PKG_OPTIONS:Mssl)
.	include "../../security/openssl/buildlink3.mk"
.  if ${OPSYS} == "SunOS"
CHECK_BUILTIN.openssl:=yes
.    include "../../security/openssl/builtin.mk"
CHECK_BUILTIN.openssl:=no
.    if ${USE_BUILTIN.openssl} == "yes"
CMAKE_ARGS+=		-DWITH_SSL=system
.    endif
.  else
CMAKE_ARGS+=		-DWITH_SSL=system
.  endif
.else
CMAKE_ARGS+=		-DWITH_SSL=no
.endif
