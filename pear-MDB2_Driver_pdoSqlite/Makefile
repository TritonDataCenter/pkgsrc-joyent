# $NetBSD: Makefile,v 1.2 2009/01/19 20:14:16 abs Exp $

DISTNAME=	MDB2_Driver_pdoSqlite
PKGNAME=        ${PHP_PKG_PREFIX}-pear-${DISTNAME}-0
PKGREVISION=	3
CATEGORIES=	databases
MASTER_SITES=	http://downloads.metala.org/pear/MDB2/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	filip@hajny.net
HOMEPAGE=	http://www.metala.org/
COMMENT=	Sqlite 3.x MDB2 driver (experimental, PDO-based)

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	${PHP_PKG_PREFIX}-pdo_sqlite-[0-9]*:../../databases/php-pdo_sqlite
DEPENDS+=	${PHP_PKG_PREFIX}-pear-MDB2>=2.5:../../databases/pear-MDB2

PEAR_DIRRM_EXCLUDE=	lib/php/MDB2
PHP_PKG_PREFIX=		php53
PEARLIB=		lib/php
WRKSRC=			${WRKDIR}
NO_BUILD=		yes

INSTALLATION_DIRS+=	lib/php/MDB2/Driver
INSTALLATION_DIRS+=	lib/php/MDB2/Driver/Datatype
INSTALLATION_DIRS+=	lib/php/MDB2/Driver/Function
INSTALLATION_DIRS+=	lib/php/MDB2/Driver/Manager
INSTALLATION_DIRS+=	lib/php/MDB2/Driver/Native
INSTALLATION_DIRS+=	lib/php/MDB2/Driver/Reverse

SUBST_CLASSES+=		d2u
SUBST_STAGE.d2u=	post-extract
SUBST_MESSAGE.d2u=	Removing CR end-of-line markers.
SUBST_FILES.d2u=	pdoSqlite.php */pdoSqlite.php 
SUBST_FILTER_CMD.d2u=	${TR} -d '\r'

do-install:
	${INSTALL_DATA} ${WRKSRC}/pdoSqlite.php ${DESTDIR}${PREFIX}/${PEARLIB}/MDB2/Driver/
	${INSTALL_DATA} ${WRKSRC}/Datatype/pdoSqlite.php ${DESTDIR}${PREFIX}/${PEARLIB}/MDB2/Driver/Datatype/
	${INSTALL_DATA} ${WRKSRC}/Function/pdoSqlite.php ${DESTDIR}${PREFIX}/${PEARLIB}/MDB2/Driver/Function/
	${INSTALL_DATA} ${WRKSRC}/Manager/pdoSqlite.php ${DESTDIR}${PREFIX}/${PEARLIB}/MDB2/Driver/Manager/
	${INSTALL_DATA} ${WRKSRC}/Native/pdoSqlite.php ${DESTDIR}${PREFIX}/${PEARLIB}/MDB2/Driver/Native/
	${INSTALL_DATA} ${WRKSRC}/Reverse/pdoSqlite.php ${DESTDIR}${PREFIX}/${PEARLIB}/MDB2/Driver/Reverse/

#.include "../../lang/php/phpversion.mk"
.include "../../mk/bsd.pkg.mk"
