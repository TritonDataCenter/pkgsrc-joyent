# $NetBSD: Makefile,v 1.7 2008/06/12 02:14:35 joerg Exp $

DISTNAME=	User-Utmp-1.8
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=User/}

MAINTAINER=	adrianp@NetBSD.org
HOMEPAGE=	http://www.dynalabs.de/mxp/perl/user-utmp.html
COMMENT=	Provides a Perl interface to utmpx- and utmp-style databases on UNIX systems
LICENSE=	gnu-gpl-v2

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/User/Utmp/.packlist

CHECK_INTERPRETER_SKIP+=	*/example.pl

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
