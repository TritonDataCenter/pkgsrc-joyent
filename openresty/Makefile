# $NetBSD$

DISTNAME=	ngx_openresty-1.7.4.1
PKGNAME=	${DISTNAME:S/ngx_//}
CATEGORIES=	wip
MASTER_SITES=	http://openresty.org/download/

MAINTAINER=	operations@sphonic.com
HOMEPAGE=	http://openresty.org/download/
COMMENT=	a fast web app server by extending nginx
LICENSE=	2-clause-bsd

HAS_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake perl

OPENRESTY_USER?=        openresty
OPENRESTY_GROUP?=       openresty

PKG_SYSCONFSUBDIR=	openresty
OPENRESTY_LOG_DIR?=	${VARBASE}/log/openresty
OPENRESTY_PID_DIR?=	${VARBASE}/run/openresty
OPENRESTY_VAR_DIR?=	${VARBASE}/openresty
CONFIG_SHELL=		${PERL5}

PKG_USERS_VARS+=        OPENRESTY_USER
PKG_GROUPS_VARS+=       OPENRESTY_GROUP
PKG_GROUPS=             ${OPENRESTY_GROUP}
PKG_USERS=              ${OPENRESTY_USER}:${OPENRESTY_GROUP}

MAKE_DIRS+=             ${OPENRESTY_PID_DIR}
OWN_DIRS=               ${OPENRESTY_LOG_DIR}
OWN_DIRS_PERMS+=        ${OPENRESTY_VAR_DIR} ${OPENRESTY_USER} ${OPENRESTY_GROUP} 0700

PKG_GECOS.${OPENRESTY_USER}=OpenResty server user
PKG_HOME.${OPENRESTY_USER}= ${OPENRESTY_DATADIR}
PKG_SHELL.${OPENRESTY_USER}=${NOLOGIN}

CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-dtrace-probes
CONFIGURE_ARGS+=	--with-http_ssl_module
CONFIGURE_ARGS+=	--with-luajit
CONFIGURE_ARGS+=	--with-pcre
CONFIGURE_ARGS+=	--with-pcre-jit
CONFIGURE_ARGS+=	--sbin-path=${PREFIX}/sbin/openresty
CONFIGURE_ARGS+=	--conf-path=${PKG_SYSCONFDIR}/nginx.conf
CONFIGURE_ARGS+=	--error-log-path=${OPENRESTY_LOG_DIR}/error.log
CONFIGURE_ARGS+=	--http-log-path=${OPENRESTY_LOG_DIR}/access.log
CONFIGURE_ARGS+=	--pid-path=${OPENRESTY_PID_DIR}/openresty.pid
CONFIGURE_ARGS+=	--lock-path=${OPERESTY_VAR_DIR}/nginx.lock

.include "../../devel/readline/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
