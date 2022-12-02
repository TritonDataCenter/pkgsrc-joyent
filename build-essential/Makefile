# $NetBSD$

DISTNAME=	build-essential-1.4
CATEGORIES=	devel meta-pkgs
MASTER_SITES=	# empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	http://www.joyent.com/
COMMENT=	Meta-package for essential build utilities

META_PACKAGE=	yes

# Going via tools helps pick up pkgconf vs pkg-config.
USE_TOOLS+=	pkg-config:run

.include "../../mk/compiler.mk"

DEPENDS+=	autoconf-[0-9]*:../../devel/autoconf
DEPENDS+=	automake-[0-9]*:../../devel/automake
DEPENDS+=	binutils-[0-9]*:../../devel/binutils
DEPENDS+=	bison-[0-9]*:../../devel/bison
.if ${PKGSRC_COMPILER} == "gcc"
.  if ${_GCC_DEPENDS:Mgcc12*}
DEPENDS+=	${_GCC_DEPENDS}:../../extra/gcc12
.  elif ${_GCC_DEPENDS:Mgcc10*}
DEPENDS+=	${_GCC_DEPENDS}:../../joyent/gcc10
.  elif ${_GCC_DEPENDS:Mgcc9*}
DEPENDS+=	${_GCC_DEPENDS}:../../joyent/gcc9
.  elif ${_GCC_DEPENDS:Mgcc7*}
DEPENDS+=	${_GCC_DEPENDS}:../../lang/gcc7
.  elif ${_GCC_DEPENDS:Mgcc49*}
DEPENDS+=	${_GCC_DEPENDS}:../../lang/gcc49
.  elif ${_GCC_DEPENDS:Mgcc47*}
DEPENDS+=	${_GCC_DEPENDS}:../../lang/gcc47
.  endif
.endif
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

.include "../../mk/bsd.pkg.mk"
