# $NetBSD$
#

DISTNAME=	Net-SFTP-0.10
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	net perl5 security
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/D/DB/DBROBINS/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/~dbrobins/Net-SFTP-0.10/
COMMENT=	Module implementing a client for the Secure File Transfer Protocol
LICENSE=	${PERL5_LICENSE}

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-Net-SSH>=1.24:../../security/p5-Net-SSH

PERL5_PACKLIST=	auto/Net/SFTP/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
