# $NetBSD$

BUILDLINK_TREE+=	percona-server

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-server+=	percona-server>=5.7.12<5.8
BUILDLINK_ABI_DEPENDS.percona-server+=	percona-server>=5.7.12
BUILDLINK_PKGSRCDIR.percona-server?=	../../joyent/percona57-server
BUILDLINK_LIBDIRS.percona-server+=	lib

.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-server
