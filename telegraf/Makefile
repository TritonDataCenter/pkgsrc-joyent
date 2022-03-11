# $NetBSD$

DISTNAME=	telegraf-1.21.4
MASTER_SITES=	${MASTER_SITE_GITHUB:=influxdata/}
GITHUB_PROJECT=	telegraf
GITHUB_TAG=	v${PKGVERSION_NOREV}

CATEGORIES=	sysutils
MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://www.influxdata.com/
COMMENT=	Plugin-driven server agent for collecting & reporting metrics
LICENSE=	mit

DATADIR=	${VARBASE}/lib/telegraf
LOGDIR=		${VARBASE}/log/telegraf

BUILD_DEFS+=	TELEGRAF_USER TELEGRAF_GROUP VARBASE

FILES_SUBST+=	TELEGRAF_USER=${TELEGRAF_USER:Q}
FILES_SUBST+=	TELEGRAF_GROUP=${TELEGRAF_GROUP:Q}
FILES_SUBST+=	DATADIR=${DATADIR:Q}
FILES_SUBST+=	LOGDIR=${LOGDIR:Q}

TELEGRAF_USER?=		telegraf
TELEGRAF_GROUP?=	telegraf
OWN_DIRS_PERMS+=	${DATADIR} ${TELEGRAF_USER} ${TELEGRAF_GROUP} 0700
OWN_DIRS_PERMS+=	${LOGDIR} ${TELEGRAF_USER} ${TELEGRAF_GROUP} 0700
PKG_USERS_VARS+=	TELEGRAF_USER
PKG_GROUPS_VARS+=	TELEGRAF_GROUP
PKG_GROUPS=		${TELEGRAF_GROUP}
PKG_USERS=		${TELEGRAF_USER}:${TELEGRAF_GROUP}
RCD_SCRIPTS=		telegraf
PKG_SYSCONFSUBDIR=	telegraf

INSTALLATION_DIRS+=	bin share/doc/telegraf share/examples/telegraf

DOC_FILES=	LICENSE README.md CHANGELOG.md
CONF_FILES+=	${PREFIX}/share/examples/telegraf/telegraf.conf \
		${PKG_SYSCONFDIR}/telegraf.conf

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_FILES.path=	config/config.go
SUBST_VARS.path=	PKG_SYSCONFDIR

.include "go-modules.mk"

TELEGRAF_LDFLAGS+=	-w -s
TELEGRAF_LDFLAGS+=	-X main.version=${PKGVERSION_NOREV}

do-build:
	${RUN} cd ${WRKSRC} && \
	${PKGSRC_SETENV} ${MAKE_ENV} \
	    ${GO} build -v -ldflags "${TELEGRAF_LDFLAGS}" ./cmd/telegraf

do-install:
	${INSTALL} ${WRKSRC}/telegraf ${DESTDIR}${PREFIX}/bin/telegraf
.for f in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${f} \
		${DESTDIR}${PREFIX}/share/doc/telegraf/
.endfor
	${INSTALL_DATA} ${WRKSRC}/etc/telegraf.conf \
		${DESTDIR}${PREFIX}/share/examples/telegraf/

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
