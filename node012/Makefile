# $NetBSD$
#

DISTNAME=	node-v0.12.13
PKGNAME=	${DISTNAME:S/-v/js-/}
CATEGORIES=	devel
MASTER_SITES=	http://nodejs.org/dist/${DISTNAME:S/node-//}/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://nodejs.org/
COMMENT=	V8 JavaScript for clients and servers
LICENSE=	mit

HAS_CONFIGURE=	yes
USE_TOOLS+=	gmake pkg-config
USE_LANGUAGES=	c c++

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

SUBST_CLASSES+=		python
SUBST_STAGE.python=	pre-configure
SUBST_MESSAGE.python=	Fixing Python references
SUBST_FILES.python=	deps/v8/tools/gyp/v8.gyp
SUBST_VARS.python=	PYTHONBIN

SUBST_CLASSES+=		man
SUBST_STAGE.man=	pre-configure
SUBST_MESSAGE.man=	Fixing man path
SUBST_FILES.man=	tools/install.py
SUBST_VARS.man=		PKGMANDIR

CONFIG_SHELL=		${PYTHONBIN}
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--shared-zlib
CONFIGURE_ARGS+=	--with-intl=system-icu

.if ${OPSYS} == "NetBSD"
CONFIGURE_ENV+=		GYP_DEFINES="OS=netbsd"
MAKE_ENV+=		GYP_DEFINES="OS=netbsd"
.endif

REPLACE_PYTHON+=	configure
REPLACE_PYTHON+=	tools/genv8constants.py
REPLACE_PYTHON+=	tools/gyp/pylib/gyp/flock_tool.py

CHECK_INTERPRETER_SKIP=	lib/node_modules/npm/*
CHECK_PORTABILITY_SKIP=	deps/v8/tools/run-llprof.sh

.if ${OPSYS} == "NetBSD"
BUILD_DEPENDS+=	lockf-[0-9]*:../../sysutils/lockf
.endif

TEST_TARGET=		test

pre-install:
	${FIND} ${WRKSRC}/deps/npm -name '*.orig' | ${XARGS} ${RM} -f

.include "../../devel/libexecinfo/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/tool.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
