# $NetBSD: Makefile,v 1.6 2011/10/22 10:32:37 adam Exp $

PKGNAME=	${DISTNAME:tl:C/-rel.*//}
COMMENT=	Percona MySQL 5.5, a free SQL database (server)

CONFLICTS=	{mysql-server-[0-9]*,mysql3-server-[0-9]*,mysql55-server-[0-9]*}

# might be removed in the future
# if mysqld_safe script is installed here, or rc.d script invokes mysqld
DEPENDS+=	percona-client>=${PKGVERSION_NOREV}:../../joyent/percona55-client

.include "../../joyent/percona55-client/Makefile.common"

# Include the Sphinx storage engine
SPHINX=		sphinx-2.0.6-release
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${SPHINX}.tar.gz
SITES.${SPHINX}.tar.gz=	http://rsync.macports.org/sphinx/

INFO_FILES=		yes
CPPFLAGS+=		-DHAVE_EMBEDDED_PRIVILEGE_CONTROL=1

PLIST_VARS+=		embedded auth_socket

.if ${OPSYS} == "Linux"
PLIST.auth_socket=	yes
.endif

PTHREAD_OPTS+=		require

PKG_GROUPS=		${MYSQL_GROUP}
PKG_USERS=		${MYSQL_USER}:${MYSQL_GROUP}

PKG_GECOS.${MYSQL_USER}=	MySQL database administrator
PKG_HOME.${MYSQL_USER}=		${MYSQL_DATADIR}
PKG_SHELL.${MYSQL_USER}=	${SH}

RCD_SCRIPTS=		mysqld

FILES_SUBST+=		HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
MESSAGE_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
MESSAGE_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
BUILD_DEFS+=		MYSQL_DATADIR

CNFSUBST=		-e 's,@MYSQL_DATADIR@,${MYSQL_DATADIR},g'
CNFSUBST+=		-e 's,@PREFIX@,${PREFIX},g'
CNFSUBST+=		-e 's,@VARBASE@,${VARBASE},g'

CONF_FILES=		${PREFIX}/share/mysql/my-joyent.cnf \
			${PKG_SYSCONFDIR}/my.cnf

REPLACE_PERL+=		mysql-test/lib/My/SafeProcess/safe_process.pl
REPLACE_PERL+=		mysql-test/lib/v1/mysql-test-run.pl
REPLACE_PERL+=		mysql-test/mysql-stress-test.pl
REPLACE_PERL+=		mysql-test/mysql-test-run.pl
REPLACE_PERL+=		mysql-test/suite/engines/rr_trx/run_stress_tx_rr.pl
REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_local.pl
REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_modify.pl
REPLACE_PERL+=		mysql-test/suite/funcs_2/lib/gen_charset_utf8.pl
REPLACE_PERL+=		mysql-test/mtr

INSTALLATION_DIRS=	bin

.include "../../mk/compiler.mk"

.if !empty(PKGSRC_COMPILER:Msunpro)
CFLAGS+=		-D_POSIX_C_SOURCE=199506L -D__EXTENSIONS__
CXXFLAGS+=		-D_POSIX_C_SOURCE=199506L -D__EXTENSIONS__
.endif

post-extract:
	${MV} ${WRKDIR}/${SPHINX}/mysqlse ${WRKSRC}/storage/sphinx

post-install:
	${SED} ${CNFSUBST} < ${FILESDIR}/my-joyent.cnf.sh \
		> ${DESTDIR}${PREFIX}/share/mysql/my-joyent.cnf

.include "../../joyent/percona55-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
