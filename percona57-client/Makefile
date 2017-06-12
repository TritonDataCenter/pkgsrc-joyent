# $NetBSD$

PKGNAME=	${DISTNAME:C/-${MYSQLEXT_VER}//:S/server/client/}
COMMENT=	Percona Server, a MySQL server fork (client)

CONFLICTS=	mysql-client-[0-9]*

.include "Makefile.common"

CMAKE_ARGS+=		-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
INFO_FILES=		yes
INSTALL_DIRS+=		client include libmysql man scripts

REPLACE_PERL+=	scripts/mysqld_multi.sh
REPLACE_PERL+=	scripts/mysqldumpslow.sh

post-install:
# Replace manual pages which only include other ones with a symbolic link
# if manual compression is activated. The manual pages won't work otherwise.
.if defined(MANZ)
.  for FILE in mysql_client_test_embedded.1 mysqltest_embedded.1
	${RM} -f ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/${FILE}
	${LN} -sf ${FILE:S/_embedded//} ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/${FILE}
.  endfor
.endif
	cd ${DESTDIR}${PREFIX}/lib && ${LN} -sf libperconaserverclient.a libmysqlclient.a
	cd ${DESTDIR}${PREFIX}/lib && ${LN} -sf libperconaserverclient.so libmysqlclient.so

.include "../../mk/bsd.pkg.mk"
