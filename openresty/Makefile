# $NetBSD$

DISTNAME=	ngx_openresty-1.5.8.1
PKGNAME=	${DISTNAME:S/ngx_//}
CATEGORIES=	www
MASTER_SITES=	http://openresty.org/download/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://openresty.org/
COMMENT=	Full-fledged web application server
LICENSE=	2-clause-bsd

HAS_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake perl

PKG_SYSCONFSUBDIR=	openresty
OPENRESTY_LOG_DIR?=	${VARBASE}/log/openresty
OPENRESTY_PID_DIR?=	${VARBASE}/run/openresty
OPENRESTY_VAR_DIR?=	${VARBASE}/openresty
CONFIG_SHELL=		${PERL5}

NGINX_VER=	${PKGVERSION_NOREV:C/\.[0-9]+$//}
EGDIR=		${PREFIX}/share/examples/openresty
EGFILES=	fastcgi.conf fastcgi_params koi-utf koi-win mime.types		\
		nginx.conf scgi_params uwsgi_params win-utf

.for file in ${EGFILES}
CONF_FILES+=	${EGDIR}/conf/${file} ${PKG_SYSCONFDIR}/${file}
.endfor

CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-dtrace-probes
CONFIGURE_ARGS+=	--with-http_ssl_module
CONFIGURE_ARGS+=	--with-luajit
CONFIGURE_ARGS+=	--with-pcre
CONFIGURE_ARGS+=	--with-pcre-jit
CONFIGURE_ARGS+=	--sbin-path=${PREFIX}/bin/openresty
CONFIGURE_ARGS+=	--conf-path=${PKG_SYSCONFDIR}/nginx.conf
CONFIGURE_ARGS+=	--error-log-path=${OPENRESTY_LOG_DIR}/error.log
CONFIGURE_ARGS+=	--http-log-path=${OPENRESTY_LOG_DIR}/access.log
CONFIGURE_ARGS+=	--pid-path=${OPENRESTY_PID_DIR}/openresty.pid
CONFIGURE_ARGS+=	--lock-path=${OPERESTY_VAR_DIR}/nginx.lock

MAKE_DIRS+=             ${NGINX_PIDDIR}
OWN_DIRS=               ${NGINX_LOGDIR}
OWN_DIRS_PERMS+=        ${NGINX_DATADIR} ${NGINX_USER} ${NGINX_GROUP} 0700

BUILD_TARGET=           build

SUBST_CLASSES+=         paths
SUBST_STAGE.paths=      pre-configure
SUBST_FILES.paths=      conf/nginx.conf
SUBST_SED.paths=        -e 's,%%PKG_SYSCONFDIR%%,${PKG_SYSCONFDIR},g'
SUBST_SED.paths+=       -e 's,%%NGINX_LOGDIR%%,${NGINX_LOGDIR},g'
SUBST_SED.paths+=       -e 's,%%NGINX_PIDDIR%%,${NGINX_PIDDIR},g'
SUBST_SED.paths+=       -e 's,%%NGINX_USER%%,${NGINX_USER},g'
SUBST_SED.paths+=       -e 's,%%NGINX_GROUP%%,${NGINX_GROUP},g'

MESSAGE_SUBST+=         NGINX_LOGDIR=${NGINX_LOGDIR}
MESSAGE_SUBST+=         NGINX_PIDDIR=${NGINX_PIDDIR}
MESSAGE_SUBST+=         NGINX_USER=${NGINX_USER}
MESSAGE_SUBST+=         NGINX_GROUP=${NGINX_GROUP}

INSTALLATION_DIRS=	${PKGMANDIR}/man8 bin share/examples/openresty/conf	\
                        share/examples/openresty/html
post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/build/nginx-${NGINX_VER}/objs/nginx	\
		 ${DESTDIR}${PREFIX}/bin/openresty
.for file in ${EGFILES}
	${INSTALL_DATA} ${WRKSRC}/build/nginx-${NGINX_VER}/conf/${file}		\
		${DESTDIR}${EGDIR}/conf/${file}
.endfor
	${INSTALL_DATA} ${WRKSRC}/build/nginx-${NGINX_VER}/html/50x.html	\
		${DESTDIR}${EGDIR}/html/50x.html
	${INSTALL_DATA} ${WRKSRC}/build/nginx-${NGINX_VER}/html/index.html	\
		${DESTDIR}${EGDIR}/html/index.html
	${INSTALL_MAN} ${WRKSRC}/build/nginx-${NGINX_VER}/man/nginx.8		\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man8

.include "../../devel/readline/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
