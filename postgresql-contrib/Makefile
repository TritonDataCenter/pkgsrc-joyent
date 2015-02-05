# $NetBSD$

PKGNAME=	${DISTNAME:C/postgresql/postgresql${PGSQL_VERSION}-contrib/}
COMMENT=	Contrib subtree of tools and plug-ins

.include "../../mk/pgsql.buildlink3.mk"
.include "${PGPKGSRCDIR:S/-client//}/Makefile.common"

# Override the default from bsd.prefs.mk
PATCHDIR=	${.CURDIR}/${PGPKGSRCDIR:S/-client//}/patches

DEPENDS+=	${PGSQL_TYPE:S/client/server/}>=${PKGVERSION_NOREV}:${PGPKGSRCDIR:S/client/server/}

BUILD_MAKE_FLAGS=	PGXS=1

CONTRIB_DIRS=	btree_gin btree_gist chkpass cube dict_int dict_xsyn		\
		earthdistance intagg oid2name pageinspect pg_freespacemap	\
		pg_trgm pgbench pgrowlocks seg spi sslinfo tablefunc		\
		test_parser tsearch2 vacuumlo xml2

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
CONTRIB_DIRS+=	pg_xlogdump postgres_fdw worker_spi
.endif
.if !empty(PGSQL_VERSION:M9[4-9])
CONTRIB_DIRS+=	pg_prewarm test_decoding test_shm_mq
.endif

.for dir in ${CONTRIB_DIRS}
BUILD_DIRS+=		contrib/${dir}
.endfor

BUILDLINK_INCDIRS.libxml2+=		include/libxml2
BUILDLINK_INCDIRS.${PGSQL_TYPE}+=	include/postgresql/server		\
					include/postgresql/server/libpq

PLIST_SRC=	PLIST.pg${PGSQL_VERSION}

.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_DEPMETHOD.libxml2=		build
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
