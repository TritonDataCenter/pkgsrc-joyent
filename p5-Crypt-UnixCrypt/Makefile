# $NetBSD: Makefile,v 1.7 2008/06/12 02:14:35 joerg Exp $

DISTNAME=	Crypt-UnixCrypt-1.0
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Crypt/}

MAINTAINER=	adrianp@NetBSD.org
HOMEPAGE=	http://search.cpan.org/src/MVORL/Crypt-UnixCrypt-1.0/
COMMENT=	Perl-only implementation of the crypt function
LICENSE=	gnu-gpl-v2

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=	auto/Crypt/UnixCrypt/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
