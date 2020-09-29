# $NetBSD$

BUILDLINK_TREE+=	libutempter

.if !defined(LIBUTEMPTER_BUILDLINK3_MK)
LIBUTEMPTER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libutempter+=	libutempter>=1.0
BUILDLINK_PKGSRCDIR.libutempter?=	../../joyent/libutempter
.endif

BUILDLINK_TREE+=	-libutempter
