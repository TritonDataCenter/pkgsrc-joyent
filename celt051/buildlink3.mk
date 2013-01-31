# $NetBSD: buildlink3.mk,v 1.3 2012/08/14 07:02:09 wiz Exp $

BUILDLINK_TREE+=	celt051

.if !defined(CELT051_BUILDLINK3_MK)
CELT051_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.celt051+=	celt051>=0.5.1.3
BUILDLINK_PKGSRCDIR.celt051?=	../../joyent/celt051
pkgbase:= celt051
.  include "../../mk/pkg-build-options.mk"

.endif # CELT051_BUILDLINK3_MK

BUILDLINK_TREE+=	-celt051
