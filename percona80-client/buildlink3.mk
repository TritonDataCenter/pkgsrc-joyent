# $NetBSD$

BUILDLINK_TREE+=	percona-client

.if !defined(PERCONA_CLIENT_BUILDLINK3_MK)
PERCONA_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-client+=	percona-client>=8.0<8.1
BUILDLINK_ABI_DEPENDS.percona-client+=	percona-client>=8.0<8.1
BUILDLINK_PKGSRCDIR.percona-client?=	../../joyent/percona80-client
BUILDLINK_INCDIRS.percona-client?=	include/mysql
BUILDLINK_LIBDIRS.percona-client?=	lib

.include "../../devel/libevent/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # PERCONA_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-client
