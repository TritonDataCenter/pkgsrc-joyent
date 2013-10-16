# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.gdb7
PKG_SUPPORTED_OPTIONS=	gdb7-tui
PKG_SUGGESTED_OPTIONS=	gdb7-tui

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mgdb7-tui)
.include "../../mk/curses.buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-tui
.endif
