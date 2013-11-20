# $NetBSD: Makefile,v 1.12 2013/01/26 21:38:01 adam Exp $
#

DISTNAME=	tesseract-ocr-3.02.02
CATEGORIES=	graphics
MASTER_SITES=	http://tesseract-ocr.googlecode.com/files/
DISTFILES+=	${DISTNAME}.tar.gz

TESSLANGS=	deu eng fra ita nld spa

.for l in ${TESSLANGS}
DISTFILES+=	tesseract-ocr-3.02.${l}.tar.gz
.endfor

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://code.google.com/p/tesseract-ocr/
COMMENT=	Commercial quality open source OCR engine
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/tesseract-ocr

INSTALLATION_DIRS=	libexec share/doc/tesseract share/tesseract

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_MULTIARCH=	lib
USE_TOOLS+=	gmake pax

CONFIGURE_ENV+=	LIBLEPT_HEADERSDIR=${PREFIX:Q}/include
INSTALL_ENV+=	LANGS="${TESSLANGS}"

LDFLAGS.SunOS+=	-lsocket -lnsl

.include "../../joyent/leptonica/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
