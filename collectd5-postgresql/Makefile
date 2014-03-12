# $NetBSD$

COLLECTD_PACKAGE=	postgresql

PKGNAME=		${DISTNAME:S/collectd/collectd-${COLLECTD_PACKAGE}${PGSQL_VERSION}/}
COMMENT=		Statistics collection daemon - postgresql plugin

.include "../../joyent/collectd5/Makefile.common"

CONFIGURE_ARGS+=	--with-libpq=${PGSQL_PREFIX}

.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
