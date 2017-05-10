# $NetBSD$

BUILDLINK_TREE+=	percona-cluster

.if !defined(PERCONA_CLUSTER_BUILDLINK3_MK)
PERCONA_CLUSTER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-cluster+=	percona-cluster>=5.7.15<5.8
BUILDLINK_ABI_DEPENDS.percona-cluster+=	percona-cluster>=5.7.15
BUILDLINK_PKGSRCDIR.percona-cluster?=	../../joyent/percona57-cluster
BUILDLINK_LIBDIRS.percona-cluster?=	lib

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif	# PERCONA_CLUSTER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-cluster
