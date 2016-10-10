# $NetBSD$

PKGNAME=	${DISTNAME:C/postgresql/postgresql${PGSQL_VERSION}-contrib/}
COMMENT=	Contrib subtree of tools and plug-ins

.include "../../mk/pgsql.buildlink3.mk"
.include "${PGPKGSRCDIR:S/-client//}/Makefile.common"

# Override the default from bsd.prefs.mk
PATCHDIR=	${.CURDIR}/${PGPKGSRCDIR:S/-client//}/patches

DEPENDS+=	${PGSQL_TYPE:S/client/server/}>=${PKGVERSION_NOREV}:${PGPKGSRCDIR:S/client/server/}

BUILD_MAKE_FLAGS=	USE_PGXS=1

CONTRIB_DIRS=	btree_gin chkpass cube dict_int dict_xsyn			\
		earthdistance intagg oid2name pageinspect pg_freespacemap	\
		pg_trgm pgrowlocks seg spi sslinfo tablefunc			\
		tsearch2 vacuumlo

.if !empty(PGSQL_VERSION:M84)
CONTRIB_DIRS+=	btree_gist
.endif
.if !empty(PGSQL_VERSION:M9[0-9])
CONTRIB_DIRS+=	passwordcheck
.endif
.if !empty(PGSQL_VERSION:M9[1-9])
CONTRIB_DIRS+=	auth_delay file_fdw
.endif
.if !empty(PGSQL_VERSION:M9[2-9])
CONTRIB_DIRS+=	tcn
.endif
.if !empty(PGSQL_VERSION:M9[3-9])
CONTRIB_DIRS+=	postgres_fdw
.endif
.if !empty(PGSQL_VERSION:M9[4-9])
CONTRIB_DIRS+=	pg_prewarm test_decoding
.endif
.if !empty(PGSQL_VERSION:M94)
CONTRIB_DIRS+=	test_shm_mq
.endif
.if empty(PGSQL_VERSION:M95)
CONTRIB_DIRS+=	test_parser
.endif

.for dir in ${CONTRIB_DIRS}
BUILD_DIRS+=		contrib/${dir}
.endfor

BUILDLINK_INCDIRS.libxml2+=		include/libxml2
BUILDLINK_INCDIRS.${PGSQL_TYPE}+=	include/postgresql/server		\
					include/postgresql/server/libpq

PLIST_SRC=	PLIST.pg${PGSQL_VERSION}

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
