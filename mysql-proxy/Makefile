# $NetBSD$
#

DISTNAME=	mysql-proxy-0.8.3
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_MYSQL:=MySQL-Proxy/}

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://dev.mysql.com/downloads/mysql-proxy/
COMMENT=	Monitor, analyze, or transform the communication of MySQL
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_CMAKE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	mysql-chassis.pc.in
PKGCONFIG_OVERRIDE+=	mysql-proxy.pc.in

CONFIGURE_ARGS+=	--enable-dtrace
CONFIGURE_ARGS+=	--enable-self-contained
CONFIGURE_ARGS+=	--with-lua

LIBS.SunOS+=	-lnsl -lsocket
MAKE_JOBS_SAFE=	no

CMAKE_ARGS+=	-DCMAKE_VERBOSE_MAKEFILE=true

post-extract:
	cd ${WRKSRC} && ${LN} -sf ../../suite/lua-tests-wrapper.sh.in \
	  tests/unit/lua/lua-tests-wrapper.sh.in

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libevent/buildlink3.mk"
.include "../../lang/lua/buildlink3.mk"
.include "../../mk/mysql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
