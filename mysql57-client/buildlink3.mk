# $NetBSD: buildlink3.mk,v 1.3 2016/03/05 11:27:43 jperkin Exp $

BUILDLINK_TREE+=	mysql-client

.if !defined(MYSQL_CLIENT_BUILDLINK3_MK)
MYSQL_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mysql-client+=	mysql-client>=5.7.12
BUILDLINK_ABI_DEPENDS.mysql-client+=	mysql-client>=5.7.12
BUILDLINK_PKGSRCDIR.mysql-client?=	../../joyent/mysql57-client
BUILDLINK_INCDIRS.mysql-client?=	include/mysql
BUILDLINK_LIBDIRS.mysql-client?=	lib

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # MYSQL_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-mysql-client
