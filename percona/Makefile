# $NetBSD$

DISTNAME=	${MYSQL_PKG_PREFIX}-1.2
CATEGORIES=	meta-pkgs
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	jperkin@joyent.com
COMMENT=	Meta-package for a Percona environment
LICENSE=	public-domain

META_PACKAGE=	yes

MYSQL_VERSIONS_ACCEPTED=	percona57 percona56 percona55 percona57-cluster percona56-cluster percona55-cluster

.include "../../mk/mysql.buildlink3.mk"

.if empty(MYSQL_PKG_PREFIX:Mpercona*)
BROKEN=		Only supports Percona packages
.endif

DEPENDS+=	p5-DBD-${MYSQL_PKG_PREFIX}-[0-9]*:../../databases/p5-DBD-mysql
DEPENDS+=	${MYSQL_PKG_PREFIX}-xtrabackup-[0-9]*:../../joyent/percona-xtrabackup
DEPENDS+=	quickbackup-percona-[0-9]*:../../joyent/quickbackup-percona

FILES_SUBST+=	HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=	MYSQL_DATADIR=${MYSQL_DATADIR}
FILES_SUBST+=	MYSQL_USER=${MYSQL_USER} MYSQL_GROUP=${MYSQL_GROUP}

.include "../../mk/bsd.pkg.mk"
