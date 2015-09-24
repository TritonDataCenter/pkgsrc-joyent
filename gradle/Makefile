# $NetBSD$

DISTNAME=	gradle-2.7-bin
PKGNAME=	${DISTNAME:S/-bin//}
CATEGORIES=	devel
MASTER_SITES=	http://services.gradle.org/distributions/
EXTRACT_SUFX=	.zip

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://gradle.org/
COMMENT=	Build automation tool
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/${DISTNAME:S/-bin//}

USE_LANGUAGES=	# none
USE_TOOLS+=	bash:run pax

NO_BUILD=	yes

REPLACE_BASH+=	bin/gradle

SUBST_CLASSES+=		java
SUBST_STAGE.java=	pre-install
SUBST_MESSAGE.java=	Setting default Java path
SUBST_FILES.java=	bin/gradle
SUBST_VARS.java+=	PKG_JAVA_HOME

INSTALLATION_DIRS+=	bin share/gradle

post-extract:
	${CHMOD} -R g-w * ${WRKSRC}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/gradle ${DESTDIR}${PREFIX}/bin/gradle
	cd ${WRKSRC} && ${PAX} -rw -pp lib media ${DESTDIR}${PREFIX}/share/gradle

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
