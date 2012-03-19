# $NetBSD$
#

DISTNAME=	HTML-SimpleLinkExtor-1.25
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	www
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/~bdfoy/${DISTNAME}/
COMMENT=	Extract links from HTML
LICENSE=	${PERL5_LICENSE}

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-HTML-Parser>=1.28:../../www/p5-HTML-Parser
DEPENDS+=	p5-Test-Output>=0:../../devel/p5-Test-Output
DEPENDS+=	p5-libwww>=0:../../www/p5-libwww

PERL5_PACKLIST=	auto/HTML/SimpleLinkExtor/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
