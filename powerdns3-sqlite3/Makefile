# $NetBSD: Makefile,v 1.1.1.1 2013/09/06 11:01:57 fhajny Exp $

.include "../../joyent/powerdns3/Makefile.backend"

PKGNAME=		${DISTNAME:S/pdns/powerdns-sqlite3/}
COMMENT=		SQLite version 3 backend module for PowerDNS

CONFIGURE_ARGS+=	--with-dynmodules="gsqlite3"

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
