# $NetBSD$

DISTNAME=	pg_top-3.7.0
PKGNAME=	postgresql${PGSQL_VERSION}-${DISTNAME}
CATEGORIES=	databases
MASTER_SITES=	http://pgfoundry.org/frs/download.php/3503/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://ptop.projects.pgfoundry.org/
COMMENT=	Top like tool for PostgreSQL
LICENSE=	modified-bsd

GNU_CONFIGURE=	yes

LIBS+=		-lintl

.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
