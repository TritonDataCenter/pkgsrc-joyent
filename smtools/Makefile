# $NetBSD$

DISTNAME=	20200715
PKGNAME=	smtools-${DISTNAME}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=joyent/smtools/archive/}

MAINTAINER=	jperkin@joyent.com
HOMEPAGE=	https://github.com/joyent/smtools/
COMMENT=	Joyent tools relevant to SmartOS and SmartMachines
LICENSE=	mpl-2.0

WRKSRC=		${WRKDIR}/${PKGNAME_NOREV}
NO_BUILD=	yes

SM_SCRIPTS=	cpuinfo create-db create-dbuser create-vhost	\
		install-drupal install-wordpress list-dbs	\
		list-dbusers list-timezones meminfo		\
		prepare-image reboot remove-db			\
		remove-dbuser set-hostname set-timezone		\
		shutdown summary sync-to-master lsof
ZONEINIT_INCS=	00-mdata.sh 01-reboot-file.sh 02-config.sh	\
		04-mdata.sh					\
		11-files.sh 12-network.sh 91-passwords.sh	\
		92-sshd.sh 999-cleanup.sh

ZONEINIT_DATA=		zoneinit.json zoneinit.xml mdata.xml
ZONEINIT_SCRIPTS=	zoneinit mdata-execute mdata-fetch

INSTALLATION_DIRS+=	bin lib/zoneinit lib/zoneinit/includes

SUBST_CLASSES+=		vars
SUBST_STAGE.vars=	pre-configure
SUBST_FILES.vars=	sm-* zoneinit/zoneinit* zoneinit/includes/*
SUBST_VARS.vars=	PREFIX PKG_SYSCONFBASE VARBASE

do-install:
.for file in ${SM_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/sm-${file} \
		${DESTDIR}${PREFIX}/bin/sm-${file}
.endfor
	${LN} -s sm-lsof ${DESTDIR}${PREFIX}/bin/lsof
.for file in ${ZONEINIT_DATA}
	${INSTALL_DATA} ${WRKSRC}/zoneinit/${file} \
		${DESTDIR}${PREFIX}/lib/zoneinit/${file}
.endfor
.for file in ${ZONEINIT_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit/${file} \
		${DESTDIR}${PREFIX}/lib/zoneinit/${file}
.endfor
.for file in ${ZONEINIT_INCS}
	${INSTALL_DATA} ${WRKSRC}/zoneinit/includes/${file} \
		${DESTDIR}${PREFIX}/lib/zoneinit/includes/${file}
.endfor

.include "../../mk/bsd.pkg.mk"
