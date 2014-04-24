# $NetBSD$

BUILDLINK_TREE+=	percona-cluster

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-cluster+=	percona-cluster>=5.6.15
BUILDLINK_PKGSRCDIR.percona-cluster?=	../../joyent/percona56-cluster
BUILDLINK_LIBDIRS.percona-cluster?=	lib

.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-cluster
