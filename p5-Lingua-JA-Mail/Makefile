# $NetBSD$
#

DISTNAME=	Lingua-JA-Mail-0.03
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	mail joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/H/HA/HATA/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/CPAN/authors/id/H/HA/HATA/
COMMENT=	Compose mail with Japanese charset

DEPENDS+=	p5-Encode>=2.10:../../textproc/p5-Encode
DEPENDS+=	p5-MIME-Base64>=3.05:../../converters/p5-MIME-Base64

PERL5_PACKLIST=	auto/Lingua/JA/Mail/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
