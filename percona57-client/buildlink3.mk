# $NetBSD$

BUILDLINK_TREE+=	percona-client

.if !defined(PERCONA_CLIENT_BUILDLINK3_MK)
PERCONA_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-client+=	percona-client>=5.7.13<5.8
BUILDLINK_ABI_DEPENDS.percona-client+=	percona-client>=5.7.13
BUILDLINK_PKGSRCDIR.percona-client?=	../../joyent/percona57-client
BUILDLINK_INCDIRS.percona-client+=	include/mysql
BUILDLINK_LIBDIRS.percona-client+=	lib

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # PERCONA_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-client
