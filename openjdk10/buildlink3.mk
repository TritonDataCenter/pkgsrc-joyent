# $NetBSD$

BUILDLINK_TREE+=	openjdk10

.if !defined(OPENJDK10_BUILDLINK3_MK)
OPENJDK10_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk10+=	java/openjdk10/lib
BUILDLINK_LIBDIRS.openjdk10+=	java/openjdk10/lib/jli
BUILDLINK_LIBDIRS.openjdk10+=	java/openjdk10/lib/server

BUILDLINK_API_DEPENDS.openjdk10+=	openjdk10>=0
BUILDLINK_PKGSRCDIR.openjdk10?=		../../joyent/openjdk10

.endif	# OPENJDK10_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk10
