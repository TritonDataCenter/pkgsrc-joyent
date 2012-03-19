# $NetBSD: Makefile,v 1.6 2008/09/18 12:42:47 taca Exp $

DISTNAME=	templater-1.0.0
PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME}
CATEGORIES=	devel

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://templater.rubyforge.org/
COMMENT=	Ruby code generation framework
LICENSE=	mit

DEPENDS+=	${RUBY_PKGPREFIX}-extlib-[0-9]*:../../devel/ruby-extlib
DEPENDS+=	${RUBY_PKGPREFIX}-highline-[0-9]*:../../devel/ruby-highline
DEPENDS+=	${RUBY_PKGPREFIX}-diff-lcs-[0-9]*:../../textproc/ruby-diff-lcs

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
