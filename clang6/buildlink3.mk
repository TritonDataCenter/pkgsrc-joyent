# $NetBSD: buildlink3.mk,v 1.7 2017/07/11 19:47:37 adam Exp $

BUILDLINK_TREE+=	clang6

.if !defined(CLANG6_BUILDLINK3_MK)
CLANG6_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.clang6+=	clang6>=${LLVM_VERSION}
BUILDLINK_PKGSRCDIR.clang6?=	../../joyent/clang6

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../joyent/llvm6/buildlink3.mk"
.endif	# CLANG6_BUILDLINK3_MK

BUILDLINK_TREE+=	-clang6
