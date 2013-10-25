# $NetBSD$

BUILDLINK_TREE+=	leptonica

.if !defined(LEPTONICA_BUILDLINK3_MK)
LEPTONICA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.leptonica+=	leptonica>=1.69
BUILDLINK_ABI_DEPENDS.leptonica+=	leptonica>=1.69
BUILDLINK_PKGSRCDIR.leptonica?=		../../joyent/leptonica

.endif # LEPTONICA_BUILDLINK3_MK

BUILDLINK_TREE+=	-leptonica
