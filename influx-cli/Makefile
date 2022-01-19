# $NetBSD$

DISTNAME=	influx-cli-2.1.1
MASTER_SITES=	${MASTER_SITE_GITHUB:=influxdata/}
CATEGORIES=	databases
GITHUB_PROJECT=	influx-cli
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/influxdata/influx-cli/
COMMENT=	Decoupled CLI client for influxdb 2
LICENSE=	mit

USE_LANGUAGES=	c
USE_TOOLS+=	gmake

BIN_FILES=	influx
DOC_FILES=	CHANGELOG.md LICENSE README.md
DOCDIR=		share/doc/influx-cli

INSTALLATION_DIRS+=	bin ${DOCDIR}

INFLUX_GO_FLAGS=	-s
INFLUX_GO_FLAGS+=	-X main.version=${PKGVERSION_NOREV}

.include "go-modules.mk"

pre-build:
	${CP} -f ${FILESDIR}/go.* ${WRKSRC}

do-build:
	${RUN} cd ${WRKSRC} && \
	${PKGSRC_SETENV} ${MAKE_ENV} GOMODCACHE=${WRKDIR} \
		${GO} build -ldflags "${INFLUX_GO_FLAGS}" \
			-tags assets ./cmd/${BIN_FILES}

do-install:
.for f in ${BIN_FILES}
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/bin
.endfor
.for f in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/${DOCDIR}
.endfor

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
