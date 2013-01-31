# $NetBSD: Makefile,v 1.3 2012/09/11 23:59:28 asau Exp $
#

DISTNAME=	celt-0.5.1.3
PKGNAME= celt051-${DISTNAME:S/celt-//}
CATEGORIES=	joyent
MASTER_SITES=	http://downloads.us.xiph.org/releases/celt/

MAINTAINER=	nshalman-pkgsrc@elys.com
HOMEPAGE=	http://celt-codec.org/
COMMENT=	Ultra-low-delay, high-quality audio codec (experimental)
LICENSE=	modified-bsd

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	celt.pc.in

USE_MULTIARCH=lib

.include "../../mk/bsd.prefs.mk"
.include "../../mk/oss.buildlink3.mk"

.if ${OPSYS} == "NetBSD" || ${OPSYS} == "OpenBSD" || ${OPSYS} == "Solaris"
###
### XXX Remove this definition if DEVSUNAUDIO is placed in default mk.conf.
###
DEVSUNAUDIO?=		/dev/audio
BUILD_DEFS+=		DEVSUNAUDIO
CFLAGS+=		-DDEVSUNAUDIO=\"${DEVSUNAUDIO:U/dev/audio}\"
.elif ${OSS_TYPE} != "none"
MAKE_ENV+=		LIBOSSAUDIO=${LIBOSSAUDIO:Q}
CFLAGS+=		-DDEVOSSAUDIO=\"${DEVOSSAUDIO:U/dev/dsp}\"
.endif

.include "../../mk/bsd.pkg.mk"
