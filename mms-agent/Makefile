# $NetBSD$
#

DISTNAME=	10gen-mms-agent
PKGNAME=	mms-agent-0
CATEGORIES=	databases
MASTER_SITES=	https://mms.10gen.com/settings/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.10gen.com/products/mongodb-monitoring-service
COMMENT=	MongoDB Monitoring Service agent
#LICENSE=	# TODO: (see mk/license.mk)

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	${PYPKGPREFIX}-mongo>=1.9:../../wip/py-mongo
DEPENDS+=	mongodb>=1.6:../../wip/mongodb

WRKSRC=		${WRKDIR}/mms-agent
USE_LANGUAGES=	# none
NO_BUILD=	yes

PY_SCRIPTS=	agent agentProcess blockingStats confPull getLogs logConfig \
		mmsAgent munin nonBlockingStats settings

SMF_MANIFEST_SRC=	${FILESDIR}/manifest.xml
SMF_METHOD_SRC=		${FILESDIR}/method

MONGODB_DBPATH?=	${VARBASE}/mongodb
MONGODB_USER?=		mongodb
MONGODB_GROUP?=		mongodb
MONGODB_LOGPATH?=	${VARBASE}/log/mongodb

.for var in MONGODB_DBPATH MONGODB_USER MONGODB_GROUP MONGODB_LOGPATH PYTHONBIN
FILES_SUBST+=		${var}=${${var}}
.endfor

INSTALLATION_DIRS+=	share/mms-agent

do-install:
.for script in ${PY_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/${script}.py \
	  ${DESTDIR}${PREFIX}/share/mms-agent/${script}.py
.endfor
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${PREFIX}/share/mms-agent/

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
