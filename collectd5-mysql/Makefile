# $NetBSD$

COLLECTD_PACKAGE=	mysql

PKGNAME=		${DISTNAME:S/collectd/collectd-${COLLECTD_PACKAGE}${MYSQL_VERSION}/}
COMMENT=		Statistics collection daemon - mysql plugin

.include "../../joyent/collectd5/Makefile.common"


CONFIGURE_ARGS+=	--with-libmysql=${BUILDLINK_PREFIX.mysql-client}

.include "../../mk/mysql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
