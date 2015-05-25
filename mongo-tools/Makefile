# $NetBSD$

DISTNAME=	r${PKGVERSION_NOREV}
PKGNAME=	${GITHUB_PROJECT}-3.0.3
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=mongodb/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	${MASTER_SITE_GITHUB:=mongodb/mongo-tools/}
COMMENT=	MongoDB CLI tools
LICENSE=	apache-2.0

GITHUB_PROJECT=	mongo-tools
GITHUB_TAG=	r${PKGVERSION_NOREV}

DIST_SUBDIR=	${GITHUB_PROJECT}
WRKSRC=		${WRKDIR}/${GITHUB_PROJECT}-${DISTNAME}

USE_TOOLS+=	pkg-config

MONGO_TOOLS=	bsondump mongostat mongofiles mongoexport mongoimport mongorestore mongodump mongotop mongooplog

BUILDLINK_PASSTHRU_DIRS+=	/tmp

INSTALLATION_DIRS+=	bin

post-extract:
	${MKDIR} -p ${WRKSRC}/vendor/src/github.com/mongodb/mongo-tools
.for tool in common ${MONGO_TOOLS}
	${LN} -s ${WRKSRC}/${tool} ${WRKSRC}/vendor/src/github.com/mongodb/mongo-tools/${tool}
.endfor

do-build:
.for tool in ${MONGO_TOOLS}
	cd ${WRKSRC} && ${PKGSRC_SETENV} GOPATH=${WRKSRC}:${WRKSRC}/vendor:${PREFIX}/gopkg go build -v -o bin/${tool} ${tool}/main/${tool}.go
.endfor

do-install:
.for tool in ${MONGO_TOOLS}
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${tool} ${DESTDIR}${PREFIX}/bin/${tool}
.endfor

.include "../../lang/go/version.mk"
.include "../../mk/bsd.pkg.mk"
