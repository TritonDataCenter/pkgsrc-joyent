# $NetBSD$
#

DISTNAME=	Data-Structure-Util-0.15
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	databases joyent
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/~andya/Data-Structure-Util-0.15/
COMMENT=	Change nature of data within a structure

DEPENDS+=	p5-Digest-MD5>=0:../../security/p5-Digest-MD5
DEPENDS+=	p5-Test-Pod>=0:../../devel/p5-Test-Pod
DEPENDS+=	p5-Test-Simple>=0:../../devel/p5-Test-Simple
DEPENDS+=	p5-Scalar-List-Utils>=0:../../devel/p5-Scalar-List-Utils

PERL5_PACKLIST=	auto/Data/Structure/Util/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
