# $NetBSD: Makefile,v 1.6 2013/06/18 19:59:35 joerg Exp $

PKGNAME=	${DISTNAME:C/-${MYSQLEXT_VER}//:S/server/client/}
COMMENT=	Percona MySQL 5.6, a free SQL database (client)

CONFLICTS=	{mysql-client-[0-9]*,mysql3-client-[0-9]*}

.include "Makefile.common"

CMAKE_ARGS+=		-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
INFO_FILES=		yes
INSTALL_DIRS+=		client include libmysql man scripts tests

REPLACE_PERL=	scripts/mysql_convert_table_format.sh
REPLACE_PERL+=	scripts/mysql_find_rows.sh
REPLACE_PERL+=	scripts/mysql_fix_extensions.sh
REPLACE_PERL+=	scripts/mysql_install_db.pl.in
REPLACE_PERL+=	scripts/mysql_secure_installation.pl.in
REPLACE_PERL+=	scripts/mysql_setpermission.sh
REPLACE_PERL+=	scripts/mysql_zap.sh
REPLACE_PERL+=	scripts/mysqlaccess.sh
REPLACE_PERL+=	scripts/mysqld_multi.sh
REPLACE_PERL+=	scripts/mysqldumpslow.sh
REPLACE_PERL+=	scripts/mysqlhotcopy.sh

post-install:
.  for FILE in client client_r
	cd ${DESTDIR}${PREFIX}/lib${LIBARCHSUFFIX} && ${LN} -s libperconaserver${FILE}.a libmysql${FILE}.a
	cd ${DESTDIR}${PREFIX}/lib${LIBARCHSUFFIX} && ${LN} -s libperconaserver${FILE}.so libmysql${FILE}.so
.  endfor

.include "../../mk/bsd.pkg.mk"
