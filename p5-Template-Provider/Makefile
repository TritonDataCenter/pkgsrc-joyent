# $NetBSD$

DISTNAME=		Template-Provider-Encoding-2.94
PKGNAME=		p5-${DISTNAME}
CATEGORIES=		www perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Template/}

MAINTAINER=		hiramatu@boreas.dti.ne.jp
HOMEPAGE=		http://search.cpan.org/dist/Template-Provider/
COMMENT=		Provider module for loading/compiling templates

DEPENDS+=		p5-Template-Toolkit>=2.14:../../www/p5-Template-Toolkit

PKG_INSTALLATION_TYPES=	overwrite pkgviews

PERL5_PACKLIST=		auto/Template/Provider/Encoding/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
