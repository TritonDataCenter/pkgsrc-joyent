# $NetBSD$

COLLECTD_PACKAGE=	dbi

COMMENT=		Statistics collection daemon - dbi plugin

.include "../../wip/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libdbi=${BUILDLINK_PREFIX.libdbi}

.include "../../databases/libdbi/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
