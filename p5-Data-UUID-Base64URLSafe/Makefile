# $NetBSD$
#

DISTNAME=	Data-UUID-Base64URLSafe-0.33
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/~lbrocard/Data-UUID-Base64URLSafe-0.33/
COMMENT=	URL-safe UUIDs

DEPENDS+=	p5-Data-UUID>=0:../../devel/p5-Data-UUID
DEPENDS+=	p5-MIME-Base64-URLSafe>=0:../../converters/p5-MIME-Base64-URLSafe

PERL5_PACKLIST=	auto/Data/UUID/Base64URLSafe/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
