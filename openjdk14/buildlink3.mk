# $NetBSD$

BUILDLINK_TREE+=	openjdk14

.if !defined(OPENJDK14_BUILDLINK3_MK)
OPENJDK14_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk14+=	java/openjdk14/lib
BUILDLINK_LIBDIRS.openjdk14+=	java/openjdk14/lib/server

BUILDLINK_API_DEPENDS.openjdk14+=	openjdk14>=0
BUILDLINK_PKGSRCDIR.openjdk14?=		../../joyent/openjdk14

.endif	# OPENJDK14_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk14
