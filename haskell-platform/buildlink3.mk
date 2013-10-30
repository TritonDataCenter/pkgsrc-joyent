# $NetBSD$

BUILDLINK_TREE+=	haskell-platform

.if !defined(HASKELL_PLATFORM_BUILDLINK3_MK)
HASKELL_PLATFORM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.haskell-platform+=	haskell-platform>=2013.2.0.0
BUILDLINK_PKGSRCDIR.haskell-platform?=		../../joyent/haskell-platform

.include "../../wip/ghc/buildlink3.mk"

.endif	# HASKELL_PLATFORM_BUILDLINK3_MK

BUILDLINK_TREE+=	-haskell-platform
