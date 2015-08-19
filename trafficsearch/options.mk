# $NetBSD$

PKG_OPTIONS_VAR=		PKG_OPTIONS.trafficserver
PKG_SUPPORTED_OPTIONS=		spdy ts-interim ts-wccp
PKG_OPTIONS_OPTIONAL_GROUPS=	memory
PKG_OPTIONS_GROUP.memory=	ts-freelist ts-reclaim
PKG_SUGGESTED_OPTIONS=		#

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		wccp

.if !empty(PKG_OPTIONS:Mspdy)
CONFIGURE_ARGS+=	--enable-spdy
.include "../../www/spdylay/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mts-interim)
CONFIGURE_ARGS+=	--enable-interim-cache
.endif

.if !empty(PKG_OPTIONS:Mts-wccp)
CONFIGURE_ARGS+=	--enable-wccp
PLIST.wccp=		yes
.endif

.if !empty(PKG_OPTIONS:Mts-freelist)
CONFIGURE_ARGS+=	--enable-freelist
.endif

.if !empty(PKG_OPTIONS:Mts-reclaim)
CONFIGURE_ARGS+=	--enable-freelist --enable-reclaimable-freelist
.endif

.if empty(PKG_OPTIONS:Mts-freelist) && empty(PKG_OPTIONS:Mts-reclaim)
CONFIGURE_ARGS+=	--disable-freelist
.endif
