# $NetBSD$

DISTNAME=	ngx_openresty-1.2.8.6
PKGNAME=	${DISTNAME:S/ngx_//}
CATEGORIES=	wip
MASTER_SITES=	http://openresty.org/download/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE
HOMEPAGE=	http://openresty.org/download/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

HAS_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake perl

PKG_SYSCONFSUBDIR=	openresty
OPENRESTY_LOG_DIR?=	${VARBASE}/log/openresty
OPENRESTY_PID_DIR?=	${VARBASE}/run/openresty
OPENRESTY_VAR_DIR?=	${VARBASE}/openresty
CONFIG_SHELL=		${PERL5}

CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-dtrace-probes
CONFIGURE_ARGS+=	--with-http_ssl_module
CONFIGURE_ARGS+=	--with-luajit
CONFIGURE_ARGS+=	--with-pcre
CONFIGURE_ARGS+=	--with-pcre-jit
CONFIGURE_ARGS+=	--sbin-path=${PREFIX}/bin//openresty
CONFIGURE_ARGS+=	--conf-path=${PKG_SYSCONFDIR}/nginx.conf
CONFIGURE_ARGS+=	--error-log-path=${OPENRESTY_LOG_DIR}/error.log
CONFIGURE_ARGS+=	--http-log-path=${OPENRESTY_LOG_DIR}/access.log
CONFIGURE_ARGS+=	--pid-path=${OPENRESTY_PID_DIR}/openresty.pid
CONFIGURE_ARGS+=	--lock-path=${OPERESTY_VAR_DIR}/nginx.lock

.include "../../devel/readline/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
