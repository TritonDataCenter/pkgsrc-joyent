# $NetBSD$
#

DISTNAME=		node-v0.6.14
PKGNAME=		${DISTNAME:S/-v/js-/}
CATEGORIES=		devel
MASTER_SITES=		http://nodejs.org/dist/${DISTNAME:S/node-//}/

MAINTAINER=		filip@joyent.com
HOMEPAGE=		http://nodejs.org/
COMMENT=		Evented I/O for V8 javascript
LICENSE=		mit

PKG_DESTDIR_SUPPORT=	user-destdir

HAS_CONFIGURE=		yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake pkg-config

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

PYTHON_FOR_BUILD_ONLY=	yes
PYTHON_VERSIONS_INCOMPATIBLE=	31

REPLACE_PYTHON+=	tools/node-waf tools/waf-light
MAKE_ENV+=		PYTHON=${PYTHONBIN}

SUBST_CLASSES+=		pkgsrc
SUBST_STAGE.pkgsrc=	post-patch
SUBST_MESSAGE.pkgsrc=	Fixing for pkgsrc
SUBST_FILES.pkgsrc=	wscript tools/waf-light
SUBST_SED.pkgsrc=	-e 's,@PYTHONBIN@,${PYTHONBIN:Q},g'
SUBST_SED.pkgsrc+=	-e 's,@PKGMANDIR@,${PKGMANDIR:Q},g'

CHECK_PORTABILITY_SKIP+=	benchmark/http_simple_bench.sh
CHECK_PORTABILITY_SKIP+=	deps/v8/tools/linux-tick-processor

CHECK_INTERPRETER_SKIP+=	bin/npm
CHECK_INTERPRETER_SKIP+=	lib/node/wafadmin/*
CHECK_INTERPRETER_SKIP+=	lib/node_modules/npm/*

PLIST_VARS+=	dtrace

NODEJS_USER?=		node
NODEJS_GROUP?=		node
NODEJS_HOME?=		${HOMEBASE}/${NODEJS_USER}

PKG_GROUPS+=		${NODEJS_GROUP}
PKG_USERS+=		${NODEJS_USER}:${NODEJS_GROUP}
PKG_GECOS.${NODEJS_USER}=	Node.JS daemon user
PKG_HOME.${NODEJS_USER}=	${NODEJS_HOME}
PKG_SHELL.${NODEJS_USER}=	${COMMAND_SHELL}

OWN_DIRS+=		${NODEJS_HOME}
OWN_DIRS_PERMS+=	${NODEJS_HOME} ${NODEJS_USER} ${NODEJS_GROUP} 0750

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
