# $NetBSD$
#

DISTNAME=	ruby-enterprise-1.8.7-2012.02
PKGNAME=	ree${DISTNAME:S/ruby-enterprise-1.8.7//}
CATEGORIES=	lang
MASTER_SITES=	http://rubyenterpriseedition.googlecode.com/files/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.rubyenterpriseedition.com/
COMMENT=	Server-oriented friendly branch of Ruby with various enhancements
LICENSE=	ruby-license

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=	c c++
USE_TOOLS+=	bison
GNU_CONFIGURE=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}/source

REPLACE_INTERPRETER+=	ruby
REPLACE.ruby.old=	.*/bin/ruby
REPLACE.ruby.new=	${PREFIX}/ree/bin/ruby
REPLACE_FILES.ruby=	lib/irb/cmd/subirb.rb
REPLACE_FILES.ruby+=	lib/irb/ext/save-history.rb
REPLACE_FILES.ruby+=	lib/matrix.rb
REPLACE_FILES.ruby+=	lib/rdoc/markup/sample/rdoc2latex.rb
REPLACE_FILES.ruby+=	lib/rdoc/parsers/parse_rb.rb

CONFIGURE_ARGS+=--with-iconv
CONFIGURE_ARGS+=--enable-mbari-api

.include "../../mk/compiler.mk"

.if !empty(CC_VERSION:Mgcc-4.4*)
CFLAGS+=	-fno-strict-aliasing
.endif

RUBY_LIB=	ree/lib/ruby/1.8
RUBY_ARCH?=	${LOWER_ARCH}-${LOWER_OPSYS}${APPEND_ELF}${LOWER_OPSYS_VERSUFFIX}
RUBY_ARCHLIB?=	${RUBY_LIB}/${RUBY_ARCH}
PLIST_SUBST+=	RUBY_ARCHLIB=${RUBY_ARCHLIB:Q}
PLIST_SUBST+=	RUBY_ARCH=${RUBY_ARCH:Q}
PLIST_SUBST+=	RUBY_LIB=${RUBY_LIB:Q}

post-install:
	cd ${WRKSRC}/../rubygems && \
		RUBYLIB="${DESTDIR}${PREFIX}/${RUBY_LIB}:${DESTDIR}${PREFIX}/${RUBY_ARCHLIB}:${DESTDIR}${PREFIX}/ree/lib/ruby/site_ruby/1.8:${DESTDIR}${PREFIX}/ree/lib/ruby/site_ruby/1.8/${RUBY_ARCH}" \
		GEM_HOME=${DESTDIR}${PREFIX}/${RUBY_LIB} \
		${DESTDIR}${PREFIX}/ree/bin/ruby setup.rb \
		--vendor --no-rdoc --no-ri --quiet

.include "../../security/openssl/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

CONFIGURE_ARGS+=	--prefix=${PREFIX}/ree --mandir=${PREFIX}/ree/man
