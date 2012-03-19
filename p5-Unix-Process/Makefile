# $NetBSD$
#

DISTNAME=	Unix-Process-1.3101
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	sysutils
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/J/JE/JETTERO/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/~jettero/Unix-Process-1.3101/
COMMENT=	Perl extension to get pid info from (/bin/ps)
LICENSE=	gnu-lgpl-v3

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-IPC-System-Simple>=0:../../devel/p5-IPC-System-Simple

PERL5_PACKLIST=	auto/Unix/Process/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
