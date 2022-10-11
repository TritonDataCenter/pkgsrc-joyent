# $NetBSD$

DISTNAME=	ctftools
PKGNAME=	ctftools-20210826
CATEGORIES=	sysutils
MASTER_SITES=	https://us-central.manta.mnx.io/Joyent_Dev/public/ctftools/20210826T002459Z/
DIST_SUBDIR=	${PKGNAME_NOREV}

MAINTAINER=	jperkin@pkgsrc.org
HOMEPAGE=	https://github.com/joyent/illumos-joyent/tree/master/usr/src/tools/ctf
COMMENT=	CTF tools from SmartOS
LICENSE=	cddl-1.0

USE_LANGUAGES=	# none
NO_BUILD=	yes
CTF_SUPPORTED=	no

#
# The tarball includes relocatable binaries, but as our current target platform
# is identical and there are some unresolved (though seemingly harmless) library
# versions in the ldd output we just ship the binaries and let them link against
# the platform.
#
CTFBINDIR=	onbld/bin/i386

INSTALLATION_DIRS=	${CTFBINDIR}

CHECK_PERMS=		no
#CHECK_SHLIBS_SKIP+=	${CTFBINDIR}/ctfconvert
#CHECK_SHLIBS_SKIP+=	${CTFBINDIR}/ctfmerge
CHECK_SSP_SUPPORTED=	no

do-install:
	for f in ${WRKDIR}/bin/i386/ctf*; do			\
		${INSTALL_PROGRAM} $${f} ${DESTDIR}${PREFIX}/${CTFBINDIR}; \
	done

.include "../../mk/bsd.pkg.mk"
