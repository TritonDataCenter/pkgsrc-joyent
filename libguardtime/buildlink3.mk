# $NetBSD: buildlink3.mk,v 1.1 2013/07/03 13:33:50 jperkin Exp $

BUILDLINK_TREE+=	libguardtime

.if !defined(LIBGUARDTIME_BUILDLINK3_MK)
LIBGUARDTIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libguardtime+=	libguardtime>=0.3.11
BUILDLINK_ABI_DEPENDS.libguardtime+=	libguardtime>=0.3.11
BUILDLINK_PKGSRCDIR.libguardtime?=	../../joyent/libguardtime

.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.endif

BUILDLINK_TREE+=	-libguardtime
