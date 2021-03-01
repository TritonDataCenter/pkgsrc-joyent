# $NetBSD$

BUILDLINK_TREE+=	openjdk13

.if !defined(OPENJDK13_BUILDLINK3_MK)
OPENJDK13_BUILDLINK3_MK:=

BUILDLINK_LIBDIRS.openjdk13+=	java/openjdk13/lib
BUILDLINK_LIBDIRS.openjdk13+=	java/openjdk13/lib/server

BUILDLINK_API_DEPENDS.openjdk13+=	openjdk13>=0
BUILDLINK_PKGSRCDIR.openjdk13?=		../../joyent/openjdk13

.endif	# OPENJDK13_BUILDLINK3_MK

BUILDLINK_TREE+=	-openjdk13
