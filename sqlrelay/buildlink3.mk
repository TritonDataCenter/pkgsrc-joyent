# $NetBSD$

BUILDLINK_TREE+=	sqlrelay

.if !defined(SQLRELAY_BUILDLINK3_MK)
SQLRELAY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.sqlrelay+=	sqlrelay>=0.43
BUILDLINK_PKGSRCDIR.sqlrelay?=		../../joyent/sqlrelay

.include "../../devel/rudiments/buildlink3.mk"
.endif	# SQLRELAY_BUILDLINK3_MK

BUILDLINK_TREE+=	-sqlrelay
