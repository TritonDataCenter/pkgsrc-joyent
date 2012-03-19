# $NetBSD$

BUILDLINK_TREE+=	instantclient

.if !defined(INSTANTCLIENT_BUILDLINK3_MK)
INSTANTCLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.instantclient+=	instantclient>=11.2.0.2.0
BUILDLINK_PKGSRCDIR.instantclient?=	../../joyent/instantclient
BUILDLINK_LDFLAGS.instantclient+=	${COMPILER_RPATH_FLAG}${PREFIX}/oracle/${ORACLE_VERSION}/instantclient
BUILDLINK_LIBDIRS.instantclient+=	oracle/${ORACLE_VERSION}/instantclient
ORACLE_VERSION=				11.2.0.2.0

.endif	# INSTANTCLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-instantclient
