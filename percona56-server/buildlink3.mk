# $NetBSD: buildlink3.mk,v 1.1 2013/02/13 21:00:10 adam Exp $

BUILDLINK_TREE+=	percona-server

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-server+=	percona-server>=5.6.10<5.7
BUILDLINK_ABI_DEPENDS.percona-server?=	percona-server>=5.6.10
BUILDLINK_PKGSRCDIR.percona-server?=	../../joyent/percona56-server
BUILDLINK_LIBDIRS.percona-server?=	lib

.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-server
