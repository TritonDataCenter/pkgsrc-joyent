# $NetBSD$

COLLECTD_PACKAGE=	network

COMMENT=		Statistics collection daemon - network plugin

.include "../../wip/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libgcrypt=${BUILDLINK_PREFIX.libgcrypt}

.include "../../security/libgcrypt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
