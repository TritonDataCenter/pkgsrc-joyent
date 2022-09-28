# $NetBSD$

BUILDLINK_TREE+=	openjdk17

.if !defined(OPENJDK17_BUILDLINK3_MK)
OPENJDK17_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk17+=	java/openjdk17/lib
BUILDLINK_LIBDIRS.openjdk17+=	java/openjdk17/lib/server

BUILDLINK_API_DEPENDS.openjdk17+=	openjdk17>=0
BUILDLINK_PKGSRCDIR.openjdk17?=		../../joyent/openjdk17

.endif	# OPENJDK17_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk17
