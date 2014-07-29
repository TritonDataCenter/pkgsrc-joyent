# $NetBSD$

DISTNAME=	${MYSQL_PKG_PREFIX}-1.1
CATEGORIES=	meta-pkgs
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	jperkin@joyent.com
COMMENT=	Meta-package for a Percona environment
LICENSE=	public-domain

META_PACKAGE=	yes

.include "../../mk/mysql.buildlink3.mk"

.if empty(MYSQL_PKG_PREFIX:Mpercona*)
BROKEN=		Only supports Percona packages
.endif

DEPENDS+=	p5-DBD-${MYSQL_PKG_PREFIX}-[0-9]*:../../databases/p5-DBD-mysql
DEPENDS+=	${MYSQL_PKG_PREFIX}-galera-[0-9]*:../../joyent/galera
DEPENDS+=	${MYSQL_PKG_PREFIX}-xtrabackup-[0-9]*:../../joyent/percona-xtrabackup
DEPENDS+=	quickbackup-percona-[0-9]*:../../joyent/quickbackup-percona

FILES_SUBST+=	HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=	MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=	MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}

.include "../../mk/bsd.pkg.mk"
