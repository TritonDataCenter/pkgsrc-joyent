# $NetBSD$

PKGNAME=	${DISTNAME:tl:C/-${MYSQLEXT_VER}//}
COMMENT=	Percona Server, a MySQL server fork (server)

CONFLICTS=	mysql-server-[0-9]*

.include "../../joyent/percona84-client/Makefile.common"

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

INFO_FILES=		yes

MAKE_DIRS=		${PKG_SYSCONFDIR}/logrotate.d

CONF_FILES+=		${PREFIX}/share/mysql/mysqlrouter-log-rotate \
			${PKG_SYSCONFDIR}/logrotate.d/mysqlrouter

TEST_TARGET=		test

MAKE_ENV+=		LD_LIBRARY_PATH=${WRKDIR}/build/library_output_directory

.include "../../joyent/percona84-client/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
