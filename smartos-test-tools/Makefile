# $NetBSD$
#
# This metapackage should provide all packages required to run smartos-test.
#
# https://github.com/TritonDataCenter/illumos-joyent/tree/master/usr/src/test/smartos-test
#
# It should be noted that smartos-test is usually run in a GZ context for
# direct access to disks required by ZFS tests, and so this package is mostly
# targetted for "tools" builds.
#

DISTNAME=	smartos-test-tools-20231129
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	jperkin@mnx.io
COMMENT=	Tools required to run the smartos-test suite
LICENSE=	cddl-1.0

META_PACKAGE=	yes

# Use the default versions of GCC and python from the current package set.
.include "../../mk/compiler.mk"
.if ${_GCC_DEPENDS:Mgcc13*}
DEPENDS+=	${_GCC_DEPENDS}:../../extra/gcc13
.elif ${_GCC_DEPENDS:Mgcc12*}
DEPENDS+=	${_GCC_DEPENDS}:../../extra/gcc12
.elif ${_GCC_DEPENDS:Mgcc10*}
DEPENDS+=	${_GCC_DEPENDS}:../../joyent/gcc10
.endif

PYTHON_VERSIONS_ACCEPTED=	${PYTHON_VERSION_DEFAULT}
.include "../../lang/python/pyversion.mk"

DEPENDS+=	coreutils-[0-9]*:../../sysutils/coreutils
DEPENDS+=	gmake-[0-9]*:../../devel/gmake
DEPENDS+=	sudo-[0-9]*:../../security/sudo

.include "../../mk/bsd.pkg.mk"
