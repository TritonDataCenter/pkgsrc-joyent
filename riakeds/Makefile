# $NetBSD$
#

DISTNAME=		riak_ee-1.0.3
PKGNAME=		${DISTNAME:S/_ee/eds/}
CATEGORIES=		none
MASTER_SITES=		#

MAINTAINER=		filip@joyent.com
HOMEPAGE=		http://www.basho.com/products_riak_overview.php
COMMENT=		Distributed, highly available data store
LICENSE=		apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++
USE_TOOLS=		gmake

DEPENDS+=		sudo-[0-9]*:../../security/sudo

DISTFILES=		${DEFAULT_DISTFILES}
EXTRACT_ONLY=		${DISTNAME}${EXTRACT_SUFX}
INNOVER=		1.0.3
INNOSTORE=		innostore-${INNOVER}.tar.gz
SITES.${INNOSTORE}=	http://downloads.basho.com/innostore/innostore-${INNOVER}/
DISTFILES+=		${INNOSTORE}
EXTRACT_ONLY+=		${INNOSTORE}

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

RIAK_USER?=		riak
RIAK_GROUP?=		${RIAK_USER}
RIAK_DATA?=		${VARBASE}/db/riak
RIAK_LOG?=		${VARBASE}/log/riak
RIAK_HOME?=		${RIAK_DATA}

PKG_GROUPS+=		${RIAK_GROUP}
PKG_USERS+=		${RIAK_USER}:${RIAK_GROUP}
PKG_HOME.${RIAK_USER}=	${RIAK_DATA}

OWN_DIRS+=		${RIAK_DATA} ${RIAK_LOG} ${RIAK_DATA}/snmp
OWN_DIRS+=		${RIAK_DATA}/snmp/agent ${RIAK_DATA}/snmp/agent/db
OWN_DIRS+=		${PKG_SYSCONFDIR}/snmp/agent/conf
OWN_DIRS_PERMS+=	${RIAK_DATA} ${RIAK_USER} ${RIAK_GROUP} 0770
OWN_DIRS_PERMS+=	${RIAK_LOG} ${RIAK_USER} ${RIAK_GROUP} 0770
OWN_DIRS_PERMS+=	${RIAK_DATA}/snmp ${RIAK_USER} ${RIAK_GROUP} 0770
OWN_DIRS_PERMS+=	${RIAK_DATA}/snmp/agent ${RIAK_USER} ${RIAK_GROUP} 0770
OWN_DIRS_PERMS+=	${RIAK_DATA}/snmp/agent/db ${RIAK_USER} ${RIAK_GROUP} 0770

PKG_SYSCONFSUBDIR=	riak
SNMP_FILES+=		agent.conf vacm.conf community.conf standard.conf
SNMP_FILES+=		usm.conf context.conf notify.conf target_params.conf
SNMP_FILES+=		target_addr.conf

CONF_FILES+=		share/examples/riak/app.config ${PKG_SYSCONFDIR}/app.config
CONF_FILES+=		share/examples/riak/vm.args ${PKG_SYSCONFDIR}/vm.args
.for file in ${SNMP_FILES}
CONF_FILES+=		share/examples/riak/snmp/agent/conf/${file} \
			${PKG_SYSCONFDIR}/snmp/agent/conf/${file}
.endfor

BUILD_TARGET=		rel
PLIST_VARS+=		innostore
PLIST_SUBST+=		INNOVER=${INNOVER}

.if !empty(PKG_BUILD_OPTIONS.erlang:Mdtrace)
PLIST_SRC=		${PLIST_SRC_DFLT}
PLIST_SRC+=		PLIST.dtrace
.endif

SUBST_CLASSES+=		pkgsrc
SUBST_STAGE.pkgsrc=	post-patch
SUBST_MESSAGE.pkgsrc=	Fixing pkgsrc locations and tools
SUBST_FILES.pkgsrc=	deps/erlang_js/c_src/Makefile
SUBST_FILES.pkgsrc+=	rel/vars.config
SUBST_VARS.pkgsrc=	PATCH PREFIX PKG_SYSCONFDIR
SUBST_VARS.pkgsrc+=	RIAK_USER RIAK_DATA RIAK_LOG

REPLACE_INTERPRETER+=	escript
REPLACE.escript.old=	.*escript
REPLACE.escript.new=	${BUILDLINK_PREFIX.erlang}/bin/escript
REPLACE_FILES.escript=	rel/files/nodetool
REPLACE_FILES.escript+=	${WRKDIR}/innostore-${INNOVER}/priv/innodump
REPLACE_FILES.escript+=	${WRKDIR}/innostore-${INNOVER}/priv/innoload

CHECK_PORTABILITY_SKIP+=	tests/riak_search/run_all.sh

INSTALL_ENV+=		REPO=riak_ee
INSTALL_ENV+=		REVISION=${PKGVERSION_NOREV}
INSTALL_ENV+=		OPSYS=${OPSYS}
INSTALL_ENV+=		MACHINE_ARCH=${MACHINE_ARCH}

FETCH_MESSAGE =		" The file ${DISTNAME}${EXTRACT_SUFX} must be fetched"
FETCH_MESSAGE+=		" from the Basho site, and saved to"
FETCH_MESSAGE+=		" ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"
PKGREPOSITORYSUBDIR=	restricted

post-extract:
	${CHMOD} -R u=rwX,g=rX,o=rX ${WRKDIR}/innostore-${INNOVER}

do-install:
	${MKDIR} ${WRKSRC}/package/pkgsrc
	${INSTALL_DATA} ${FILESDIR}/Makefile ${WRKSRC}/package/pkgsrc
	cd ${WRKSRC}/package && ${SETENV} ${INSTALL_ENV} ${MAKE_ENV}    \
           ${MAKE_PROGRAM} ${MAKE_FLAGS} ${INSTALL_MAKE_FLAGS} package

post-install:
	${INSTALL_LIB} ${FILESDIR}/libumem.so.1_${ABI} ${DESTDIR}${PREFIX}/riak/lib/libumem.so.1

.include "../../lang/erlang/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
