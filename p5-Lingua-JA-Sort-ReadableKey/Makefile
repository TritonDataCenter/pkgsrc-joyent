# $NetBSD$
#

DISTNAME=	Lingua-JA-Sort-ReadableKey-0.01
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	textproc joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/S/SI/SIMON/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/CPAN/authors/id/S/SI/SIMON/
COMMENT=	Sorting and Romanizing Japanese

DEPENDS+=	p5-Encode>=0:../../textproc/p5-Encode
DEPENDS+=	p5-Text-ChaSen>=0:../../textproc/p5-Text-ChaSen

PERL5_PACKLIST=	auto/Lingua/JA/Sort/ReadableKey/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
