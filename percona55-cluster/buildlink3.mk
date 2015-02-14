# $NetBSD: buildlink3.mk,v 1.3 2012/10/03 12:49:12 fhajny Exp $

BUILDLINK_TREE+=	percona-cluster

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-cluster+=	percona-cluster>=5.5.28<5.6
BUILDLINK_ABI_DEPENDS.percona-cluster+=	percona-cluster>=5.5.28
BUILDLINK_PKGSRCDIR.percona-cluster?=	../../joyent/percona55-cluster
BUILDLINK_LIBDIRS.percona-cluster?=	lib

.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-cluster
