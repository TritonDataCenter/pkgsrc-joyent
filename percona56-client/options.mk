# $NetBSD: options.mk,v 1.2 2013/02/18 10:17:20 fhajny Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.percona56

# ndb-cluster does not configure with cmake
PKG_SUPPORTED_OPTIONS+=	embedded-server ndb-cluster memcached ssl sphinx
PKG_SUGGESTED_OPTIONS+=	embedded-server ssl

.include "../../mk/bsd.options.mk"

# Enable OpenSSL support
.if !empty(PKG_OPTIONS:Mssl)
.	include "../../security/openssl/buildlink3.mk"
CMAKE_ARGS+=		-DWITH_SSL=system
.else
CMAKE_ARGS+=		-DWITH_SSL=no
.endif

# Enable InnoDB Memcached support
PLIST_VARS+=		memcached
.if !empty(PKG_OPTIONS:Mmemcached)
PLIST.memcached=	yes
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=ON
CMAKE_ARGS+=		-DWITH_BUNDLED_MEMCACHED=ON
.include "../../devel/libevent/buildlink3.mk"
.else
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=OFF
.endif

# Enable Sphinx SE support
# http://sphinxsearch.com/docs/current.html#sphinxse-overview
PLIST_VARS+=		sphinx
.if !empty(PKG_OPTIONS:Msphinx) || make(distinfo) || make(makesum) || make(mdi)
SPHINX=			sphinx-2.2.11-release
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${SPHINX}.tar.gz
SITES.${SPHINX}.tar.gz=	http://sphinxsearch.com/files/
.  if !empty(PKGPATH:Mjoyent/percona57-server)
MESSAGE_SRC=		${PKGDIR}/MESSAGE ${PKGDIR}/MESSAGE.sphinx
.  endif
PLIST.sphinx=		yes

post-extract:
	${CP} -R ${WRKDIR}/${SPHINX}/mysqlse ${WRKSRC}/storage/sphinx
.endif
