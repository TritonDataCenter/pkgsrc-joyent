# $NetBSD$

DISTNAME=	samba-compat32-1.1
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://pkgsrc.joyent.com/
COMMENT=	Samba 32-bit libraries for NSS/PAM via winbind
LICENSE=	gnu-gpl-v3

NO_CHECKSUM=	yes
CTF_SUPPORTED=	no	# Files already have CTF

DEPENDS+=	samba>4:../../net/samba4

ONLY_FOR_PLATFORM=	SunOS-*-x86_64

#
# This is an "interesting" package, bundling libraries from a different
# package set, but as far as I know this is the cleanest way to achieve this
# automatically.
#
# The illumos NSS/PAM libraries currently only support 32-bit objects, so by
# bundling up the libraries from the same samba4 package from the i386 package
# set users are able to authenticate to a 64-bit winbindd process.
#
# We take advantage of pkg_add's -P override to install the latest i386 samba4
# package into a "chroot", then extract the libraries we require from it and
# their dependencies, and bundle them up with RPATH rewritten to find them.
#
# Note that even with -P and -I (do not execute INSTALL scripts) in place,
# there are still some artefects created under our real LOCALBASE, due to
# @pkgdir not honouring -P.  This shouldn't cause any problems however.
#
# We're relying here on 'samba>4' picking out the latest net/samba4 package,
# as it's critical the versions match so that the socket protocol is the same.
#

INSTALLATION_DIRS=	lib/i386 lib/samba/security/i386

#
# Not really a chroot, just a destdir for the packages to be "installed" to.
#
PKG_CHROOT=		${WRKSRC}/pkg

#
# Pairs of library files and destination, used to simplify the logic.  For the
# sake of further simplicitly we bundle all the libraries into the "security"
# directory, even if they came from other parts of the tree.
#
# The GCC libraries are handled inline to avoid problems with expanding
# variables correctly when using ${PKG_CC} to calculate paths.
#

SAMBA_LIBS+=	lib/libnss_winbind.so lib/i386

.for seclib in pam_winbind.so
SAMBA_LIBS+=	lib/samba/security/${seclib} lib/samba/security/i386
.endfor

.for privlib in \
	libgenrand-samba4.so \
	libiov-buf-samba4.so \
	libreplace-samba4.so \
	libsamba-debug-samba4.so \
	libsocket-blocking-samba4.so \
	libsys-rw-samba4.so \
	libtime-basic-samba4.so \
	libutil-setid-samba4.so \
	libwinbind-client-samba4.so
SAMBA_LIBS+=	lib/samba/private/${privlib} lib/samba/security/i386
.endfor

.for pkglib in \
	libgnutls.so.30 \
	libiconv.so.2 \
	libintl.so.8 \
	libsamba-util.so.0 \
	libtalloc.so.2 \
	libtevent.so.0 \
	libwbclient.so.0
SAMBA_LIBS+=	lib/${pkglib} lib/samba/security/i386
.endfor

#
# This is a little hacky but trying to calculate it using ${PKG_CC} will find
# the libraries from the native set not the 32-bit set.  They should be
# compatible of course, but this ensures we actually use the libraries that the
# 32-bit libraries were built against.
#
.for gcclib in \
	libgcc_s.so.1 \
	libssp.so.0
SAMBA_LIBS+=	gcc*/i486-sun-solaris2.11/lib/${gcclib} lib/samba/security/i386
.endfor

ELFEDIT_ARGS=	-e 'dyn:runpath ${PREFIX}/lib/samba/security/i386'

do-build:
	${PKGSRC_SETENV} PKG_PATH=${PACKAGES:S/x86_64/i386/}/All \
		${PKG_ADD_CMD} -P ${PKG_CHROOT} -I -m i386 'samba>4'
.for lib dest in ${SAMBA_LIBS}
	/usr/bin/elfedit ${ELFEDIT_ARGS} ${PKG_CHROOT}/${PREFIX}/${lib}
.endfor

do-install:
.for lib dest in ${SAMBA_LIBS}
	${INSTALL_LIB} ${PKG_CHROOT}/${PREFIX}/${lib} \
		${DESTDIR}${PREFIX}/${dest}
.endfor
	${RM} -f ${DESTDIR}${PREFIX}/lib/i386/nss_winbind.so.1
	${LN} -s libnss_winbind.so \
		${DESTDIR}${PREFIX}/lib/i386/nss_winbind.so.1

.include "../../mk/bsd.pkg.mk"
