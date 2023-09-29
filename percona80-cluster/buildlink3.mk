# $NetBSD$

BUILDLINK_TREE+=	percona-cluster

.if !defined(PERCONA_CLUSTER_BUILDLINK3_MK)
PERCONA_CLUSTER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-cluster+=	percona-cluster>=8.0
BUILDLINK_ABI_DEPENDS.percona-cluster+=	percona-cluster>=8.0
BUILDLINK_PKGSRCDIR.percona-cluster?=	../../joyent/percona80-cluster
BUILDLINK_LIBDIRS.percona-cluster?=	lib

.include "../../security/openssl/buildlink3.mk"
.endif	# PERCONA_CLUSTER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-cluster
