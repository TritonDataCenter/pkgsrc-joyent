# $NetBSD$

BUILDLINK_TREE+=	openjdk12

.if !defined(OPENJDK12_BUILDLINK3_MK)
OPENJDK12_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk12+=	java/openjdk12/lib
BUILDLINK_LIBDIRS.openjdk12+=	java/openjdk12/lib/server

BUILDLINK_API_DEPENDS.openjdk12+=	openjdk12>=0
BUILDLINK_PKGSRCDIR.openjdk12?=		../../joyent/openjdk12

.endif	# OPENJDK12_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk12
