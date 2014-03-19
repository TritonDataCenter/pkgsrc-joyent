# $NetBSD$

BUILDLINK_TREE+=	mysql73-cluster

.if !defined(MYSQL73_CLUSTER_BUILDLINK3_MK)
MYSQL73_CLUSTER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mysql73-cluster+=	mysql73-cluster>=7.3.4
BUILDLINK_PKGSRCDIR.mysql73-cluster?=	../../joyent/mysql73-cluster
BUILDLINK_LIBDIRS.mysql73-cluster?=	lib

.endif	# MYSQL73_CLUSTER_BUILDLINK3_MK

BUILDLINK_TREE+=	-mysql73-cluster
