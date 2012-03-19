# $NetBSD: buildlink3.mk,v 1.15 2006/07/08 23:10:51 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LFI_BUILDLINK3_MK:=	${LFI_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	freeimage
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfreeimage}
BUILDLINK_PACKAGES+=	freeimage
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}freeimage

.if !empty(LFI_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.freeimage+=		freeimage>=3.11.0
BUILDLINK_ABI_DEPENDS.freeimage+=	freeimage>=3.11.0
BUILDLINK_PKGSRCDIR.freeimage?=	../../joyent/freeimage
.endif	# LFI_BUILDLINK3_MK

.include "../../mk/pthread.buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
