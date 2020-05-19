# $NetBSD$
#

DISTNAME=	quickbackup-percona-8.0
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://github.com/joyent/pkgsrc/wiki/use:percona-cluster
COMMENT=	Percona XtraBackup SMF service
LICENSE=	public-domain

NO_CHECKSUM=	yes
NO_CONFIGURE=	yes

INSTALLATION_DIRS=	bin

.include "../../mk/bsd.prefs.mk"

MYSQL_USER?=	mysql
MYSQL_GROUP?=	mysql
MYSQL_DATADIR?=	${VARBASE}/mysql

FILES_SUBST+=	MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}
FILES_SUBST+=	MYSQL_DATADIR=${MYSQL_DATADIR}

BUILD_DEFS+=	MYSQL_USER MYSQL_GROUP
BUILD_DEFS+=	MYSQL_DATADIR VARBASE

do-build:
	${SED} ${FILES_SUBST_SED} ${FILESDIR}/quickbackup-percona \
	    >${WRKDIR}/quickbackup-percona

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/quickbackup-percona ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
