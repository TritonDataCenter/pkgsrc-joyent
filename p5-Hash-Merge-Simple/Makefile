# $NetBSD$
#

PKGNAME=	p5-${DISTNAME}
DISTNAME=	Hash-Merge-Simple-0.04
CATEGORIES=	devel joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/R/RK/RKRIMEN/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/~rkrimen/Hash-Merge-Simple-0.04/
COMMENT=	Recursively merge two or more hashes, simply

BUILD_DEPENDS+=	p5-Test-Deep>=0:../../devel/p5-Test-Deep
BUILD_DEPENDS+=	p5-Test-Most>=0:../../devel/p5-Test-Most

PERL5_PACKLIST= auto/Hash/Merge/Simple/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
