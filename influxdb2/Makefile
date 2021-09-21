# $NetBSD$

DISTNAME=	influxdb-2.0.8
PKGNAME=	${DISTNAME:S/influxdb/influxdb2/}
MASTER_SITES=	${MASTER_SITE_GITHUB:=influxdata/}
CATEGORIES=	databases
GITHUB_PROJECT=	influxdb
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/influxdata/influxdb
COMMENT=	Scalable datastore for metrics, events, and real-time analytics
LICENSE=	mit

# Per-version subdir due to non-versioned build.tar.gz below.
DIST_SUBDIR=	${PKGNAME_NOREV}

UI_DATA=		build.tar.gz
SITES.${UI_DATA}=	${MASTER_SITE_GITHUB:=influxdata/}ui/releases/download/OSS-v${PKGVERSION_NOREV}/
EXTRACT_DIR.${UI_DATA}=	${WRKSRC}/static/data

DISTFILES=	${DEFAULT_DISTFILES} ${UI_DATA}

# Requires io/fs stuff.
GO_VERSION_DEFAULT=	116

USE_TOOLS+=	pkg-config

DATADIR=	${VARBASE}/lib/influxdbv2
LOGDIR=		${VARBASE}/log/influxdb

BUILD_DEFS+=		INFLUXDB_USER INFLUXDB_GROUP VARBASE
FILES_SUBST+=		INFLUXDB_USER=${INFLUXDB_USER:Q}
FILES_SUBST+=		INFLUXDB_GROUP=${INFLUXDB_GROUP:Q}
FILES_SUBST+=		DATADIR=${DATADIR:Q}
FILES_SUBST+=		LOGDIR=${LOGDIR:Q}

INFLUXDB_USER?=		influxdb
INFLUXDB_GROUP?=	influxdb
OWN_DIRS_PERMS+=	${DATADIR} ${INFLUXDB_USER} ${INFLUXDB_GROUP} 0700
OWN_DIRS_PERMS+=	${LOGDIR} ${INFLUXDB_USER} ${INFLUXDB_GROUP} 0700
PKG_USERS_VARS+=	INFLUXDB_USER
PKG_GROUPS_VARS+=	INFLUXDB_GROUP
PKG_GROUPS=		${INFLUXDB_GROUP}
PKG_USERS=		${INFLUXDB_USER}:${INFLUXDB_GROUP}
PKG_SYSCONFSUBDIR=	influxdb
RCD_SCRIPTS=		influxdb

BIN_FILES=		influx influxd
DOC_FILES=		CHANGELOG.md LICENSE README.md

INSTALLATION_DIRS+=	bin share/doc/influxdb

GO_PKG_CONFIG_DIR=	${WRKDIR}/github.com/influxdata/pkg-config@v0.2.8
GO_EXTRA_MOD_DIRS=	${GO_PKG_CONFIG_DIR}
CARGO_WRKSRC=		${WRKDIR}/github.com/influxdata/flux@v0.124.0/libflux

.include "cargo-depends.mk"
.include "go-modules.mk"

INFLUX_GO_FLAGS=	-s
INFLUX_GO_FLAGS+=	-X main.version=${PKGVERSION_NOREV}

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	internal/fs/influx_dir.go
SUBST_VARS.paths=	DATADIR

SUBST_CLASSES.SunOS+=	statfs
SUBST_STAGE.statfs=	pre-configure
SUBST_FILES.statfs=	pkg/fs/fs_unix.go
SUBST_SED.statfs=	-e 's,unix.Statfs,unix.Statvfs,g'

do-build:
	${RUN} cd ${GO_PKG_CONFIG_DIR} && \
		${PKGSRC_SETENV} ${MAKE_ENV} ${GO} build
	cd ${CARGO_WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${PREFIX}/bin/cargo ${CARGO_ARGS}
	${RUN} cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} GOMODCACHE=${WRKDIR} \
		PKG_CONFIG=${GO_PKG_CONFIG_DIR}/pkg-config \
		${GO} generate ./static
.for cmd in ${BIN_FILES}
	${RUN} cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} GOMODCACHE=${WRKDIR} \
		PKG_CONFIG=${GO_PKG_CONFIG_DIR}/pkg-config \
		${GO} build -ldflags "${INFLUX_GO_FLAGS}" -tags assets ./cmd/${cmd}
.endfor

do-install:
.for f in ${BIN_FILES}
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/bin
.endfor
.for f in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/share/doc/influxdb
.endfor

.include "../../lang/go/go-module.mk"
.include "../../lang/rust/cargo.mk"
.include "../../mk/bsd.pkg.mk"
