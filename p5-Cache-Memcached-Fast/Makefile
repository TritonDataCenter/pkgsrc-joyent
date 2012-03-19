# $NetBSD$
#

DISTNAME=	Cache-Memcached-Fast-0.19
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	databases
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/K/KR/KROKI/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://search.cpan.org/~kroki/Cache-Memcached-Fast-0.19/
COMMENT=	Perl client for memcached, in C language

PERL5_PACKLIST=	auto/Cache/Memcached/Fast/.packlist

BUILD_DEPENDS+=	p5-Test-Simple-[0-9]*:../../devel/p5-Test-Simple

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
