# $NetBSD$

BUILDLINK_TREE+=	libcxxabi6

.if !defined(LIBCXXABI6_BUILDLINK3_MK)
LIBCXXABI6_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libcxxabi6+=	libcxxabi6>=${LLVM_VERSION}
BUILDLINK_PKGSRCDIR.libcxxabi6?=	../../joyent/libcxxabi6

.include "../../joyent/llvm6/buildlink3.mk"
.endif	# LIBCXXABI6_BUILDLINK3_MK

BUILDLINK_TREE+=	-libcxxabi6
