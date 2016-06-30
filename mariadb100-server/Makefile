# $NetBSD$

PKGNAME=	${DISTNAME:S/-/-server-/}
COMMENT=	MariaDB, a free SQL database (server)

CONFLICTS=	mysql-server-[0-9]*

.include "../../joyent/mariadb100-client/Makefile.common"

.if !empty(PKG_OPTIONS:Mtokudb)
PLIST_SRC+=		PLIST.tokudb
.endif

.if !empty(PKG_OPTIONS:Mmroonga)
PLIST_SRC+=		PLIST.mroonga
.endif

CMAKE_ARGS+=		-DWITH_EMBEDDED_SERVER=ON

#.if !empty(PKG_OPTIONS:Membedded-server)
#CMAKE_ARGS+=		-DWITH_EMBEDDED_SERVER=ON
#PLIST.embedded=		yes
#.else
#CMAKE_ARGS+=		-DWITH_EMBEDDED_SERVER=OFF
# We only need readline to placate the configure script if we don't build
# the embedded server as it is the only binary linked against "readline".
#BUILDLINK_DEPMETHOD.readline=	build
#.endif

#PLIST_VARS+=		embedded #auth_socket

#.if ${OPSYS} == "Linux"
#PLIST.auth_socket=	yes
#.endif

#PTHREAD_OPTS+=		require

MYSQL_USER?=		mysql
MYSQL_GROUP?=		mysql
MYSQL_PIDFILE?=		${MYSQL_DATADIR}/${HOST}.pid

PKG_USERS_VARS+=	MYSQL_USER
PKG_GROUPS_VARS+=	MYSQL_GROUP

PKG_GROUPS=		${MYSQL_GROUP}
PKG_USERS=		${MYSQL_USER}:${MYSQL_GROUP}

PKG_GECOS.${MYSQL_USER}=	MariaDB administrator
PKG_HOME.${MYSQL_USER}=		${MYSQL_DATADIR}
PKG_SHELL.${MYSQL_USER}=	${SH}

RCD_SCRIPTS=		mariadb
SMF_NAME=		mariadb
SMF_METHODS=		${RCD_SCRIPTS}

FILES_SUBST+=		HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
FILES_SUBST+=		MYSQL_PIDFILE=${MYSQL_PIDFILE}
MESSAGE_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
MESSAGE_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
BUILD_DEFS+=		MYSQL_DATADIR

REPLACE_PERL+=		scripts/*.sh
REPLACE_PERL+=		sql-bench/*.sh
REPLACE_PERL+=		*/*.pl */*/*.pl */*/*/*.pl */*/*/*/*.pl

REPLACE_SH+=		scripts/*.sh
REPLACE_SH+=		support-files/*.sh

#REPLACE_PERL+=		mysql-test/lib/v1/mysql-test-run.pl
#REPLACE_PERL+=		mysql-test/mysql-stress-test.pl
#REPLACE_PERL+=		mysql-test/mysql-test-run.pl
#REPLACE_PERL+=		mysql-test/std_data/checkDBI_DBD-mysql.pl
#REPLACE_PERL+=		mysql-test/suite/engines/rr_trx/run_stress_tx_rr.pl
#REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_local.pl
#REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_modify.pl
#REPLACE_PERL+=		mysql-test/suite/funcs_2/lib/gen_charset_utf8.pl
#REPLACE_PERL+=		mysql-test/suite/rpl/extension/bhs.pl
#REPLACE_PERL+=		mysql-test/suite/rpl/extension/checksum.pl

# For some reason has its own @PERL@ which doesn't get substituted.
SUBST_CLASSES+=		perl
SUBST_STAGE.perl=	pre-configure
SUBST_FILES.perl=	sql-bench/test-table-elimination.sh
SUBST_SED.perl=		-e 's,@PERL@,${PERL5},'

BUILDLINK_TRANSFORM+=	rm:-fuse-linker-plugin
BUILDLINK_TRANSFORM+=	rm:--version-script

# Clumsy workaround for error thrown for storage/tokudb/ft-index/ft/txn/txn.cc:345:5
CPPFLAGS+=		-Wno-missing-braces

CONF_FILES=		${PREFIX}/share/mysql/my-joyent.cnf \
			${PKG_SYSCONFDIR}/my.cnf

post-extract:
	# Needed for tokudb
	${CHMOD} +x ${WRKSRC}/storage/tokudb/PerconaFT/third_party/xz-4.999.9beta/build-aux/install-sh

post-install:
	${RM} -rf ${DESTDIR}${PKG_SYSCONFDIR}
	${RM} -f ${DESTDIR}${PREFIX}/sbin/rcmysql
	${SED} -e 's,@PREFIX@,${PREFIX:Q},g' \
	       -e 's,@MYSQL_DATADIR@,${MYSQL_DATADIR:Q},g' \
	       -e 's,@VARBASE@,${VARBASE:Q},g' ${FILESDIR}/my-joyent.cnf.sh \
	       > ${DESTDIR}${PREFIX}/share/mysql/my-joyent.cnf

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/libexecinfo/buildlink3.mk"
.include "../../devel/libjudy/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../joyent/mariadb100-client/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
