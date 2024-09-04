# $NetBSD$

MYSQL_VER=	5.7.43
WSREP_API_VER=	31
GALERA_MINOR=	65

DISTNAME=	Percona-XtraDB-Cluster-${MYSQL_VER}-${WSREP_API_VER}.${GALERA_MINOR}
PKGNAME=	percona-cluster-${MYSQL_VER}
CATEGORIES=	databases
MASTER_SITES=	https://downloads.percona.com/downloads/Percona-XtraDB-Cluster-57/${DISTNAME:S/-${WSREP_API_VER}.${GALERA_MINOR}//}/source/tarball/

COMMENT=	Percona Cluster Server 5.7
MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://www.percona.com/
LICENSE=	gnu-gpl-v2 AND gnu-gpl-v3

# Galera
.if exists(${.CURDIR}/../../devel/scons/buildlink3.mk)
.include "../../devel/scons/buildlink3.mk"
.else
BUILD_DEPENDS+=	scons-[0-9]*:../../devel/scons
.endif
CONFLICTS=	{mysql,percona}*-{client,server}-[0-9]*

BOOST=			boost_1_59_0
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${BOOST}.tar.bz2
SITES.${BOOST}.tar.bz2=	${MASTER_SITE_SOURCEFORGE:=boost/}

DEPENDS+=	coreutils>=0:../../sysutils/coreutils	# GNU mktemp
DEPENDS+=	findutils>=0:../../sysutils/findutils	# find -regex
DEPENDS+=	grep>=0:../../textproc/grep		# grep -o
DEPENDS+=	socat>=0:../../net/socat
DEPENDS+=	percona-xtrabackup>=0:../../joyent/percona-xtrabackup

USE_CMAKE=	yes
USE_LANGUAGES=	c c++11 c99
USE_TOOLS+=	bash bison gmake perl:run

CMAKE_CONFIGURE_ARGS=	${CMAKE_ARGS}

INFO_FILES=	yes
UNWRAP_FILES+=	scripts/mysql_config

INSTALL_TEMPLATES+=	${.CURDIR}/../../joyent/percona/INSTALL57

.include "../../mk/bsd.prefs.mk"

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

