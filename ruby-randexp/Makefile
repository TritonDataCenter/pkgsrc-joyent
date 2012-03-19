# $NetBSD: Makefile,v 1.6 2008/09/18 12:42:47 taca Exp $

DISTNAME=	randexp-0.1.5
PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME}
CATEGORIES=	devel

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://github.com/benburkert/randexp
COMMENT=	Library for generating random strings

DEPENDS+=       ${RUBY_PKGPREFIX}-parsetree-[0-9]*:../../devel/ruby-parsetree
GEM_BUILD=	gemspec

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
