# $NetBSD$

DISTNAME=	trafficserver-5.3.1
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_APACHE:=trafficserver/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://trafficserver.apache.org/
COMMENT=	Fast, scalable and extensible caching proxy server
LICENSE=	apache-2.0

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	bash:run gmake perl:run pkg-config

.include "../../mk/bsd.prefs.mk"

.include "options.mk"

BODY_FILES+=	.body_factory_info access__denied access__proxy_auth_required	\
		access__redirect_url access__ssl_forbidden cache__not_in_cache	\
		cache__read_error congestion__retryAfter connect__dns_failed	\
		connect__failed_connect connect__hangup default			\
		interception__no_host redirect__moved_permanently		\
		redirect__moved_temporarily request__cycle_detected		\
		request__invalid_content_length request__no_content_length	\
		request__no_host request__scheme_unsupported			\
		request__syntax_error response__bad_response			\
		response__bad_version timeout__activity	timeout__inactivity	\
		transcoding__unsupported urlrouting__no_mapping

CONFIG_FILES+=	cache cluster congestion hosting icp ip_allow log_hosts		\
		logs_xml parent plugin prefetch records remap socks splitdns	\
		ssl_multicert storage update vaddrs volume

EGDIR=			share/examples/${PKGBASE}

PKG_SYSCONFSUBDIR=	${PKGBASE}
PKG_SYSCONFDIR_PERMS+=	${TS_USER} ${TS_GROUP} 0755
MAKE_DIRS_PERMS+=	${PKG_SYSCONFDIR}/body_factory/default			\
			${TS_USER} ${TS_GROUP} 0755
MAKE_DIRS_PERMS+=	${PKG_SYSCONFDIR}/snapshots				\
			${TS_USER} ${TS_GROUP} 0755
OWN_DIRS_PERMS+=	${TS_DIR} ${TS_USER} ${TS_GROUP} 0755
OWN_DIRS_PERMS+=	${TS_LOGDIR} ${TS_USER} ${TS_GROUP} 0755

.for file in ${BODY_FILES}
CONF_FILES_PERMS+=	${EGDIR}/body_factory/default/${file:S/__/\#/}		\
			${PKG_SYSCONFDIR}/body_factory/default/${file:S/__/\#/}	\
			${TS_USER} ${TS_GROUP} 0644
.endfor
.for file in ${CONFIG_FILES}
CONF_FILES_PERMS+=	${EGDIR}/${file}.config.default				\
			${PKG_SYSCONFDIR}/${file}.config 			\
			${TS_USER} ${TS_GROUP} 0644
.endfor
CONF_FILES_PERMS+=	${EGDIR}/stats.config.xml.default			\
			${PKG_SYSCONFDIR}/stats.config.xml			\
			${TS_USER} ${TS_GROUP} 0644

TS_USER?=		trafserv
TS_GROUP?=		trafserv
TS_DIR=			${VARBASE}/trafficserver
TS_LOGDIR=		${VARBASE}/log/trafficserver

PKG_GROUPS=		${TS_GROUP}
PKG_USERS=		${TS_USER}:${TS_GROUP}
PKG_GROUPS_VARS=	TS_GROUP
PKG_USERS_VARS=		TS_USER
PKG_GECOS.${TS_USER}=	TrafficServer user
PKG_HOME.${TS_USER}=	${TS_DIR}
PKG_SHELL.${TS_USER}=	${NOLOGIN}

PERL5_CONFIGURE=	no

CONFIGURE_ARGS+=	--enable-cppapi
CONFIGURE_ARGS+=	--enable-luajit
CONFIGURE_ARGS+=	--disable-silent-rules
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}
CONFIGURE_ARGS+=	--with-expat=${BUILDLINK_PREFIX.expat}
CONFIGURE_ARGS+=	--with-group=${TS_GROUP}
CONFIGURE_ARGS+=	--with-user=${TS_USER}
CONFIGURE_ARGS+=	--with-xml=expat

.if ${OPSYS} == "SunOS"
CONFIGURE_ENV+=		ac_cv_func_epoll_ctl=no
.endif

REPLACE_BASH+=		tools/tsxs.in
REPLACE_PERL+=		tools/tspush

INSTALL_MAKE_FLAGS+=	pkgsysconfdir=${PREFIX}/share/examples/trafficserver
INSTALL_MAKE_FLAGS+=	${MAKE_PARAMS}

PKGCONFIG_OVERRIDE+=	lib/ck/build/ck.pc.in
PKGCONFIG_OVERRIDE+=	tools/trafficserver.pc.in

SMF_SRCDIR=		${WRKSRC}/rc
SMF_MANIFEST=		trafficserver.xml

.include "../../devel/libexecinfo/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../lang/tcl/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
