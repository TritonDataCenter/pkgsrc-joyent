# $NetBSD$

BUILDLINK_TREE+=	libcxx6

.if !defined(LIBCXX6_BUILDLINK3_MK)
LIBCXX6_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libcxx6+=	libcxx6>=${LLVM_VERSION}
BUILDLINK_PKGSRCDIR.libcxx6?=	../../joyent/libcxx6

.include "../../joyent/llvm6/buildlink3.mk"
.endif	# LIBCXX6_BUILDLINK3_MK

BUILDLINK_TREE+=	-libcxx6
