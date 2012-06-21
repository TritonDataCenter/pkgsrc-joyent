# $NetBSD$

BUILDLINK_TREE+=	instantclient

.if !defined(INSTANTCLIENT_BUILDLINK3_MK)
INSTANTCLIENT_BUILDLINK3_MK:=

.include "version.mk"

BUILDLINK_API_DEPENDS.instantclient+=	instantclient>=${ORACLE_VERSION:S/_/./}.0.0.0
BUILDLINK_PKGSRCDIR.instantclient?=	../../joyent/instantclient
BUILDLINK_LDFLAGS.instantclient+=	${COMPILER_RPATH_FLAG}${PREFIX}/${ORACLE_IC_HOME}
BUILDLINK_LIBDIRS.instantclient+=	${ORACLE_IC_HOME}
.endif	# INSTANTCLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-instantclient
