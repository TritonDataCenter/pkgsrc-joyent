# $NetBSD$
#

DISTNAME=	CGI-Application-FastCGI-0.02
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	www joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/N/NA/NAOYA/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/CPAN/authors/id/N/NA/NAOYA/
COMMENT=	Module for using CGI::Application under FastCGI

DEPENDS+=	p5-CGI-Application>=3:../../www/p5-CGI-Application
DEPENDS+=	p5-FCGI>=0.6:../../www/p5-FCGI

PERL5_PACKLIST=	auto/CGI/Application/FastCGI/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
