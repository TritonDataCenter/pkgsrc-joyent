# $NetBSD$

BUILDLINK_TREE+=	gcc10

.if !defined(GCC10_BUILDLINK3_MK)
GCC10_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gcc10+=	gcc10>=10.4.0
BUILDLINK_ABI_DEPENDS.gcc10+=	gcc10>=10.4.0
BUILDLINK_PKGSRCDIR.gcc10=	../../joyent/gcc10
BUILDLINK_DEPMETHOD.gcc10?=	build

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_PREFIX.gcc10}/gcc10

BUILDLINK_FILES.gcc10=		# empty
BUILDLINK_AUTO_VARS.gcc10=	no

pkgbase := gcc10
.include "../../mk/pkg-build-options.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.endif

BUILDLINK_TREE+=	-gcc10
