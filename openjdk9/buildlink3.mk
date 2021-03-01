# $NetBSD$

BUILDLINK_TREE+=	openjdk9

.if !defined(OPENJDK9_BUILDLINK3_MK)
OPENJDK9_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk9+=	java/openjdk9/lib
BUILDLINK_LIBDIRS.openjdk9+=	java/openjdk9/lib/jli
BUILDLINK_LIBDIRS.openjdk9+=	java/openjdk9/lib/server

BUILDLINK_API_DEPENDS.openjdk9+=	openjdk9>=0
BUILDLINK_PKGSRCDIR.openjdk9?=		../../joyent/openjdk9

.endif	# OPENJDK9_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk9
