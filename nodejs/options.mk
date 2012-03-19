# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.nodejs
PKG_SUPPORTED_OPTIONS=	openssl dtrace
PKG_SUGGESTED_OPTIONS=	openssl

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdtrace)
CONFIGURE_ARGS+=	--with-dtrace
PLIST.dtrace=		yes
.  if ${MACHINE_ARCH} != "i386"
CONFIGURE_ARGS+=	--without-dtrace-helper
.  endif
.endif

.if !empty(PKG_OPTIONS:Mopenssl)
.include "../../security/openssl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-openssl
.endif
