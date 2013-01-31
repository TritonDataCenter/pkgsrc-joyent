# $NetBSD$
#

DISTNAME=	handlersocket_1.1.0-7-g1044a28.orig
PKGNAME=	handlersocket-1.1.0
CATEGORIES=	databases
MASTER_SITES=	http://launchpad.net/ubuntu/+archive/primary/+files/

MAINTAINER=	pkgsrc-users@netbsd.org
HOMEPAGE=	http://www.percona.com/software/percona-xtrabackup
COMMENT=	HandlerSocket

# Requires MySQL source tree
MYSQL=			Percona-Server-5.5.29-rel29.4
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} ${MYSQL}.tar.gz
SITES.${MYSQL}.tar.gz=	http://www.percona.com/redir/downloads/Percona-Server-5.5/Percona-Server-5.5.29-29.4/source/

DEPENDS+=	percona-server-[0-9*:../../joyent/percona55-server

USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	aclocal autoconf autoheader automake gmake

WRKSRC=		${WRKDIR}/DeNADev-HandlerSocket-Plugin-for-MySQL-1044a28

#CFLAGS+=	-I${PREFIX}/include/mysql
LDFLAGS.SunOS+=	-lsocket -lnsl -lxnet

do-configure:
	${RUN} cd ${WRKSRC} && \
            ./autogen.sh && \
            ${CONFIGURE_ENV} ./configure --with-mysql-source=${WRKDIR}/${MYSQL} \
                        --with-mysql-bindir=${PREFIX}/bin \
                        --with-mysql-plugindir=${PREFIX}/lib/mysql/plugin

.include "../../joyent/percona55-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
