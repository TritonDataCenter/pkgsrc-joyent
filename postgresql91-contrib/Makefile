# $NetBSD$

PKGNAME=	${DISTNAME:C/-/91-contrib-/}
COMMENT=	Contrib subtree of tools and plug-ins

DEPENDS+=	postgresql91-server>=${PKGVERSION_NOREV}:../../databases/postgresql91-server

.include "../../databases/postgresql91/Makefile.common"

BUILD_MAKE_FLAGS=	PGXS=1

CONTRIB_DIRS=	auth_delay btree_gin btree_gist chkpass cube dict_int	\
		dict_xsyn dummy_seclabel earthdistance file_fdw intagg	\
		oid2name pageinspect passwordcheck pg_freespacemap	\
		pg_test_fsync pg_trgm pgrowlocks seg sslinfo tablefunc	\
		test_parser vacuumlo xml2

.for dir in ${CONTRIB_DIRS}
BUILD_DIRS+=		contrib/${dir}
.endfor

.include "../../databases/postgresql91-client/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
