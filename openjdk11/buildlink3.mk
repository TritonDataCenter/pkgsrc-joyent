# $NetBSD$

BUILDLINK_TREE+=	openjdk11

.if !defined(OPENJDK11_BUILDLINK3_MK)
OPENJDK11_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk11+=	java/openjdk11/lib
BUILDLINK_LIBDIRS.openjdk11+=	java/openjdk11/lib/jli
BUILDLINK_LIBDIRS.openjdk11+=	java/openjdk11/lib/server

BUILDLINK_API_DEPENDS.openjdk11+=	openjdk11>=0
BUILDLINK_PKGSRCDIR.openjdk11?=		../../joyent/openjdk11

.endif	# OPENJDK11_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk11
