# $NetBSD$

BUILDLINK_TREE+=	mariadb-server

.if !defined(MARIADB_SERVER_BUILDLINK3_MK)
MARIADB_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mariadb-server+=	mariadb-server>=10.0.11
BUILDLINK_ABI_DEPENDS.mariadb-server?=	mariadb-server>=10.0.11
BUILDLINK_PKGSRCDIR.mariadb-server?=	../../joyent/mariadb10-server
BUILDLINK_LIBDIRS.mariadb-server?=	lib

.endif	# MARIADB_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-mariadb-server
