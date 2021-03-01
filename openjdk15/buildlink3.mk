# $NetBSD$

BUILDLINK_TREE+=	openjdk15

.if !defined(OPENJDK15_BUILDLINK3_MK)
OPENJDK15_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk15+=	java/openjdk15/lib
BUILDLINK_LIBDIRS.openjdk15+=	java/openjdk15/lib/server

BUILDLINK_API_DEPENDS.openjdk15+=	openjdk15>=0
BUILDLINK_PKGSRCDIR.openjdk15?=		../../joyent/openjdk15

.endif	# OPENJDK15_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk15
