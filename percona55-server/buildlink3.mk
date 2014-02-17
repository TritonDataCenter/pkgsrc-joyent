# $NetBSD$

BUILDLINK_TREE+=	percona-server

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-server+=	percona-server>=5.5.28
BUILDLINK_PKGSRCDIR.percona-server?=	../../joyent/percona55-server
BUILDLINK_LIBDIRS.percona-server?=	lib

#.include "../../joyent/percona55-client/buildlink3.mk"
.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-server
