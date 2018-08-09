# $NetBSD: buildlink3.mk,v 1.5 2017/07/11 19:47:37 adam Exp $

BUILDLINK_TREE+=	llvm6

.if !defined(LLVM6_BUILDLINK3_MK)
LLVM6_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.llvm6+=	llvm6>=${LLVM_VERSION}
BUILDLINK_PKGSRCDIR.llvm6?=	../../joyent/llvm6

LLVM_CONFIG_PATH?=		${BUILDLINK_PREFIX.llvm6}/llvm6/bin/llvm-config
LLVM_VERSION?=			6.0.1

pkgbase := llvm6
.include "../../mk/pkg-build-options.mk"
.  if !empty(PKG_BUILD_OPTIONS.llvm6:Mterminfo)
.include "../../mk/terminfo.buildlink3.mk"
.  endif

.include "../../devel/zlib/buildlink3.mk"
.endif	# LLVM6_BUILDLINK3_MK

BUILDLINK_TREE+=	-llvm6
