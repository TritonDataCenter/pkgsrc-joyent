# $NetBSD$
#
# These tools were built on jperkin's smartos-live build host running
# joyent_20170202T033902Z, patched with fixes for the following issues:
#
# OS-6428
# OS-6457
# OS-6469
# OS-6485
# OS-6486
# OS-6488
# OS-6505
#
# The tarball was generated with:
#
# $ bldenv ..
# $ cd usr/src
# $ dmake setup
# $ cd tools/proto/root_i386-nd/opt
# $ cp /lib/libavl.so.1 onbld/lib/i386
# $ tar zcf ctftools-1.0.tar.gz onbld/bin/i386/ctf* \
#     onbld/lib/i386/lib{avl,ctf,dwarf}.so.1
#
# The platform libavl.so.1 is required due to difference between the
# build platform and the 2014Q4 build hosts (joyent_20141030T081701Z)
#

DISTNAME=	ctftools-1.0
CATEGORIES=	sysutils
MASTER_SITES=	https://us-east.manta.joyent.com/pkgsrc/public/pkg-bootstraps/

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://github.com/joyent/illumos-joyent/tree/master/usr/src/tools/ctf
COMMENT=	CTF tools from SmartOS
LICENSE=	cddl-1.0

USE_LANGUAGES=	# none
NO_BUILD=	yes
CTF_SUPPORTED=	yes

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
