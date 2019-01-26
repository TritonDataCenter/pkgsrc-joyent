# $NetBSD$

PKGNAME=	${DISTNAME:C/-${SILLYREV}//:S/server/client/}
COMMENT=	Percona MySQL 5.5, a free SQL database (client)

CONFLICTS=	{mysql-client-[0-9]*,mysql3-client-[0-9]*}

.include "Makefile.common"

CMAKE_ARGS+=		-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
INFO_FILES=		yes
INSTALL_DIRS+=		client include libmysql man scripts tests

REPLACE_PERL=	scripts/mysql_convert_table_format.sh
REPLACE_PERL+=	scripts/mysql_find_rows.sh
REPLACE_PERL+=	scripts/mysql_fix_extensions.sh
REPLACE_PERL+=	scripts/mysql_setpermission.sh
REPLACE_PERL+=	scripts/mysql_zap.sh
REPLACE_PERL+=	scripts/mysqlaccess.sh
REPLACE_PERL+=	scripts/mysqld_multi.sh
REPLACE_PERL+=	scripts/mysqldumpslow.sh
REPLACE_PERL+=	scripts/mysqlhotcopy.sh

post-install:
	cd ${DESTDIR}${PREFIX}/lib${LIBARCHSUFFIX}
.for f in client client_r
.  for sfx in a so
	${RM} -f libmysql${f}.${sfx}
	${LN} -s libperconaserver${f}.${sfx} libmysql${f}.${sfx}
.  endfor
.endfor

.include "../../mk/bsd.pkg.mk"
