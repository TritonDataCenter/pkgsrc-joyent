# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.percona

# ndb-cluster does not configure with cmake
PKG_SUPPORTED_OPTIONS+=	dtrace embedded-server ndb-cluster memcached
# Sphinx doesn't support MySQL 5.7 yet
# PKG_SUPPORTED_OPTIONS+=	sphinx
PKG_SUGGESTED_OPTIONS+=	embedded-server

.if ${OPSYS} == "SunOS"
PKG_SUGGESTED_OPTIONS+=	dtrace
.endif

.include "../../mk/bsd.options.mk"

# Enable DTrace support
.if !empty(PKG_OPTIONS:Mdtrace)
CMAKE_ARGS+=		-DENABLE_DTRACE=ON
.  if !empty(ABI)
CMAKE_ARGS+=		-DDTRACE_FLAGS="-${ABI}"
.  endif
.else
CMAKE_ARGS+=		-DENABLE_DTRACE=OFF
.endif

# Enable InnoDB Memcached support
PLIST_VARS+=		memcached
.if !empty(PKG_OPTIONS:Mmemcached)
PLIST.memcached=	yes
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=ON
CMAKE_ARGS+=		-DWITH_BUNDLED_MEMCACHED=ON
CMAKE_ARGS+=		-DWITH_LIBEVENT=system
.include "../../devel/libevent/buildlink3.mk"
.else
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=OFF
.endif

# Enable Sphinx SE support
# http://sphinxsearch.com/docs/current.html#sphinxse-overview
PLIST_VARS+=	sphinx
.if !empty(PKG_OPTIONS:Msphinx) || make(distinfo) || make(makesum) || make(mdi)
SPHINX=		sphinx-2.2.11-release
DISTFILES+=	${SPHINX}.tar.gz
SITES.${SPHINX}.tar.gz=	http://sphinxsearch.com/files/
.  if !empty(PKGPATH:Mjoyent/percona57-server)
MESSAGE_SRC=	${PKGDIR}/MESSAGE ${PKGDIR}/MESSAGE.sphinx
.  endif
PLIST.sphinx=	yes

post-extract:
	${CP} -R ${WRKDIR}/${SPHINX}/mysqlse ${WRKSRC}/storage/sphinx
.endif
