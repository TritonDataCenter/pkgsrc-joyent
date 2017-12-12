# $NetBSD$

DISTNAME=	ctftools-1.0
CATEGORIES=	sysutils
MASTER_SITES=	https://us-east.manta.joyent.com/pkgsrc/public/pkg-bootstraps/

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://github.com/joyent/illumos-joyent/tree/master/usr/src/tools/ctf
COMMENT=	CTF tools from SmartOS
LICENSE=	cddl-1.0

USE_LANGUAGES=	# none
NO_BUILD=	yes

CTFBINDIR=	onbld/bin/i386
CTFLIBDIR=	onbld/lib/i386

INSTALLATION_DIRS=	${CTFBINDIR} ${CTFLIBDIR}

CHECK_PERMS=		no
CHECK_SHLIBS_SKIP+=	${CTFBINDIR}/ctfconvert
CHECK_SHLIBS_SKIP+=	${CTFBINDIR}/ctfmerge
CHECK_SSP_SUPPORTED=	no

do-install:
	for f in ${WRKDIR}/${CTFBINDIR}/ctf*; do			\
		${INSTALL_PROGRAM} $${f} ${DESTDIR}${PREFIX}/${CTFBINDIR}; \
	done
	for f in ${WRKDIR}/${CTFLIBDIR}/lib*; do			\
		${INSTALL_LIB} $${f} ${DESTDIR}${PREFIX}/${CTFLIBDIR};	\
	done

.include "../../mk/bsd.pkg.mk"
