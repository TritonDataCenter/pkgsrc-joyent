# $NetBSD$

BUILDLINK_TREE+=	gcc9

.if !defined(GCC9_BUILDLINK3_MK)
GCC9_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gcc9+=	gcc9>=9.3.0
BUILDLINK_ABI_DEPENDS.gcc9+=	gcc9>=9.3.0
BUILDLINK_PKGSRCDIR.gcc9=	../../joyent/gcc9
BUILDLINK_DEPMETHOD.gcc9?=	build

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_PREFIX.gcc9}/gcc9

BUILDLINK_FILES.gcc9=		# empty
BUILDLINK_AUTO_VARS.gcc9=	no

pkgbase := gcc9
.include "../../mk/pkg-build-options.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.endif

BUILDLINK_TREE+=	-gcc9
