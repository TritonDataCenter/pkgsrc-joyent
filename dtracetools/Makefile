# $NetBSD$

DISTNAME=	dtracetools-1.0
CATEGORIES=	sysutils
MASTER_SITES=   ${MASTER_SITE_GITHUB:=joyent/}

MAINTAINER=	derek@joyent.com
HOMEPAGE=	https://docs.joyent.com/public-cloud/d-40-performance/dtrace
COMMENT=	DTraceTools for Joyent SmartMachines
LICENSE=	public-domain

NO_BUILD=	yes

INSTALLATION_DIRS+=	bin

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/*.d ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
