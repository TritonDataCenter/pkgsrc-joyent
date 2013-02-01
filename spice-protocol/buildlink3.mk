# $NetBSD: buildlink3.mk,v 1.3 2012/08/14 07:02:09 wiz Exp $

BUILDLINK_TREE+=	spice-protocol

.if !defined(SPICE_PROTOCOL_BUILDLINK3_MK)
SPICE_PROTOCOL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.spice-protocol+=	spice-protocol>=0.12
BUILDLINK_PKGSRCDIR.spice-protocol?=	../../joyent/spice-protocol
pkgbase:= spice-protocol
.  include "../../mk/pkg-build-options.mk"

.endif # SPICE_PROTOCOL_BUILDLINK3_MK

BUILDLINK_TREE+=	-spice-protocol
