# $NetBSD$
#

DISTNAME=	pysvn-1.7.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel
MASTER_SITES=	http://pysvn.barrys-emacs.org/source_kits/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://pysvn.tigris.org/
COMMENT=	Python SVN Extension
LICENSE=	apache-1.1

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	c c++

WRKSRC=		${WRKDIR}/${DISTNAME}/Source
INSTALLATION_DIRS+=	${PYSITELIB}/pysvn
PY_PATCHPLIST=	yes
PLIST_SUBST+=	PYVER=${PYVERSSUFFIX:S/./_/}

BUILD_DEPENDS+=	${PYPKGPREFIX}-expat-[0-9]*:../../textproc/py-expat

do-configure:
	(cd ${WRKSRC} && \
	 ${SETENV} ${MAKE_ENV} ${PYTHONBIN} setup.py backport && \
	 ${SETENV} ${MAKE_ENV} ${PYTHONBIN} setup.py configure \
	 --apr-inc-dir=${BUILDLINK_PREFIX.apr}/include/apr-1)

do-install:
	${INSTALL_LIB} ${WRKSRC}/pysvn/__init__.py ${DESTDIR}${PREFIX}/${PYSITELIB}/pysvn/
	${INSTALL_LIB} ${WRKSRC}/pysvn/_pysvn_${PYVERSSUFFIX:S/./_/}.so ${DESTDIR}${PREFIX}/${PYSITELIB}/pysvn/

.include "../../devel/apr/buildlink3.mk"
.include "../../devel/subversion-base/buildlink3.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
