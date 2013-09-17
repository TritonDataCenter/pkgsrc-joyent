# $NetBSD$
#

DISTNAME=	build-essential-1.1
CATEGORIES=	devel meta-pkgs
MASTER_SITES=	# empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://www.joyent.com/
COMMENT=	Meta-package for essential build utilities

DEPENDS+=	autoconf-[0-9]*:../../devel/autoconf
DEPENDS+=	automake-[0-9]*:../../devel/automake
DEPENDS+=	binutils-[0-9]*:../../devel/binutils
DEPENDS+=	bison-[0-9]*:../../devel/bison
DEPENDS+=	gcc47-[0-9]*:../../lang/gcc47
DEPENDS+=	gmake-[0-9]*:../../devel/gmake
DEPENDS+=	libtool-[0-9]*:../../devel/libtool
DEPENDS+=	m4-[0-9]*:../../devel/m4
DEPENDS+=	patch-[0-9]*:../../devel/patch
.if exists(../../devel/git/Makefile)
DEPENDS+=	git-base-[0-9]*:../../devel/git-base
DEPENDS+=	git-docs-[0-9]*:../../devel/git-docs
.else
DEPENDS+=	scmgit-base-[0-9]*:../../devel/scmgit-base
DEPENDS+=	scmgit-docs-[0-9]*:../../devel/scmgit-docs
.endif

META_PACKAGE=	yes

.include "../../mk/bsd.pkg.mk"