CHECK_INTERPRETER_SKIP+=	share/mysql/test/*
CHECK_PORTABILITY_SKIP+=	build-ps/*
CHECK_PORTABILITY_SKIP+=	packaging/deb-in/*
CHECK_PORTABILITY_SKIP+=	percona-xtradb-cluster-galera/scripts/*
CHECK_PORTABILITY_SKIP+=	storage/ndb/mcc/frontend/dojo/dojox/mobile/build/build.sh

# failed to set type size for 601 to 0x200: Invalid argument
CTF_FILES_SKIP+=	${PREFIX}/bin/myisamlog
CTF_FILES_SKIP+=	${PREFIX}/bin/replace

BUILD_DEFS+=	VARBASE

# paths
CMAKE_ARGS+=	-DINSTALL_BINDIR="bin${BINARCHSUFFIX}"
CMAKE_ARGS+=	-DINSTALL_DOCDIR="share/doc/mysql"
CMAKE_ARGS+=	-DINSTALL_DOCREADMEDIR="share/doc/mysql"
CMAKE_ARGS+=	-DINSTALL_INCLUDEDIR="include/mysql"
CMAKE_ARGS+=	-DINSTALL_INFODIR="info"
CMAKE_ARGS+=	-DINSTALL_LIBDIR="lib${LIBARCHSUFFIX}"
CMAKE_ARGS+=	-DINSTALL_MANDIR="${PKGMANDIR}"
CMAKE_ARGS+=	-DINSTALL_MYSQLSHAREDIR="share/mysql"
CMAKE_ARGS+=	-DINSTALL_MYSQLTESTDIR=""
CMAKE_ARGS+=	-DINSTALL_PLUGINDIR="lib${LIBARCHSUFFIX}/mysql/plugin"
CMAKE_ARGS+=	-DINSTALL_SBINDIR="sbin${BINARCHSUFFIX}"
CMAKE_ARGS+=	-DINSTALL_SCRIPTDIR="bin${BINARCHSUFFIX}"
CMAKE_ARGS+=	-DINSTALL_SUPPORTFILESDIR="share/mysql"
CMAKE_ARGS+=	-DMYSQL_DATADIR=${MYSQL_DATADIR}

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
#CMAKE_ARGS+=	-DLIBEVENT_LIBRARY=event
CMAKE_ARGS+=	-DWITH_BOOST="${WRKDIR}/${BOOST}"
CMAKE_ARGS+=	-DWITH_LIBEVENT=system
CMAKE_ARGS+=	-DWITH_LZ4=system
CMAKE_ARGS+=	-DWITH_READLINE=system
CMAKE_ARGS+=	-DWITH_SSL=system

CMAKE_ARGS+=	-DDEFAULT_CHARSET=${MYSQL_CHARSET:Q}
CMAKE_ARGS+=	-DDEFAULT_COLLATION=${MYSQL_COLLATION:Q}
CMAKE_ARGS+=	-DWITH_EXTRA_CHARSETS=${MYSQL_EXTRA_CHARSET:Q}

BROKEN_READLINE_DETECTION=	yes # At least on RHEL 5.6

# tcp_wrapper support is patched until 5.7.18 is released using patches from
# Until the fix for this bug: https://bugs.mysql.com/bug.php?id=84495
# However, a symbol visibility problem prevents to build with pkgsrc libwrap
# at least
# CMAKE_ARGS+=		-DWITH_LIBWRAP=ON

# DTrace support currently failing to build
# CMAKE_ARGS+=		-DENABLE_DTRACE=ON

CMAKE_ARGS+=	-DWITH_WSREP=1
CMAKE_ARGS+=	-DWITH_INNODB_DISALLOW_WRITES=1

# Engines
CMAKE_ARGS+=	-DWITH_ARCHIVE_STORAGE_ENGINE=ON
CMAKE_ARGS+=	-DWITH_BLACKHOLE_STORAGE_ENGINE=ON
CMAKE_ARGS+=	-DWITH_CSV_STORAGE_ENGINE=ON
CMAKE_ARGS+=	-DWITH_FEDERATED_STORAGE_ENGINE=ON
CMAKE_ARGS+=	-DWITH_INNOBASE_STORAGE_ENGINE=ON
CMAKE_ARGS+=	-DWITH_PARTITION_STORAGE_ENGINE=ON
CMAKE_ARGS+=	-DWITH_PERFSCHEMA_STORAGE_ENGINE=ON

# Ensure dtrace builds the correct ABI
.if ${ABI:U} == "32"
CMAKE_ARGS+=	-DDTRACE_FLAGS="-32"
.elif ${ABI:U} == "64"
CMAKE_ARGS+=	-DDTRACE_FLAGS="-64"
.endif

CPPFLAGS+=	-Dunix
CFLAGS+=	-DUSE_OLD_FUNCTIONS # 3.23.x compat

CFLAGS+=	-fPIC -DPIC
CXXFLAGS+=	-fPIC -DPIC

# Galera
CPPFLAGS.SunOS+=	-DHAVE_SYS_BYTEORDER_H
CMAKE_ARGS.SunOS+=	-DFORCE_UNSUPPORTED_COMPILER=YES

# force HAVE_CURSES_H on Solaris since the configure script is broken
# and does not properly detect this, breaking the build later on.  Also
# explicitly disable epoll support as it is Linux-specific.
.if ${OPSYS} == "SunOS"
CMAKE_ARGS+=	-DHAVE_SYS_EPOLL_H=NO
CFLAGS+=	-DHAVE_CURSES_H
CXXFLAGS+=	-DHAVE_CURSES_H
.endif

.include "../../mk/pthread.buildlink3.mk"

.if defined(PTHREAD_TYPE) && (${PTHREAD_TYPE} == "pth")
CFLAGS+=	-DSIGNALS_DONT_BREAK_READ
CXXFLAGS+=	-DSIGNALS_DONT_BREAK_READ
.endif

LDFLAGS+=	${COMPILER_RPATH_FLAG}${PREFIX}/lib/mysql

PTHREAD_OPTS+=	require

PKG_GROUPS=	${MYSQL_GROUP}
PKG_USERS=	${MYSQL_USER}:${MYSQL_GROUP}

PKG_GECOS.${MYSQL_USER}=	MySQL database administrator
PKG_HOME.${MYSQL_USER}=		${MYSQL_DATADIR}
PKG_SHELL.${MYSQL_USER}=	${SH}

RCD_SCRIPTS=	mysqld
SMF_NAME=	percona
SMF_METHODS=	${RCD_SCRIPTS}

FILES_SUBST+=	HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=	MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=	MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
MESSAGE_SUBST+=	MYSQL_DATADIR=${MYSQL_DATADIR}
MESSAGE_SUBST+=	MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
BUILD_DEFS+=	MYSQL_DATADIR

CONF_FILES=	${PREFIX}/share/mysql/my-joyent.cnf \
		${PKG_SYSCONFDIR}/my.cnf

REPLACE_BASH=	scripts/wsrep_sst_mysqldump.sh
REPLACE_BASH+=	scripts/wsrep_sst_rsync.sh
REPLACE_BASH+=	scripts/wsrep_sst_xtrabackup-v2.sh

REPLACE_PERL=	mysql-test/lib/v1/mysql-test-run.pl
REPLACE_PERL+=	mysql-test/mysql-stress-test.pl
REPLACE_PERL+=	mysql-test/mysql-test-run.pl
REPLACE_PERL+=	mysql-test/suite/engines/rr_trx/run_stress_tx_rr.pl
REPLACE_PERL+=	mysql-test/suite/funcs_1/lib/DataGen_local.pl
REPLACE_PERL+=	mysql-test/suite/funcs_1/lib/DataGen_modify.pl
REPLACE_PERL+=	mysql-test/suite/funcs_2/lib/gen_charset_utf8.pl
REPLACE_PERL+=	scripts/mysqld_multi.sh
REPLACE_PERL+=	scripts/mysqldumpslow.sh

REPLACE_PYTHON=	scripts/pyclustercheck

SUBST_CLASSES+=		scr
SUBST_STAGE.scr=	pre-configure
SUBST_FILES.scr=	scripts/mysqld_safe.sh \
			support-files/mysql.server.sh
SUBST_SED.scr=		-e "s,chown,${CHOWN},g"
SUBST_SED.scr+=		-e "s,/bin/sh,${RCD_SCRIPTS_SHELL},g"
SUBST_MESSAGE.scr=	Fixing scripts.

SUBST_CLASSES+=		fixpaths
SUBST_STAGE.fixpaths=	post-install
SUBST_FILES.fixpaths=	${DESTDIR}${PREFIX}/share/doc/mysql/INFO_BIN
SUBST_SED.fixpaths=	-e "s,${WRAPPER_BINDIR}/gcc,${CCPATH},g"
SUBST_SED.fixpaths+=	-e "s,${WRAPPER_BINDIR}/g++,${CXXPATH},g"

MAKE_ENV+=		LIBPATH=${BUILDLINK_PREFIX.openssl}/lib
MAKE_ENV+=		RPATH=${BUILDLINK_PREFIX.openssl}/lib

#
# Hacks to get galera to use libboost_program_options.a while avoiding buildlink
# which would cause conflicts between bundled and pkgsrc boost.
#
BUILD_DEPENDS+=		boost-libs>0:../../devel/boost-libs
GALERA_SCONS_ARGS+=	bpostatic=${WRKDIR}/libboost_program_options.a
GALERA_SCONS_ARGS+=	${_MAKE_JOBS}
GALERA_SCONS_ENV+=	${MAKE_ENV}
GALERA_SCONS_ENV+=	CPPFLAGS=-I${WRKDIR}/${BOOST}
GALERA_SCONS_ENV+=	LIBPATH=${BUILDLINK_PREFIX.openssl}/lib
GALERA_SCONS_ENV+=	RPATH=${BUILDLINK_PREFIX.openssl}/lib

post-build:
	${CP} ${LOCALBASE}/lib/libboost_program_options.a ${WRKDIR}
	${RUN} cd ${WRKSRC}/percona-xtradb-cluster-galera && \
		revno=`cat GALERA-REVISION` && \
		${SETENV} ${GALERA_SCONS_ENV} revno=$$revno ${SCONSBIN} \
		    ${GALERA_SCONS_ARGS} psi=1 libgalera_smm.so && \
		${SETENV} ${GALERA_SCONS_ENV} revno=$$revno ${SCONSBIN} \
		    ${GALERA_SCONS_ARGS} garb/garbd
	${SED} ${FILES_SUBST_SED} ${FILESDIR}/my-joyent.cnf.sh \
	    > ${WRKSRC}/my-joyent.cnf

# Replace manual pages which only include other ones with a symbolic link
# if manual compression is activated. The manual pages won't work otherwise.
post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/xinetd.d
	${INSTALL_LIB} ${WRKSRC}/percona-xtradb-cluster-galera/libgalera_smm.so ${DESTDIR}${PREFIX}/lib/mysql/plugin/
	${INSTALL_PROGRAM} ${WRKSRC}/percona-xtradb-cluster-galera/garb/garbd ${DESTDIR}${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/percona-xtradb-cluster-galera/man/garbd.8 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man8/
	${INSTALL_DATA} ${WRKSRC}/my-joyent.cnf ${DESTDIR}${PREFIX}/share/mysql/my-joyent.cnf

.include "../../archivers/lz4/buildlink3.mk"
.include "../../devel/check/buildlink3.mk"
.include "../../devel/libevent/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
