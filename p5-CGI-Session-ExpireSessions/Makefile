# $NetBSD: Makefile,v 1.10 2008/07/18 09:43:35 rhaen Exp $

DISTNAME=		CGI-Session-ExpireSessions-1.09
PKGNAME=		p5-${DISTNAME}
SVR4_PKGNAME=		p5sesexp
CATEGORIES=		www perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=CGI/}
EXTRACT_SUFX=		.tgz

MAINTAINER=		pkgsrc-users@NetBSD.org
COMMENT=		Perl5 module providing db-based and file-based session expiration requests

PKG_DESTDIR_SUPPORT=	user-destdir
PKG_INSTALLATION_TYPES=	overwrite pkgviews

PERL5_PACKLIST=		auto/CGI/Session/ExpireSessions/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
