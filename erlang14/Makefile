# $NetBSD$
#
# Specific version of erlang14 solely for rabbitmq 2.7.1 which is solely
# for transitioning to 2021Q4 image, this should not be used elsewhere!
#

DISTNAME=	otp_src_${DIST_VERSION_MAJOR}${DIST_VERSION_MINOR:D-${DIST_VERSION_MINOR}}
PKGNAME=	erlang14-${ERLANG_VERSION}
CATEGORIES=	lang
MASTER_SITES=	http://www.erlang.org/download/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.erlang.org/
COMMENT=	Concurrent functional programming language
LICENSE=	erlang-public-license

DIST_SUBDIR=	erlang

MAKE_JOBS_SAFE=	no

GNU_CONFIGURE=		yes
OVERRIDE_DIRDEPTH=	4
USE_TOOLS+=		gmake perl:run flex

CONFIGURE_ARGS+=	--enable-hipe
CONFIGURE_ARGS+=	--enable-threads
CONFIGURE_ARGS+=	--without-javac
CONFIGURE_ARGS+=	--without-odbc
CONFIGURE_ARGS+=	--without-ssl

MAKE_ENV+=		DESTDIR=${DESTDIR}

REPLACE_INTERPRETER+=	escript
REPLACE.escript.old=	.*escript
REPLACE.escript.new=	${PREFIX}/lib/erlang14/bin/escript
REPLACE_FILES.escript=	\
	lib/reltool/examples/display_args \
	lib/reltool/examples/mnesia_core_dump_viewer \
	lib/snmp/src/compile/snmpc.src \
	lib/erl_docgen/priv/bin/codeline_preprocessing.escript \
	lib/erl_docgen/priv/bin/xml_from_edoc.escript \
	lib/snmp/bin/snmpc \
	lib/diameter/bin/diameterc

SUBST_CLASSES+=		target
SUBST_STAGE.target=	pre-configure
SUBST_FILES.target=	make/target.mk
SUBST_SED.target=	-e "s|=.*config.guess)|= ${MACHINE_GNU_PLATFORM}|"
SUBST_MESSAGE.target=	Fixing target name.

TEST_TARGET=		tests
TEST_MAKE_FLAGS=	ERL_TOP=${WRKSRC}
REPLACE_PERL+=		make/make_emakefile

.include "versions.mk"

pre-build:
	${RUN} ${RM} -f ${WRKSRC}/lib/stdlib/ebin/dets_v9.beam

post-install:
	chmod -R go-w ${DESTDIR}${PREFIX}/lib/erlang14/lib

.include "../../devel/ncurses/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
