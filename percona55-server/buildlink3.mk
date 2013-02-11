# $NetBSD: buildlink3.mk,v 1.3 2012/10/03 12:49:12 fhajny Exp $

BUILDLINK_TREE+=	percona-server

.if !defined(PERCONA_SERVER_BUILDLINK3_MK)
PERCONA_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-server+=	percona-server>=5.5.28
BUILDLINK_PKGSRCDIR.percona-server?=	../../joyent/percona55-server
BUILDLINK_LIBDIRS.percona-server?=	lib

#.include "../../joyent/percona55-client/buildlink3.mk"
.endif	# PERCONA_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-server
