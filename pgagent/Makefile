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

SUBST_CLASSES+=		d2u
SUBST_MESSAGE.d2u=	Converting CRLF to LF.
SUBST_STAGE.d2u=	post-extract
SUBST_FILES.d2u=	CMakeLists.txt
SUBST_FILTER_CMD.d2u=	${TR} -d '\015'

.include "../../x11/wxGTK28/buildlink3.mk"
.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
