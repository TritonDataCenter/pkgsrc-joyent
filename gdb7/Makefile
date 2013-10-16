# $NetBSD$
#

DISTNAME=		gdb-7.6.1
CATEGORIES=		devel
MASTER_SITES=		ftp://sources.redhat.com/pub/gdb/releases/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		shannonjr@NetBSD.org
HOMEPAGE=		http://www.gnu.org/software/gdb/gdb.html
COMMENT=		The GNU Project Debugger
LICENSE=		gnu-gpl-v3

PKG_DESTDIR_SUPPORT=	user-destdir

NOT_FOR_PLATFORM=	Darwin-*-* DragonFly-*-*

USE_TOOLS+=		gmake makeinfo msgfmt
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
REPLACE_LOCALEDIR_PATTERNS+=	Make-in
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--libdir=${PREFIX}/lib/gdb7
CONFIGURE_ARGS+=	--includedir=${PREFIX}/include/gdb7
CONFIGURE_ARGS+=	--enable-libada
INFO_FILES=		yes

.include "options.mk"

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "SunOS" && ( ${MACHINE_ARCH} == "x86_64" || ${MACHINE_ARCH} == "amd64" )
LIB64=			amd64/
.endif
PLIST_SUBST+=		LIB64=${LIB64}

pre-patch:
	${CP} ${FILESDIR}/nbsd-nat.c ${WRKSRC}/gdb

do-test:
	if ${PKG_INFO} -qe dejagnu; then		\
		(cd ${WRKSRC} && ${GMAKE} check);	\
	else						\
		${ECHO} "dejagnu is required for the test target";	\
	fi

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
