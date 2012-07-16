# $NetBSD$
#

DISTNAME=	smtools
PKGNAME=	${DISTNAME}-${VERSION}
CATEGORIES=	sysutils
MASTER_SITES=	git@git.joyent.com
DISTFILES=	# empty

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.joyent.com/
COMMENT=	Joyent tools relevant to SmartOS and SmartMachines
#LICENSE=	#

PKG_DESTDIR_SUPPORT=	user-destdir

NO_CHECKSUM=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/smtools

VERSION=	20120712

.include "../../mk/bsd.prefs.mk"

SM_SCRIPTS=	cpuinfo create-db create-dbuser create-vhost	\
		install-drupal install-wordpress list-dbs	\
		list-dbusers list-timezones meminfo pcp pkghelp	\
		prepare-image reboot rebuild-pkgsrc remove-db	\
		remove-dbuser set-hostname set-timezone 	\
		shutdown summary
ZONEINIT_INCS=	00-init.sh 00-mdata.sh 01-reboot-file.sh	\
		03-dupipcheck.sh 03-ips.sh 04-mdata.sh		\
		11-files.sh 12-network.sh 91-passwords.sh	\
		92-sshd.sh 93-pkgsrc.sh 999-cleanup.sh
PKGIN_HELPERS=	apt-get apt-cache pkg port rpm yum

SUNOS_FLAVOR?=	joyent
.if ${SUNOS_FLAVOR} == "joyent"
PLATFORM=	sdc6
.else
PLATFORM=	sdc5
.endif

INSTALLATION_DIRS+=	bin lib/zoneinit lib/zoneinit/includes

SUBST_CLASSES+=	vars
SUBST_STAGE.vars=	post-extract
SUBST_MESSAGE.vars=	Configuring scripts
SUBST_FILES.vars=	sm-prepare-image sm-rebuild-pkgsrc zoneinit/zoneinit.xml
SUBST_VARS.vars=	PREFIX VARBASE PLATFORM PKGRELEASE MACHINE_ARCH
SUBST_VARS.vars+=	MYSQL_VERSION_DEFAULT PGSQL_VERSION_DEFAULT
SUBST_VARS.vars+=	PHP_VERSION_DEFAULT PYTHON_VERSION_DEFAULT
SUBST_VARS.vars+=	RUBY_VERSION_DEFAULT RUBY_RAILS_DEFAULT

do-fetch:
do-extract:
	cd ${WRKDIR} && git clone ${MASTER_SITES}:${DISTNAME}.git

do-install:
.	for file in ${SM_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/sm-${file} ${DESTDIR}${PREFIX}/bin
.	endfor
.	for helper in ${PKGIN_HELPERS}
	${LN} -s sm-pkghelp ${DESTDIR}${PREFIX}/bin/${helper}
.	endfor
	${INSTALL_SCRIPT} ${WRKSRC}/zoneinit/zoneinit \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
	${INSTALL_DATA} ${WRKSRC}/zoneinit/zoneinit.xml \
	  ${DESTDIR}${PREFIX}/lib/zoneinit
.	for include in ${ZONEINIT_INCS}
	${INSTALL_DATA} ${WRKSRC}/zoneinit/includes/${include} \
	  ${DESTDIR}${PREFIX}/lib/zoneinit/includes
.	endfor

.include "../../mk/bsd.pkg.mk"
