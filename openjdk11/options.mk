# $NetBSD$

PKG_OPTIONS_VAR=		PKG_OPTIONS.openjdk11
PKG_SUPPORTED_OPTIONS=		jre-jce x11
PKG_SUGGESTED_OPTIONS=		jre-jce x11

.include "../../mk/bsd.options.mk"

# Java(TM) Cryptography Extension (JCE)
.if !empty(PKG_OPTIONS:Mjre-jce)
CONFIGURE_ARGS+=	--enable-unlimited-crypto
.else
CONFIGURE_ARGS+=	--disable-unlimited-crypto
.endif

# X11 or headless build
PLIST_VARS+=	x11
.if !empty(PKG_OPTIONS:Mx11)
PLIST.x11=	yes
CONFIGURE_ARGS+=	--with-x=yes
CONFIGURE_ARGS+=	--x-includes=${X11BASE}/include
CONFIGURE_ARGS+=	--x-libraries=${X11BASE}/lib
DEPENDS+=		dejavu-ttf-[0-9]*:../../fonts/dejavu-ttf
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXt?=	build
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXrandr?=	build
.include "../../x11/libXrandr/buildlink3.mk"
.else
MAKE_ENV+=		BUILD_HEADLESS_ONLY=true
CONFIGURE_ARGS+=	--without-x
CONFIGURE_ARGS+=	--disable-headful
# We apparently still need the Xlib headers to build headless. why?
BUILDLINK_DEPMETHOD.libX11?=	build
.include "../../x11/libX11/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXt?=	build
.include "../../x11/libXt/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXrender?=build
.include "../../x11/libXrender/buildlink3.mk"
BUILDLINK_DEPMETHOD.libXrandr?=	build
.include "../../x11/libXrandr/buildlink3.mk"
post-configure: remove-x11-classes
remove-x11-classes:
	rm ${WRKSRC}/jdk/src/solaris/classes/sun/awt/X11/*.java
.endif
