# $NetBSD: options.mk,v 1.9 2015/03/24 08:36:56 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.gnupg20
PKG_SUPPORTED_OPTIONS=	libusb

.include "../../mk/bsd.prefs.mk"
.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mlibusb)
USE_TOOLS+=	pkg-config
.  include "../../devel/libusb/buildlink3.mk"
.endif
