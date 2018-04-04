# $NetBSD$

BUILDLINK_TREE+=	compiler-rt6

.if !defined(COMPILER_RT6_BUILDLINK3_MK)
COMPILER_RT6_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.compiler-rt6+=	compiler-rt6>=${LLVM_VERSION}
BUILDLINK_PKGSRCDIR.compiler-rt6?=	../../joyent/compiler-rt6

.include "../../joyent/llvm6/buildlink3.mk"
.endif	# COMPILER_RT6_BUILDLINK3_MK

BUILDLINK_TREE+=	-compiler-rt6
