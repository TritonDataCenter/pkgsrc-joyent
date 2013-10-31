# $NetBSD$

DISTNAME=	haskell-platform-2013.2.0.0
PKGREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	http://lambda.haskell.org/platform/download/2013.2.0.0/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://lambda.haskell.org/platform/download/2013.2.0.0/
COMMENT=	Standard Haskell libraries and tools
LICENSE=	modified-bsd

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake

.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/Mesa/buildlink3.mk"
.include "../../wip/ghc/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
