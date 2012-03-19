# $NetBSD$
#

DISTNAME=	Net-Domain-TLD-1.69
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	net
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/A/AL/ALEXP/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/~alexp/Net-Domain-TLD-1.69/lib/Net/Domain/TLD.pm
COMMENT=	Work with TLD names
LICENSE=	${PERL5_LICENSE}

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-Storable>=0:../../devel/p5-Storable

PERL5_PACKLIST=	auto/Net/Domain/TLD/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
