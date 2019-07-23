# $NetBSD$

BUILDLINK_TREE+=	percona-server

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-server+=	percona-server>=8.0<8.1
BUILDLINK_ABI_DEPENDS.percona-server?=	percona-server>=8.0<8.1
BUILDLINK_PKGSRCDIR.percona-server?=	../../joyent/percona80-server
BUILDLINK_LIBDIRS.percona-server?=	lib

.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-server
