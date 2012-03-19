# $NetBSD$
#

PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/python-//}
DISTNAME=	python-memcached-1.44
CATEGORIES=	databases
MASTER_SITES=	ftp://ftp.tummy.com/pub/python-memcached/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	ftp://ftp.tummy.com/pub/python-memcached/
COMMENT=	Pure python memcached client

PYDISTUTILSPKG=	yes
PY_PATCHPLIST=	yes
PLIST_SUBST+=	PYVERSSUFFIX=${PYVERSSUFFIX}
PLIST_SUBST+=	EGG_NAME=${EGG_NAME}

CHECK_FILES_SKIP+=	${PREFIX}/${PYSITELIB}/easy-install.pth
EGG_NAME=	${DISTNAME:S/python-/python_/}-py${PYVERSSUFFIX}.egg

USE_LANGUAGES=	# none

post-install:
	${ECHO} ./${EGG_NAME} > ${DESTDIR}${PREFIX}/${PYSITELIB}/memcache.pth

.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
