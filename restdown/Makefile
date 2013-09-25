# $NetBSD$
#

DISTNAME=	restdown-1.3.2
CATEGORIES=	devel python
MASTER_SITES=	-https://nodeload.github.com/trentm/restdown/tar.gz/1.3.2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/trentm/restdown
COMMENT=	Pretty REST API docs authored in Markdown
LICENSE=	mit

USE_TOOLS+=	pax

INSTALLATION_DIRS=	bin share/restdown/brand

CHECK_INTERPRETER_SKIP=	share/restdown/externals/lib/markdown2.py
REPLACE_PYTHON=		bin/restdown

SUBST_CLASSES+=		vars
SUBST_STAGE.vars=	pre-build
SUBST_FILES.vars=	bin/restdown
SUBST_VARS.vars=	PREFIX

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/restdown ${DESTDIR}${PREFIX}/bin
	(cd ${WRKSRC}; ${PAX} -rwppm externals ${DESTDIR}${PREFIX}/share/restdown/)
	(cd ${WRKSRC}/brand; ${PAX} -rwppm ohthejoy ${DESTDIR}${PREFIX}/share/restdown/brand/)

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
