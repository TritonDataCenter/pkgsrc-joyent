# $NetBSD$
#

DISTNAME=	joyent-tools-${VERSION}
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.joyent.com/
COMMENT=	Various tools relevant to Joyent SmartOS and products
#LICENSE=	#

PKG_DESTDIR_SUPPORT=	user-destdir

NO_BUILD=	yes
WRKSRC=		${WRKDIR}

VERSION=	20120608

.include "../../mk/bsd.prefs.mk"

SCRIPTS=	machine-info machine-upgrade pkghelp
PKGIN_HELPERS=	apt-get apt-cache pkg port rpm yum

SUNOS_FLAVOR?=	joyent
.if ${SUNOS_FLAVOR} == "joyent"
PLATFORM=	sdc6
.else
PLATFORM=	sdc5
.endif

FILES_SUBST+=	PLATFORM=${PLATFORM}
FILES_SUBST+=	PKGRELEASE=${PKGRELEASE}
FILES_SUBST+=	MACHINE_ARCH=${MACHINE_ARCH}
FILES_SUBST+=	MYSQL_VERSION_DEFAULT=${MYSQL_VERSION_DEFAULT}
FILES_SUBST+=	PGSQL_VERSION_DEFAULT=${PGSQL_VERSION_DEFAULT}
FILES_SUBST+=	PYTHON_VERSION_DEFAULT=${PYTHON_VERSION_DEFAULT}
FILES_SUBST+=	PHP_VERSION_DEFAULT=${PHP_VERSION_DEFAULT}
FILES_SUBST+=	RUBY_VERSION_DEFAULT=${RUBY_VERSION_DEFAULT}
FILES_SUBST+=	RUBY_RAILS_DEFAULT=${RUBY_RAILS_DEFAULT}

INSTALLATION_DIRS+=	bin

do-extract:
.	for file in ${SCRIPTS}
	${SED} ${FILES_SUBST_SED} ${FILESDIR}/${file} > ${WRKSRC}/${file}
.	endfor

do-install:
.	for file in ${SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/${file} ${DESTDIR}${PREFIX}/bin/${file}
.	endfor
.	for helper in ${PKGIN_HELPERS}
	${LN} -s pkghelp ${DESTDIR}${PREFIX}/bin/${helper}
.	endfor

.include "../../mk/bsd.pkg.mk"
