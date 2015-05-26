# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.mongo-tools
PKG_SUPPORTED_OPTIONS=	sasl # ssl

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Msasl)
MONGO_TAGS+=		sasl
.include "../../security/cyrus-sasl/buildlink3.mk"
.endif

# ssl support currently fails to build
# .dynsym: phase error: addr=0xa5e3e8 but sym=0xa5e3e0 type=20
.if !empty(PKG_OPTIONS:Mssl)
MONGO_TAGS+=		ssl
.include "../../security/openssl/buildlink3.mk"
.endif
