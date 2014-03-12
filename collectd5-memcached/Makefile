# $NetBSD$

COLLECTD_PACKAGE=	memcached
COLLECTD_PLUGINS=	memcachec memcached

COMMENT=		Statistics collection daemon - memcached plugins

.include "../../joyent/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libmemcached=${BUILDLINK_PREFIX.libmemcached}

.include "../../devel/libmemcached/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
