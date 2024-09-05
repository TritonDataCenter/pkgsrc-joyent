# $NetBSD$

PKGNAME=	${DISTNAME:C/-${MYSQLEXT_VER}//:S/server/client/}
COMMENT=	Percona Server, a MySQL server fork (client)

CONFLICTS=	mysql-client-[0-9]*

CMAKE_CONFIGURE_ARGS+=	-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
INSTALL_DIRS=		client include libmysql man scripts testclients

.include "Makefile.common"

post-install:
	cd ${DESTDIR}${PREFIX}/lib; \
	    ${LN} -sf libperconaserverclient.a libmysqlclient.a; \
	    ${LN} -sf libperconaserverclient.so libmysqlclient.so

.include "../../mk/bsd.pkg.mk"
