# $NetBSD$
#

DISTNAME=	Net-Stomp-0.34
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	net joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/~lbrocard/Net-Stomp-0.34/
COMMENT=	A Streaming Text Orientated Messaging Protocol Client

# TODO: Look for the dependencies in Build.PL.

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Net/Stomp/.packlist
USE_LANGUAGES=		# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
