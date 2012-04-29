# $NetBSD$
#

PKGNAME=	pgagent-3.2.1
DISTNAME=	${PKGNAME:S/a/A/}-Source
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_PGSQL:=pgadmin3/release/pgagent/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://wwwmaster.postgresql.org/download/mirrors-ftp/pgadmin3/release/pgagent/
COMMENT=	A job scheduling agent for PostgreSQL, capable of running multi-step batch/shell and SQL tasks on complex schedules

USE_LANGUAGES=	c c++
USE_CMAKE=	yes

SUBST_CLASSES+=		d2u
SUBST_MESSAGE.d2u=	Converting CRLF to LF.
SUBST_STAGE.d2u=	post-extract
SUBST_FILES.d2u=	CMakeLists.txt
SUBST_FILTER_CMD.d2u=	${TR} -d '\015'

.include "../../mk/bsd.prefs.mk"
.include "../../x11/wxGTK28/buildlink3.mk"

#.if empty(PKG_BUILD_OPTIONS.wxGTK28:Municode)
#SUBST_CLASSES+=		unicode
#SUBST_STAGE.unicode=	pre-configure
#SUBST_MESSAGE.unicode=	Unsetting unicode
#SUBST_FILES.unicode=	cmake/FindWX.cmake
#SUBST_SED.unicode=	-e 's,_unicode "yes",_unicode "no",'
#.endif

.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
