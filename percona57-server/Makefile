# $NetBSD$

PKGNAME=	${DISTNAME:tl:C/-${SILLYREV}//}
COMMENT=	Percona Server, a MySQL server fork (server)

CONFLICTS=	mysql-server-[0-9]*

.include "../../joyent/percona57-client/Makefile.common"

INFO_FILES=		yes
CMAKE_ARGS+=		-DINSTALL_INFODIR=${PKGINFODIR}

# Regression due to code overhaul in 5.7, new solution needed for:
# https://bugs.mysql.com/bug.php?id=18246
#
# CMAKE_ARGS+=		-DWITH_LIBWRAP=ON

.if !empty(PKG_OPTIONS:Membedded-server)
CMAKE_ARGS+=			-DWITH_EMBEDDED_SERVER=ON
PLIST.embedded=			yes
.else
CMAKE_ARGS+=			-DWITH_EMBEDDED_SERVER=OFF
# We only need readline to placate the configure script if we don't build
# the embedded server as it is the only binary linked against "readline".
BUILDLINK_DEPMETHOD.editline=	build
BUILDLINK_DEPMETHOD.readline=	build
.endif

PLIST_VARS+=		embedded ndb auth_socket

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
SMF_NAME=		percona
SMF_METHODS=		${RCD_SCRIPTS}

FILES_SUBST+=		HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
MESSAGE_SUBST+=		MYSQL_DATADIR=${MYSQL_DATADIR}
MESSAGE_SUBST+=		MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
BUILD_DEFS+=		MYSQL_DATADIR

SUBST_CLASSES+=		fixpaths
SUBST_STAGE.fixpaths=	post-install
SUBST_FILES.fixpaths=	${DESTDIR}${PREFIX}/share/doc/mysql/INFO_BIN
SUBST_SED.fixpaths=	-e "s,${WRAPPER_BINDIR}/gcc,${CCPATH},g"
SUBST_SED.fixpaths+=	-e "s,${WRAPPER_BINDIR}/g++,${CXXPATH},g"

CNFSUBST=		-e 's,@MYSQL_DATADIR@,${MYSQL_DATADIR},g'
CNFSUBST+=		-e 's,@PREFIX@,${PREFIX},g'
CNFSUBST+=		-e 's,@VARBASE@,${VARBASE},g'

CONF_FILES=		${PREFIX}/share/mysql/my-joyent.cnf \
			${PKG_SYSCONFDIR}/my.cnf

REPLACE_PERL+=		mysql-test/lib/v1/mysql-test-run.pl
REPLACE_PERL+=		mysql-test/mysql-stress-test.pl
REPLACE_PERL+=		mysql-test/mysql-test-run.pl
REPLACE_PERL+=		mysql-test/suite/engines/rr_trx/run_stress_tx_rr.pl
REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_local.pl
REPLACE_PERL+=		mysql-test/suite/funcs_1/lib/DataGen_modify.pl
REPLACE_PERL+=		mysql-test/suite/funcs_2/lib/gen_charset_utf8.pl
REPLACE_PERL+=		mysql-test/suite/rpl/extension/bhs.pl
REPLACE_PERL+=		mysql-test/suite/rpl/extension/checksum.pl

CHECK_INTERPRETER_SKIP+=	share/mysql/test/suite/opt_trace/validate_json.py
CHECK_INTERPRETER_SKIP+=	share/mysql/test/suite/tokudb/*

INSTALLATION_DIRS+=	bin

.include "../../mk/compiler.mk"

.if !empty(PKGSRC_COMPILER:Msunpro)
CFLAGS+=		-D_POSIX_C_SOURCE=199506L -D__EXTENSIONS__
CXXFLAGS+=		-D_POSIX_C_SOURCE=199506L -D__EXTENSIONS__
.endif

post-install:
	${SED} ${CNFSUBST} < ${FILESDIR}/my-joyent.cnf.sh \
	    > ${DESTDIR}${PREFIX}/share/mysql/my-joyent.cnf


BUILDLINK_AUTO_DIRS.percona-client=	no
.include "../../joyent/percona57-client/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
