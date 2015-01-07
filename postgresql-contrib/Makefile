# $NetBSD$

PKGNAME=	${DISTNAME:C/postgresql/postgresql${PGSQL_VERSION}-contrib/}
COMMENT=	Contrib subtree of tools and plug-ins

.include "../../mk/pgsql.buildlink3.mk"
.include "${PGPKGSRCDIR:S/-client//}/Makefile.common"

DEPENDS+=	${PGSQL_TYPE:S/client/server/}>=${PKGVERSION_NOREV}:${PGPKGSRCDIR:S/client/server/}

BUILD_MAKE_FLAGS=	PGXS=1

CONTRIB_DIRS=	btree_gin chkpass cube dict_int dict_xsyn earthdistance intagg	\
		oid2name pageinspect pg_freespacemap pg_trgm pgbench pgrowlocks	\
		seg sslinfo tablefunc test_parser tsearch2 vacuumlo xml2

.if !empty(PGSQL_VERSION:M9[0-9])
CONTRIB_DIRS+=	passwordcheck
.endif
.if !empty(PGSQL_VERSION:M9[1-9])
CONTRIB_DIRS+=	auth_delay dummy_seclabel file_fdw pg_test_fsync
.endif
.if !empty(PGSQL_VERSION:M9[2-9])
CONTRIB_DIRS+=	tcn
.endif
.if !empty(PGSQL_VERSION:M9[3-9])
CONTRIB_DIRS+=	pg_xlogdump worker_spi
.endif

.for dir in ${CONTRIB_DIRS}
BUILD_DIRS+=		contrib/${dir}
.endfor

BUILDLINK_INCDIRS.libxml2+=		include/libxml2
BUILDLINK_INCDIRS.${PGSQL_TYPE}+=	include/postgresql/server		\
					include/postgresql/server/libpq

PLIST_SRC=	PLIST.pg${PGSQL_VERSION}

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
