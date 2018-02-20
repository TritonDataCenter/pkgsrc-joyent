# $NetBSD$

DISTNAME=	chef-${CHEF_VERSION}-${PKGREVISION}.i386.solaris
PKGNAME=	chef-client-${CHEF_VERSION}
CATEGORIES=	sysutils
MASTER_SITES=	https://packages.chef.io/files/stable/chef/${CHEF_VERSION}/solaris2/5.10/
EXTRACT_SUFX=	#

MAINTAINER=	filip@joyent.com
HOMEPAGE=	https://downloads.chef.io/chef/
COMMENT=	The full stack of chef
#LICENSE=	# it's complicated

# See https://downloads.chef.io/chef/stable
# Note that we abuse PKGREVISION for upstream rev string
CHEF_VERSION=	13.7.16
PKGREVISION=	1

EXTRACT_CMD=	${PKGSRC_SETENV} ${_EXTRACT_ENV} pkgtrans ${DOWNLOADED_DISTFILE} ${WRKDIR} chef

WRKSRC=		${WRKDIR}/chef

USE_LANGUAGES=	# none
USE_TOOLS+=	pax
NO_CONFIGURE=	yes

CHECK_INTERPRETER_SKIP+=	chef/embedded/*
CHECK_SSP_SUPPORTED=		no

GENERATE_PLIST=	cd ${DESTDIR}${PREFIX}; \
		${FIND} * \( -type f -or -type l \) | ${SORT};

do-build:
	${RUN} for l in $$(awk '{if($$2=="s") print $$4}' ${WRKSRC}/pkgmap); do \
		ln -fs $$(awk -F= '{print $$2" ${WRKSRC}/reloc/"$$1}' <<< "$$l") ;\
		done

do-install:
	cd ${WRKSRC}/reloc && ${PAX} -rw -pp chef ${DESTDIR}${PREFIX}

.include "../../mk/bsd.pkg.mk"
PREFIX=		/opt
