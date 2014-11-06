# $NetBSD: Makefile,v 1.1.1.1 2013/09/06 11:01:57 fhajny Exp $

.include "../../joyent/powerdns3/Makefile.backend"

PKGNAME=		${DISTNAME:S/pdns/powerdns-lua/}
COMMENT=		Lua backend module for PowerDNS

CONFIGURE_ARGS+=	--with-dynmodules="lua"

.include "../../lang/lua/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
