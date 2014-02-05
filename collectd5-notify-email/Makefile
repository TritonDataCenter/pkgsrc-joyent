# $NetBSD$

COLLECTD_PACKAGE=	notify-email

COMMENT=		Statistics collection daemon - notify_email plugin

.include "../../wip/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libesmtp=${BUILDLINK_PREFIX.libesmtp}

.include "../../mail/libesmtp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
