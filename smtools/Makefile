# $NetBSD$
#

DISTNAME=	smtools
PKGNAME=	${DISTNAME}-${PKGVERSION}
CATEGORIES=	sysutils
PKGVERSION=	20140121

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.joyent.com/
COMMENT=	Joyent tools relevant to SmartOS and SmartMachines
#LICENSE=	#

PKG_DESTDIR_SUPPORT=	user-destdir

GIT_REPOSITORIES=	smtools
GIT_REPO.smtools=	git@git.joyent.com:smtools.git
GIT_TAG=		${PKGVERSION}

NO_CHECKSUM=	yes
NO_BUILD=	yes

.include "../../mk/bsd.prefs.mk"

SM_SCRIPTS=	cpuinfo create-db create-dbuser create-vhost	\
		install-drupal install-wordpress list-dbs	\
		list-dbusers list-timezones meminfo pkghelp	\
		prepare-image reboot rebuild-pkgsrc remove-db	\
		remove-dbuser set-hostname set-timezone 	\
		shutdown summary sync-to-master lsof tune-mysql
ZONEINIT_INCS=	00-mdata.sh 01-reboot-file.sh 02-config.sh	\
		04-mdata.sh		\
		11-files.sh 12-network.sh 91-passwords.sh	\
		92-sshd.sh 999-cleanup.sh
PKGIN_HELPERS=	apt-get apt-cache pkg port rpm yum

SUNOS_FLAVOR?=	joyent
.if ${SUNOS_FLAVOR} == "joyent"
. if defined(CURRENT_PBULK_CONF)
PLATFORM=	packages/SmartOS
PKGRELEASE=	${CURRENT_PBULK_CONF:C/-.*//}
. else
PLATFORM=	sdc6
. endif
.else
PLATFORM=	sdc5
.endif

INSTALLATION_DIRS+=	bin lib/zoneinit lib/zoneinit/includes

SUBST_CLASSES+=	vars
SUBST_STAGE.vars=	post-patch
SUBST_MESSAGE.vars=	Configuring scripts
SUBST_FILES.vars=	sm-prepare-image sm-rebuild-pkgsrc zoneinit/zoneinit.xml
SUBST_VARS.vars=	PREFIX PKG_SYSCONFDIR VARBASE PLATFORM PKGRELEASE MACHINE_ARCH
SUBST_VARS.vars+=	MYSQL_VERSION_DEFAULT PGSQL_VERSION_DEFAULT
SUBST_VARS.vars+=	PHP_VERSION_DEFAULT PYTHON_VERSION_DEFAULT
SUBST_VARS.vars+=	RUBY_VERSION_DEFAULT RUBY_RAILS_DEFAULT

do-install:
.	for file in ${SM_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/sm-${file} ${DESTDIR}${PREFIX}/bin
.	endfor
.	for helper in ${PKGIN_HELPERS}
	${LN} -s sm-pkghelp ${DESTDIR}${PREFIX}/bin/${helper}
.	endfor
	${LN} -s sm-lsof ${DESTDIR}${PREFIX}/bin/lsof
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit/zoneinit \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit/zoneinit.json \
	  ${DESTDIR}${PREFIX}/lib/zoneinit/zoneinit.json
	${INSTALL_DATA} ${WRKSRC}/zoneinit/zoneinit.xml \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit/mdata-execute \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit/mdata-fetch \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
	${INSTALL_DATA} ${WRKSRC}/zoneinit/mdata.xml \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
.	for include in ${ZONEINIT_INCS}
	${INSTALL_DATA} ${WRKSRC}/zoneinit/includes/${include} \
	  ${DESTDIR}${PREFIX}/lib/zoneinit/includes
.	endfor

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
