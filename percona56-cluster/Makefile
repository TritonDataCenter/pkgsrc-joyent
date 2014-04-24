# $NetBSD$

DISTNAME=	Percona-XtraDB-Cluster-5.6.15
CATEGORIES=	databases
MASTER_SITES=	http://www.percona.com/redir/downloads/Percona-XtraDB-Cluster-56/LATEST/source/

PKGNAME=	${DISTNAME:tl:S/-xtradb//}
COMMENT=	Percona Cluster Server 5.6

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://www.percona.com/
LICENSE=	gnu-gpl-v2

CONFLICTS=	{mysql,percona}*-{client,server}-[0-9]*

# Include the Sphinx storage engine
SPHINX=		sphinx-2.0.9-release
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${SPHINX}.tar.gz
SITES.${SPHINX}.tar.gz=	http://sphinxsearch.com/files/

USE_CMAKE=		yes
USE_GNU_READLINE=	yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		bash bison gmake perl:run python:run

INFO_FILES=		yes
UNWRAP_FILES+=		scripts/mysql_config

.include "../../mk/bsd.prefs.mk"

.include "options.mk"

# MYSQL_USER		username of the database administrator
# MYSQL_GROUP		group of the database administrator
# MYSQL_DATADIR		home directory (location of the databases)
# MYSQL_CHARSET		default character set
# MYSQL_EXTRA_CHARSET	additional character set to be compiled in
MYSQL_USER?=		mysql
MYSQL_GROUP?=		mysql
MYSQL_DATADIR?=		${VARBASE}/mysql
MYSQL_CHARSET?=		latin1
MYSQL_COLLATION?=	latin1_swedish_ci
MYSQL_EXTRA_CHARSET?=	all

PKG_USERS_VARS+=	MYSQL_USER
PKG_GROUPS_VARS+=	MYSQL_GROUP

CONFIG_SHELL=		${TOOLS_PATH.bash}

.if ${OPSYS} == "IRIX"
CFLAGS+=		-DIRIX5 -DNEEDS_BSTRING_H
.endif

BUILD_DEFS+=		VARBASE

# paths
CMAKE_ARGS+=		-DINSTALL_BINDIR="bin${BINARCHSUFFIX}"
CMAKE_ARGS+=		-DINSTALL_DOCDIR="share/doc/mysql"
CMAKE_ARGS+=		-DINSTALL_DOCREADMEDIR="share/doc/mysql"
CMAKE_ARGS+=		-DINSTALL_INCLUDEDIR="include/mysql"
CMAKE_ARGS+=		-DINSTALL_INFODIR="info"
CMAKE_ARGS+=		-DINSTALL_LIBDIR="lib${LIBARCHSUFFIX}"
CMAKE_ARGS+=		-DINSTALL_MANDIR="${PKGMANDIR}"
CMAKE_ARGS+=		-DINSTALL_MYSQLSHAREDIR="share/mysql"
CMAKE_ARGS+=		-DINSTALL_MYSQLTESTDIR="share/mysql/test"
CMAKE_ARGS+=		-DINSTALL_PLUGINDIR="lib${LIBARCHSUFFIX}/mysql/plugin"
CMAKE_ARGS+=		-DINSTALL_SBINDIR="sbin${BINARCHSUFFIX}"
CMAKE_ARGS+=		-DINSTALL_SCRIPTDIR="bin${BINARCHSUFFIX}"
CMAKE_ARGS+=		-DINSTALL_SQLBENCHDIR="share/mysql/sql-bench"
CMAKE_ARGS+=		-DINSTALL_SUPPORTFILESDIR="share/mysql"
CMAKE_ARGS+=		-DMYSQL_DATADIR=${MYSQL_DATADIR}

# always use our own readline, not MySQL bundled one
CMAKE_ARGS+=		-DWITH_LIBEDIT=OFF
CMAKE_ARGS+=		-DWITH_READLINE=OFF
CMAKE_ARGS+=		-DDEFAULT_CHARSET=${MYSQL_CHARSET:Q}
CMAKE_ARGS+=		-DDEFAULT_COLLATION=${MYSQL_COLLATION:Q}
CMAKE_ARGS+=		-DWITH_EXTRA_CHARSETS=${MYSQL_EXTRA_CHARSET:Q}
BROKEN_READLINE_DETECTION=	yes # At least on RHEL 5.6

CMAKE_ARGS+=		-DWITH_LIBWRAP=ON
CMAKE_ARGS+=		-DWITHOUT_AUTH_PAM=1 -DWITHOUT_AUTH_PAM_COMPAT=1
CMAKE_ARGS+=		-DHAVE_EMBEDDED_PRIVILEGE_CONTROL=1

CMAKE_ARGS+=		-DENABLE_DTRACE=ON

CMAKE_ARGS+=		-DWITH_WSREP=1
CMAKE_ARGS+=		-DWITH_INNODB_DISALLOW_WRITES=1

# Engines
CMAKE_ARGS+=		-DWITH_ARCHIVE_STORAGE_ENGINE=ON
CMAKE_ARGS+=		-DWITH_BLACKHOLE_STORAGE_ENGINE=ON
CMAKE_ARGS+=		-DWITH_CSV_STORAGE_ENGINE=ON
CMAKE_ARGS+=		-DWITH_FEDERATED_STORAGE_ENGINE=ON
CMAKE_ARGS+=		-DWITH_INNOBASE_STORAGE_ENGINE=ON
CMAKE_ARGS+=		-DWITH_PARTITION_STORAGE_ENGINE=ON
CMAKE_ARGS+=		-DWITH_PERFSCHEMA_STORAGE_ENGINE=ON

PLIST_VARS+=		embedded auth_socket

.if !empty(PKG_OPTIONS:Membedded-server)
CMAKE_ARGS+=            -DWITH_EMBEDDED_SERVER=ON
PLIST.embedded=         yes
.else
# We only need readline to placate the configure script if we don't build
# the embedded server as it is the only binary linked against "readline".
BUILDLINK_DEPMETHOD.readline=   build
.endif

# Ensure dtrace builds the correct ABI
.if !empty(ABI:M32)
CMAKE_ARGS+=		-DDTRACE_FLAGS="-32"
.elif !empty(ABI:M64)
CMAKE_ARGS+=		-DDTRACE_FLAGS="-64"
.endif

# MySQL 5 depends on builtin functions enabled with i486 and later with GCC.
.if ${OPSYS} == "NetBSD" && !empty(MACHINE_ARCH:Mi386)
GNU_ARCH.i386=		i486
CFLAGS+=		-march=i486
.endif

CPPFLAGS+=		-Dunix
CFLAGS+=		-DUSE_OLD_FUNCTIONS # 3.23.x compat

.if ${OPSYS} != "Interix"
CFLAGS+=		-fPIC -DPIC
CXXFLAGS+=		-fPIC -DPIC
.endif

# force HAVE_CURSES_H on Solaris since the configure script is broken
# and does not properly detect this, breaking the build later on.
.if ${OPSYS} == "SunOS"
CFLAGS+=		-DHAVE_CURSES_H
CXXFLAGS+=		-DHAVE_CURSES_H
.endif

.include "../../mk/pthread.buildlink3.mk"

.if defined(PTHREAD_TYPE) && (${PTHREAD_TYPE} == "pth")
CFLAGS+=		-DSIGNALS_DONT_BREAK_READ
CXXFLAGS+=		-DSIGNALS_DONT_BREAK_READ
.endif

LDFLAGS+=		${COMPILER_RPATH_FLAG}${PREFIX}/lib/mysql

PTHREAD_OPTS+=		require

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

CNFSUBST=		-e 's,@MYSQL_DATADIR@,${MYSQL_DATADIR},g'
CNFSUBST+=		-e 's,@PREFIX@,${PREFIX},g'
CNFSUBST+=		-e 's,@VARBASE@,${VARBASE},g'

CONF_FILES=		${PREFIX}/share/mysql/my-joyent.cnf \
			${PKG_SYSCONFDIR}/my.cnf

REPLACE_PERL=		mysql-test/lib/My/SafeProcess/safe_process.pl
REPLACE_PERL+=		mysql-test/lib/v1/mysql-test-run.pl
REPLACE_PERL+=		mysql-test/mysql-stress-test.pl
REPLACE_PERL+=		mysql-test/mysql-test-run.pl
REPLACE_PERL+=		mysql-test/suite/engines/rr_trx/run_stress_tx_rr.pl
REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_local.pl
REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_modify.pl
REPLACE_PERL+=		mysql-test/suite/funcs_2/lib/gen_charset_utf8.pl
REPLACE_PERL+=		mysql-test/mtr
REPLACE_PERL+=		scripts/mysql_convert_table_format.sh
REPLACE_PERL+=		scripts/mysql_find_rows.sh
REPLACE_PERL+=		scripts/mysql_fix_extensions.sh
REPLACE_PERL+=		scripts/mysql_fix_privilege_tables.sh
REPLACE_PERL+=		scripts/mysql_setpermission.sh
REPLACE_PERL+=		scripts/mysql_zap.sh
REPLACE_PERL+=		scripts/mysqlaccess.sh
REPLACE_PERL+=		scripts/mysqld_multi.sh
REPLACE_PERL+=		scripts/mysqldumpslow.sh
REPLACE_PERL+=		scripts/mysqlhotcopy.sh

REPLACE_PYTHON=		mysql-test/suite/opt_trace/validate_json.py
REPLACE_PYTHON+=	scripts/pyclustercheck

SUBST_CLASSES+=		scr
SUBST_STAGE.scr=	pre-configure
SUBST_FILES.scr=	scripts/mysql_install_db.sh scripts/mysqld_safe.sh \
			scripts/mysql_secure_installation.sh \
			support-files/mysql.server.sh
SUBST_SED.scr=		-e "s,chown,${CHOWN},g"
SUBST_SED.scr+=		-e "s,/bin/sh,${RCD_SCRIPTS_SHELL},g"
SUBST_MESSAGE.scr=	Fixing scripts.

post-extract:
	${MV} ${WRKDIR}/${SPHINX}/mysqlse ${WRKSRC}/storage/sphinx

# Replace manual pages which only include other ones with a symbolic link
# if manual compression is activated. The manual pages won't work otherwise.
post-install:
	${SED} ${CNFSUBST} < ${FILESDIR}/my-joyent.cnf.sh \
		> ${DESTDIR}${PREFIX}/share/mysql/my-joyent.cnf
	${RM} -rf ${DESTDIR}${PREFIX}/xinetd.d
.if defined(MANZ)
.  for FILE in mysql_client_test_embedded.1 mysqltest_embedded.1
	${RM} -f ${DESTDIR}${PREFIX}/man/man1/${FILE}
	${LN} -s ${FILE:S/_embedded//} ${DESTDIR}${PREFIX}/man/man1/${FILE}
.  endfor
.endif

.include "../../devel/readline/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
