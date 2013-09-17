# $NetBSD$

PKGNAME=	${PYPKGPREFIX}-${EGG_NAME}
DISTNAME=	gitosis
CATEGORIES=	devel python
MASTER_SITES=	git://github.com/tv42/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://eagain.net
COMMENT=	Manage git repositories, provide access over SSH	

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../mk/bsd.prefs.mk"

TODAY!=		${DATE} -u +%Y-%m-%d
VERSION!=	${ECHO} ${TODAY} | ${SED} -e "s/-//g"
EGG_NAME=	${DISTNAME}-0.2

NO_CHECKSUM=	yes
PYDISTUTILSPKG= # yes
PLIST_SUBST+=	PYVERSSUFFIX=${PYVERSSUFFIX:Q}

USE_TOOLS+=	git
.if exists(../../devel/git/Makefile
DEPENDS+=	git-base-[0-9]*:../../devel/git-base
.else
DEPENDS+=	scmgit-base-[0-9]*:../../devel/scmgit-base
.endif

do-fetch:
do-extract:
	cd ${WRKDIR} && git clone ${MASTER_SITES}${DISTNAME}.git

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
