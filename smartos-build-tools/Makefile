# $NetBSD$
#
# This is a single package that intends to replace the multiple individual
# packages that are required for building SmartOS.  It comprises binaries from
# the following packages:
#
#   dmake-20130927.tgz
#   astmsgtools-20130402.tgz
#   rpcgen-20130402.tgz
#   sgstools-20130402.tgz
#
# available from /Joyent_Dev/public/releng/pkgsrc.  Those packages in turn are
# generated from the proto area of a smartos-live build.
#
# The tarball was generated simply by combining the contents of the individual
# packages.
#

DISTNAME=	smartos-build-tools-20130927
CATEGORIES=	sysutils
MASTER_SITES=	https://us-east.manta.joyent.com/pkgsrc/public/pkg-bootstraps/

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://us-east.manta.joyent.com/pkgsrc/public/pkg-bootstraps/
COMMENT=	Build tools from SmartOS
LICENSE=	cddl-1.0

CONFLICTS+=	astmsgtools-[0-9]*
CONFLICTS+=	dmake-[0-9]*
CONFLICTS+=	rpcgen-[0-9]*
CONFLICTS+=	sgstools-[0-9]*

SUPERSEDES+=	astmsgtools-[0-9]*
SUPERSEDES+=	dmake-[0-9]*
SUPERSEDES+=	rpcgen-[0-9]*
SUPERSEDES+=	sgstools-[0-9]*

USE_LANGUAGES=	# none
NO_BUILD=	yes

CHECK_PERMS=		no
CHECK_SHLIBS=		no
CHECK_SSP_SUPPORTED=	no
CTF_SUPPORTED=		no

INSTALLATION_DIRS=	ast/bin bin lib/amd64 ${PKGMANDIR}/man1 share/lib/ccs share/lib/make

do-install:
	for f in ${WRKDIR}/ast/bin/*; do				\
		${INSTALL_PROGRAM} $${f} ${DESTDIR}${PREFIX}/ast/bin;	\
	done
	for f in ${WRKDIR}/bin/*; do					\
		${INSTALL_PROGRAM} $${f} ${DESTDIR}${PREFIX}/bin;	\
	done
	for f in ${WRKDIR}/lib/*.so*; do				\
		${INSTALL_LIB} $${f} ${DESTDIR}${PREFIX}/lib;		\
	done
	for f in ${WRKDIR}/lib/amd64/*.so*; do				\
		${INSTALL_LIB} $${f} ${DESTDIR}${PREFIX}/lib/amd64;	\
	done
	${RM} -rf ${DESTDIR}${PREFIX}/lib/64
	${LN} -s amd64 ${DESTDIR}${PREFIX}/lib/64
	for f in ${WRKDIR}/man/man1/*; do				\
		${INSTALL_MAN} $${f} ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1; \
	done
	${INSTALL_DATA} ${WRKDIR}/share/lib/make/make.rules		\
	    ${DESTDIR}${PREFIX}/share/lib/make/make.rules
	for f in ${WRKDIR}/share/lib/ccs/*; do				\
		${INSTALL_DATA} $${f} ${DESTDIR}${PREFIX}/share/lib/ccs; \
	done

.include "../../mk/bsd.pkg.mk"
