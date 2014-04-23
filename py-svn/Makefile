# $NetBSD$
#

DISTNAME=	pysvn-1.7.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel
MASTER_SITES=	http://pysvn.barrys-emacs.org/source_kits/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://pysvn.tigris.org/
COMMENT=	Python SVN Extension
LICENSE=	apache-1.1

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	c c++

WRKSRC=			${WRKDIR}/${DISTNAME}/Source
INSTALLATION_DIRS+=	${PYSITELIB}/pysvn
PY_PATCHPLIST=		yes
PLIST_SUBST+=		PYVER=${PYVERSSUFFIX:S/./_/}

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_MESSAGE.path=	Fixing default paths
SUBST_FILES.path=	setup_configure.py
SUBST_SED.path=		-e 's,/usr/pkg,${PREFIX},g'

do-configure:
	cd ${WRKSRC} && \
	 ${SETENV} ${MAKE_ENV} ${PYTHONBIN} setup.py configure

do-install:
	${INSTALL_LIB} ${WRKSRC}/pysvn/__init__.py \
		${DESTDIR}${PREFIX}/${PYSITELIB}/pysvn/
	${INSTALL_LIB} ${WRKSRC}/pysvn/_pysvn_${PYVERSSUFFIX:S/./_/}.so \
		${DESTDIR}${PREFIX}/${PYSITELIB}/pysvn/

do-test:
	cd ${WRKSRC}/../Tests && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM}

.include "../../devel/apr/buildlink3.mk"
.include "../../devel/subversion-base/buildlink3.mk"
.include "../../lang/python/extension.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
