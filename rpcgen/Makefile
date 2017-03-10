# $NetBSD$

DISTNAME=	illumos-joyent
PKGNAME=	${DISTNAME:S/illumos-joyent/rpcgen/}-1.1.${GITHUB_TAG}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=joyent/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.illumos.org/projects/illumos-gate/
COMMENT=	illumos XDR RPC generation tool
LICENSE=	cddl-1.0

GITHUB_PROJECT=	illumos-joyent
GITHUB_TAG=	20141030

USE_LANGUAGES=	c
USE_TOOLS+=	gmake

WRKSRC=		${WRKDIR}/${DISTNAME}-${GITHUB_TAG}/usr/src

RPC_OBJS=	clntout cout hout main parse sample scan svcout tblout util

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-build:
.for obj in ${RPC_OBJS}
	cd ${WRKSRC}/cmd/rpcgen && \
		${CC} ${CPPFLAGS} ${CFLAGS} -o rpc_${obj}.o -c rpc_${obj}.c
.endfor
	cd ${WRKSRC}/cmd/rpcgen && \
		${CC} ${LDFLAGS} -o rpcgen *.o

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/rpcgen/rpcgen \
		${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/man1/rpcgen.1 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

.include "../../mk/bsd.pkg.mk"
