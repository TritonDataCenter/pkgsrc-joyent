# $NetBSD$

PKGNAME=	${DISTNAME:tl:C/-${MYSQLEXT_VER}//}
COMMENT=	Percona Server, a MySQL server fork (server)

CONFLICTS=	mysql-server-[0-9]*

.include "../../joyent/percona80-client/Makefile.common"

CMAKE_ARGS+=		-DINSTALL_INFODIR=${PKGINFODIR}
CMAKE_ARGS+=		-DINSTALL_MYSQLTESTDIR=""
CMAKE_ARGS+=		-DWITH_EMBEDDED_SERVER=ON

PKG_GROUPS=		${MYSQL_GROUP}
PKG_USERS=		${MYSQL_USER}:${MYSQL_GROUP}

PKG_GECOS.${MYSQL_USER}=	MySQL database administrator
PKG_HOME.${MYSQL_USER}=		${MYSQL_DATADIR}
PKG_SHELL.${MYSQL_USER}=	${SH}

RCD_SCRIPTS=		mysqld
SMF_NAME=		percona
SMF_METHODS=		${RCD_SCRIPTS}

FILES_SUBST+=		HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
MESSAGE_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
MESSAGE_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
BUILD_DEFS+=		MYSQL_DATADIR

SUBST_CLASSES+=		perlpath
SUBST_STAGE.perlpath=	pre-configure
SUBST_MESSAGE.perlpath=	Fixing Perl paths.
SUBST_FILES.perlpath=	scripts/mysql_config.pl.in
SUBST_FILES.perlpath+=	scripts/mysqld_multi.sh
SUBST_FILES.perlpath+=	scripts/mysqldumpslow.sh
SUBST_SED.perlpath=	-e 's,@PERL_PATH@,${PERL5},g'

INFO_FILES=		yes

CONF_FILES=		${PREFIX}/share/mysql/my-joyent.cnf \
			${PKG_SYSCONFDIR}/my.cnf

TEST_TARGET=		test

post-build:
	${SED} ${FILES_SUBST_SED} ${FILESDIR}/my-joyent.cnf.sh \
	    >${WRKSRC}/my-joyent.cnf

post-install:
	${INSTALL_DATA} ${WRKSRC}/my-joyent.cnf \
	    ${DESTDIR}${PREFIX}/share/mysql/my-joyent.cnf

.include "../../archivers/lz4/buildlink3.mk"
BUILDLINK_AUTO_DIRS.percona-client=	no
.include "../../joyent/percona80-client/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
