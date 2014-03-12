# $NetBSD$

COLLECTD_PACKAGE=	dns

COMMENT=		Statistics collection daemon - dns plugin

.include "../../joyent/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libpcap=${BUILDLINK_PREFIX.libpcap}

.include "../../net/libpcap/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
