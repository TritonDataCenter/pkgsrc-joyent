# $NetBSD$
#

DISTNAME=	mod_authnz_crowd-${DISTVERS}
PKGNAME=	${APACHE_PKG_PREFIX}-authnz-crowd-${DISTVERS}
CATEGORIES=	www
MASTER_SITES=	http://downloads.atlassian.com/software/crowd/downloads/cwdapache/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://confluence.atlassian.com/display/CROWD/Integrating+Crowd+with+Apache
COMMENT=	Apache module for Crowd authentication
LICENSE=	apache-2.0

PKG_APACHE_ACCEPTED=	apache22 apache24

APACHE_MODULE_NAME=	mod_authnz_crowd.${MODULE_EXT}

DISTVERS=	2.2.2
MODULE_EXT=	la

APACHE_MODULE_SRCDIR=	${WRKSRC}/src

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	autoconf automake

CPPFLAGS+=	-I${BUILDLINK_PREFIX.libxml2}/include/libxml2

CONFIGURE_ENV+=	ac_cv_path_HTTPD=${BUILDLINK_PREFIX.apache:Q}/sbin/httpd
CONFIGURE_ENV+=	APXS=${APXS:Q}
CONFIGURE_ENV+=	BUILDLINK_PREFIX_apache=${BUILDLINK_PREFIX.apache:Q}
CONFIGURE_ENV+=	BUILDLINK_PREFIX_subversion=${BUILDLINK_PREFIX.subversion-base:Q}

pre-configure:
	cd ${WRKSRC} && autoreconf -fiv

.include "../../mk/apache.module.mk"
.include "../../devel/subversion-base/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
