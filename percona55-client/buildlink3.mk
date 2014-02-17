# $NetBSD$

BUILDLINK_TREE+=	percona-client

.if !defined(PERCONA_CLIENT_BUILDLINK3_MK)
PERCONA_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-client+=	percona-client>=5.5.28<5.6
BUILDLINK_ABI_DEPENDS.percona-client+=	percona-client>=5.5.28
BUILDLINK_PKGSRCDIR.percona-client?=	../../joyent/percona55-client
BUILDLINK_INCDIRS.percona-client?=	include/mysql
BUILDLINK_LIBDIRS.percona-client?=	lib

.endif # PERCONA_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-client
