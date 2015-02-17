# $NetBSD: buildlink3.mk,v 1.1 2013/02/13 21:00:02 adam Exp $

BUILDLINK_TREE+=	percona-client

.if !defined(PERCONA_CLIENT_BUILDLINK3_MK)
PERCONA_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.percona-client+=	percona-client>=5.6.10<5.7
BUILDLINK_ABI_DEPENDS.percona-client+=	percona-client>=5.6.10
BUILDLINK_PKGSRCDIR.percona-client?=	../../joyent/percona56-client
BUILDLINK_INCDIRS.percona-client?=	include/mysql
BUILDLINK_LIBDIRS.percona-client?=	lib

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # PERCONA_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-percona-client
