# $NetBSD: options.mk,v 1.2 2009/10/24 20:16:02 tnn Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.gcc45
PKG_SUPPORTED_OPTIONS=	nls
PKG_SUGGESTED_OPTIONS=
.if ${OPSYS} == "NetBSD"
PKG_SUGGESTED_OPTIONS+=	nls
.endif

.include "../../mk/bsd.options.mk"

###
### Native Language Support
###
.if !empty(PKG_OPTIONS:Mnls)
CONFIGURE_ARGS+=	--enable-nls
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-nls
.endif
