# $NetBSD: Makefile,v 1.7 2006/06/04 16:26:52 joerg Exp $

MODNAME=		sphinx
PECL_VERSION=		1.1.0
CATEGORIES+=		databases joyent
COMMENT=		Client extension for Sphinx

SUBST_CLASSES+=		path
SUBST_STAGE.path=	post-patch
SUBST_MESSAGE.path=	Fix search path for sphinxclient.h
SUBST_FILES.path=	config.m4
SUBST_SED.path=		-e 's,/usr/local,${PREFIX},g'

.include "../../lang/php/ext.mk"
.include "../../wip/sphinxsearch/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
