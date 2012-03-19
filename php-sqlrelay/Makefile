# $NetBSD: Makefile,v 1.20 2011/06/10 21:57:06 obache Exp $

DISTNAME=		sqlrelay-0.43
PKGNAME=		${PHP_PKG_PREFIX}-${DISTNAME}
CATEGORIES=		databases
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=sqlrelay/}
EXTRACT_SUFX=		.tar.gz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://sqlrelay.sourceforge.net/
COMMENT=		PHP extension for SQLRelay
LICENSE=		gnu-gpl-v2 AND gnu-lgpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		YES
USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake
USE_LIBTOOL=		YES

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}
CONFIGURE_ARGS+=	--with-php-prefix=${BUILDLINK_PREFIX.php:Q}
CONFIGURE_ARGS+=	--disable-oracle
CONFIGURE_ARGS+=	--disable-sybase
CONFIGURE_ARGS+=	--disable-db2
CONFIGURE_ARGS+=	--disable-mdbtools
CONFIGURE_ARGS+=	--disable-python
CONFIGURE_ARGS+=	--disable-zope
CONFIGURE_ARGS+=	--disable-ruby
CONFIGURE_ARGS+=	--disable-java
CONFIGURE_ARGS+=	--disable-tcl
CONFIGURE_ARGS+=	--disable-erlang
CONFIGURE_ARGS+=	--disable-firebird
CONFIGURE_ARGS+=	--disable-perl
CONFIGURE_ARGS+=	--disable-mysql
CONFIGURE_ARGS+=	--disable-postgresql
CONFIGURE_ARGS+=	--disable-sqlite
CONFIGURE_ARGS+=	--disable-odbc
CONFIGURE_ARGS+=	--disable-freetds
CONFIGURE_ARGS+=	--with-rudiments-prefix=${BUILDLINK_PREFIX.rudiments}
MAKE_ENV+=		EXAMPLESDIR=${EGDIR:Q}

BUILD_DIRS=		src/api/php src/api/phppeardb

.include "../../joyent/sqlrelay/buildlink3.mk"
.include "../../lang/php/phpversion.mk"
.include "${PHPPKGSRCDIR}/Makefile.common"
.include "${PHPPKGSRCDIR}/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
