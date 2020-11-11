# $NetBSD: Makefile,v 1.252 2017/05/31 09:30:21 jperkin Exp $

DISTNAME=		openssh-7.5p1
PKGNAME=		openssh1-7.5.1
CATEGORIES=		security
MASTER_SITES=		${MASTER_SITE_OPENBSD:=OpenSSH/portable/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.openssh.com/
COMMENT=		Legacy OpenSSH version for SSHv1 support

USE_GCC_RUNTIME=	yes
USE_TOOLS+=		autoconf perl

OPENSSH_BINS=		scp1 sftp1 ssh-add1 ssh-agent1 ssh1

BUILD_TARGET=		${OPENSSH_BINS}

MAKE_FLAGS+=		EXEEXT=1
MAKE_FLAGS+=		SSH_PROGRAM=${PREFIX}/bin/ssh1
MAKE_FLAGS+=		ASKPASS_PROGRAM=${PREFIX}/bin/ssh-askpass

.include "options.mk"

PKG_SYSCONFSUBDIR=	ssh1

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-mantype=man
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-tcp-wrappers=${BUILDLINK_PREFIX.tcp_wrappers}
CONFIGURE_ARGS+=	--with-ssh1
CONFIGURE_ARGS.Darwin+=	--disable-strip	# Symbol not found: _allow_severity

# pkgsrc already enforces a "secure" version of zlib via dependencies,
# so skip this bogus version check.
CONFIGURE_ARGS+=	--without-zlib-version-check

# the openssh configure script finds and uses ${LD} if defined and
# defaults to ${CC} if not. we override LD here, since running the
# linker directly results in undefined symbols for obvious reasons.
#
CONFIGURE_ENV+=		LD=${CC:Q}

# Enable S/Key support on NetBSD, Darwin, and Solaris.
.if ${OPSYS} == "NetBSD" || ${OPSYS} == "Darwin" || ${OPSYS} == "SunOS"
.  include "../../security/skey/buildlink3.mk"
CONFIGURE_ARGS+=	--with-skey=${BUILDLINK_PREFIX.skey}
.else
CONFIGURE_ARGS+=	--without-skey
.endif

CONFIGURE_ARGS.Linux+=	--enable-md5-password

.if exists(${X11BASE}/bin/xauth)
CONFIGURE_ARGS+=	--with-xauth=${X11BASE}/bin/xauth
.else
CONFIGURE_ARGS+=	--with-xauth=${PREFIX}/bin/xauth
.endif

EGDIR=			${PREFIX}/share/examples/${PKGBASE}

CONF_FILES+=		${EGDIR}/ssh_config ${PKG_SYSCONFDIR}/ssh_config

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 ${PKGMANDIR}/man5 ${EGDIR}

pre-configure:
	cd ${WRKSRC} && autoconf -i

do-install:
.for f in ${OPENSSH_BINS}
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/bin/${f}
.endfor
	${INSTALL_DATA} ${WRKSRC}/ssh_config ${DESTDIR}${EGDIR}/ssh_config
.for f in scp sftp ssh-add ssh-agent ssh
	${INSTALL_MAN} ${WRKSRC}/${f}.1 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/${f}1.1
.endfor
	${INSTALL_MAN} ${WRKSRC}/ssh_config.5 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man5/ssh_config1.5

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
