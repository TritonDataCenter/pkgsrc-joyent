# $NetBSD$

BUILDLINK_TREE+=	openjdk16

.if !defined(OPENJDK16_BUILDLINK3_MK)
OPENJDK16_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk16+=	java/openjdk16/lib
BUILDLINK_LIBDIRS.openjdk16+=	java/openjdk16/lib/server

BUILDLINK_API_DEPENDS.openjdk16+=	openjdk16>=0
BUILDLINK_PKGSRCDIR.openjdk16?=		../../joyent/openjdk16

.endif	# OPENJDK16_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk16
