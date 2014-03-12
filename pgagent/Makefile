# $NetBSD$
#

DISTNAME=	pgAgent-3.4.0-Source
PKGNAME=	${DISTNAME:tl:S/-source//}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_PGSQL:=pgadmin3/release/pgagent/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.pgadmin.org/download/pgagent.php
COMMENT=	Job scheduling agent for PostgreSQL
LICENSE=	mit

USE_LANGUAGES=	c c++
USE_CMAKE=	yes

CMAKE_ARGS+=	-DSTATIC_BUILD=NO

.include "../../x11/wxGTK28/buildlink3.mk"
.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
