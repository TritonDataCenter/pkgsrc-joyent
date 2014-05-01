# $NetBSD$

DISTNAME=	webrat-0.7.0
PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME}
CATEGORIES=	devel

MAINTAINER=	pedro@joyent.com
HOMEPAGE=	http://github.com/brynary/webrat
COMMENT=	Ruby Acceptance Testing for Web applications
LICENSE=	mit

RUBY_VERSION_SUPPORTED=		200 193		# No 1.8 for nokogiri
.if defined(RUBY21_VERSION)
RUBY_VERSION_SUPPORTED+=	21
.endif

DEPENDS+=	${RUBY_PKGPREFIX}-rack>=1.0:../../www/ruby-rack
DEPENDS+=	${RUBY_PKGPREFIX}-rack-test>=0.5:../../www/ruby-rack-test
DEPENDS+=	${RUBY_PKGPREFIX}-nokogiri>=1.2:../../textproc/ruby-nokogiri

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
