# $NetBSD$
#

MODNAME=	ffmpeg
PECL_VERSION=	0.6.0
PECL_DISTNAME=	ffmpeg-php-${PECL_VERSION}
#PKGNAME=	${PHP_PKG_PREFIX}-ffmpeg-0.6.0
CATEGORIES=	joyent
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=ffmpeg-php/}
EXTRACT_SUFX=	.tbz2

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://ffmpeg-php.sourceforge.net/
COMMENT=	SHORT_DESCRIPTION_OF_THE_PACKAGE

GNU_CONFIGURE=	yes

.include "../../lang/php/ext.mk"

#WRKSRC=		${WRKDIR}/${DISTNAME}

#.include "../../multimedia/ffmpeg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
