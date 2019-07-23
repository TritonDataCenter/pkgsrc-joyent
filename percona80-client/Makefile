# $NetBSD$

PKGNAME=	${DISTNAME:C/-${MYSQLEXT_VER}//:S/server/client/}
COMMENT=	Percona Server, a MySQL server fork (client)

CONFLICTS=	mysql-client-[0-9]*

.include "Makefile.common"

CMAKE_ARGS+=		-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
.for dir in client include libmysql man scripts testclients
INSTALL_DIRS+=		${WRKDIR}/build/${dir}
.endfor

post-install:
	cd ${DESTDIR}${PREFIX}/lib; \
	    ${LN} -sf libperconaserverclient.a libmysqlclient.a; \
	    ${LN} -sf libperconaserverclient.so libmysqlclient.so

.include "../../mk/bsd.pkg.mk"
