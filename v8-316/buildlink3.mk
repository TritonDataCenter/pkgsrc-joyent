# $NetBSD$

BUILDLINK_TREE+=	v8

.if !defined(V8_BUILDLINK3_MK)
V8_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.v8+=	v8>=3.16.0<3.17
BUILDLINK_ABI_DEPENDS.v8+=	v8>=3.16.0<3.17
BUILDLINK_PKGSRCDIR.v8?=	../../joyent/v8-316

.include "../../mk/readline.buildlink3.mk"
.endif

BUILDLINK_TREE+=	-v8
