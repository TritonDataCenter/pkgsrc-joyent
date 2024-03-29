# $NetBSD$
#
# For internal Joyent use only, specifically for migration to 2021Q4 image.
#

PKGNAME=	rabbitmq271-${RMQ_VERSION}
DISTNAME=	rabbitmq-server-${RMQ_VERSION}
CATEGORIES=	net
MASTER_SITES=	http://www.rabbitmq.com/releases/rabbitmq-server/v${RMQ_VERSION}/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.rabbitmq.com/server.html
COMMENT=	Implementation of AMQP that provides robust messaging for applications
LICENSE=	mpl-1.1

USE_TOOLS+=		bash:run coreutils gmake unzip zip

BUILD_DEPENDS+=	libxslt-[0-9]*:../../textproc/libxslt
BUILD_DEPENDS+=	xmlto-[0-9]*:../../textproc/xmlto
DEPENDS+=	coreutils-[0-9]*:../../sysutils/coreutils
DEPENDS+=	${PYPKGPREFIX}-simplejson>=2:../../converters/py-simplejson

.include "version.mk"

BUILD_DEFS+=	VARBASE GNU_PROGRAM_PREFIX

.include "../../mk/bsd.prefs.mk"

RMQ_USER?=	rabbitmq
RMQ_GROUP?=	${RMQ_USER}
RMQ_SHELL?=	${TOOLS_PATH.bash}
RMQ_DIR?=	${VARBASE}/db/rabbitmq
RMQ_LOG?=	${VARBASE}/log/rabbitmq

OWN_DIRS+=		${RMQ_DIR} ${RMQ_LOG}
OWN_DIRS_PERMS+=	${RMQ_DIR} ${RMQ_USER} ${RMQ_GROUP} 0770
OWN_DIRS_PERMS+=	${RMQ_LOG} ${RMQ_USER} ${RMQ_GROUP} 0770

PKG_GROUPS+=		${RMQ_GROUP}
PKG_USERS+=		${RMQ_USER}:${RMQ_GROUP}
PKG_GECOS.${RMQ_USER}=	RabbitMQ Server User
PKG_HOME.${RMQ_USER}=	${RMQ_DIR}
PKG_SHELL.${RMQ_USER}=	${RMQ_SHELL}

PKG_SYSCONFSUBDIR=	${PKGBASE}
CONF_FILES+=		${PREFIX}/share/examples/rabbitmq/rabbitmq-env.conf ${PKG_SYSCONFDIR}/rabbitmq-env.conf

INSTALLATION_DIRS+=	share/examples/rabbitmq

SCRIPTS_DIR=		${WRKSRC}/scripts

PLIST_SUBST+=		RMQ_VERSION=${RMQ_VERSION}

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Setting standard paths
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	${SCRIPTS_DIR}/rabbitmqctl ${SCRIPTS_DIR}/rabbitmq-env
SUBST_FILES.paths+=	${SCRIPTS_DIR}/rabbitmq-plugins ${SCRIPTS_DIR}/rabbitmq-server
SUBST_SED.paths=	-e 's|/etc/rabbitmq|${PKG_SYSCONFDIR}|g'
SUBST_SED.paths+=	-e 's|/var/lib|${VARBASE}/db|g'
SUBST_SED.paths+=	-e 's|/var/log|${VARBASE}/log|g'
#SUBST_SED.paths+=	-e 's|@PREFIX@|${PREFIX}|g'
SUBST_SED.paths+=	-e 's|erl|${PREFIX}/lib/erlang14/bin/erl|g'
SUBST_SED.paths+=	-e 's|readlink|${PREFIX}/bin/${GNU_PROGRAM_PREFIX}readlink|g'

REPLACE_BASH+=		${SCRIPTS_DIR}/rabbitmqctl
REPLACE_BASH+=		${SCRIPTS_DIR}/rabbitmq-env
REPLACE_BASH+=		${SCRIPTS_DIR}/rabbitmq-server

MAKE_ENV+=		TARGET_DIR="${DESTDIR}${PREFIX}/lib/erlang/lib/rabbitmq_server-${RMQ_VERSION}"
MAKE_ENV+=		SBIN_DIR="${DESTDIR}${PREFIX}/sbin/"
MAKE_ENV+=		MAN_DIR="${DESTDIR}${PREFIX}/man"
MAKE_ENV+=		RMQ_VERSION=${RMQ_VERSION}
MAKE_ENV+=		MAKE_SHELL="${RMQ_SHELL}"

INSTALL_ENV+=		TARGET_DIR="${DESTDIR}${PREFIX}/lib/erlang/lib/rabbitmq_server-${RMQ_VERSION}"
INSTALL_ENV+=		SBIN_DIR="${DESTDIR}${PREFIX}/sbin/"
INSTALL_ENV+=		MAN_DIR="${DESTDIR}${PREFIX}/man"
INSTALL_ENV+=		RMQ_VERSION=${RMQ_VERSION}
INSTALL_ENV+=		MAKE_SHELL="${RMQ_SHELL}"

PYTHON_VERSIONS_ACCEPTED=	27

REPLACE_PYTHON+=	calculate-relative

post-install:
	${INSTALL_DATA} ${FILESDIR}/rabbitmq-env.conf ${DESTDIR}${PREFIX}/share/examples/rabbitmq/rabbitmq-env.conf

.include "../../joyent/erlang14/buildlink3.mk"
.include "../../lang/python/tool.mk"
.include "../../mk/bsd.pkg.mk"
