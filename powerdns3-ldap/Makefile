# $NetBSD: Makefile,v 1.13 2014/02/12 23:18:25 tron Exp $

.include "../../joyent/powerdns3/Makefile.backend"

PKGNAME=		${DISTNAME:S/pdns/powerdns-ldap/}
COMMENT=		LDAP backend module for PowerDNS

CONFIGURE_ARGS+=	--with-dynmodules="ldap"

.include "../../databases/openldap-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
