# $NetBSD$
#

DISTNAME=	mahout-distribution-0.7-src
PKGNAME=	mahout-0.7
CATEGORIES=	devel
MASTER_SITES=	http://www.us.apache.org/dist/mahout/0.7/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://mahout.apache.org/
COMMENT=	Scalable machine learning libraries building
LICENSE=	apache-2.0

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_DEPENDS+=	apache-maven>=3:../../devel/apache-maven
DEPENDS+=	hadoop-[0-9]*:../../joyent/hadoop

WRKSRC=		${WRKDIR}/mahout-distribution-0.7
USE_LANGUAGES=	# none

EXAMPLE_FILES=		arff.vector canopy cat cleansvd clusterdump clusterpp	\
			dirichlet driver.classes evaluateFactorization		\
			evaluateFactorizationParallel fkmeans fpg itemsimilarity\
			kmeans lucene.vector matrixmult meanshift parallelALS	\
			predictFromFactorization recommendfactorized		\
			recommenditembased rowid rowsimilarity runlogistic	\
			seq2sparse seqdirectory seqdumper seqwiki splitDataset	\
			ssvd svd trainlogistic transpose vectordump

EXAMPLE_SCRIPTS=	asf-email-examples.sh build-asf-email.sh \
			build-cluster-syntheticcontrol.sh build-reuters.sh \
			classify-20newsgroups.sh cluster-reuters.sh \
			cluster-syntheticcontrol.sh factorize-movielens-1M.sh \
			factorize-netflix.sh

PKG_SYSCONFSUBDIR=	mahout
INSTALLATION_DIRS+=	bin share/mahout share/mahout/bin share/examples/mahout \
			share/examples/mahout/bin

.for file in ${EXAMPLE_FILES}
CONF_FILES+=	share/examples/mahout/${file}.props ${PKG_SYSCONFDIR}/${file}.props
.endfor

MAHOUT_LOG_DIR?=	${VARBASE}/log/mahout
OWN_DIRS+=		${MAHOUT_LOG_DIR}

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-build
SUBST_MESSAGE.paths=	Fixing default paths
SUBST_FILES.paths=	bin/mahout
SUBST_VARS.paths=	PREFIX PKG_SYSCONFDIR MAHOUT_LOG_DIR

do-build:
	${ECHO} '<settings>\
<localRepository>${WRKDIR}/.m2</localRepository>\
</settings>' > ${WRKDIR}/settings.xml
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} mvn \
	  -DskipTests -s ${WRKDIR}/settings.xml install

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/bin/mahout \
	  ${DESTDIR}${PREFIX}/bin
.for file in ${EXAMPLE_FILES}
	${INSTALL_DATA} ${WRKSRC}/src/conf/${file}.props \
	  ${DESTDIR}${PREFIX}/share/examples/mahout/
.endfor
.for file in ${EXAMPLE_SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/bin/${file} \
	  ${DESTDIR}${PREFIX}/share/examples/mahout/bin/
.endfor
	${INSTALL_DATA} ${WRKSRC}/examples/bin/lda.algorithm \
	  ${DESTDIR}${PREFIX}/share/examples/mahout/bin/
	${INSTALL_DATA} ${WRKSRC}/core/target/mahout-core-${PKGVERSION_NOREV}.jar \
	  ${DESTDIR}${PREFIX}/share/mahout/
	${INSTALL_DATA} ${WRKSRC}/core/target/mahout-core-${PKGVERSION_NOREV}-job.jar \
	  ${DESTDIR}${PREFIX}/share/mahout/
	${INSTALL_DATA} ${WRKSRC}/examples/target/mahout-examples-${PKGVERSION_NOREV}-job.jar \
	  ${DESTDIR}${PREFIX}/share/mahout/
	${INSTALL_DATA} ${WRKSRC}/examples/target/mahout-examples-${PKGVERSION_NOREV}.jar \
	  ${DESTDIR}${PREFIX}/share/mahout/
	${INSTALL_DATA} ${WRKSRC}/integration/target/mahout-integration-${PKGVERSION_NOREV}.jar \
	  ${DESTDIR}${PREFIX}/share/mahout/
	${INSTALL_DATA} ${WRKSRC}/math/target/mahout-math-${PKGVERSION_NOREV}.jar \
	  ${DESTDIR}${PREFIX}/share/mahout/
	cd ${WRKSRC}/examples/target && \
	  ${CP} -Rp dependency ${DESTDIR}${PREFIX}/share/mahout/lib
	${LN} -sf ${PKG_SYSCONFDIR} ${DESTDIR}${PREFIX}/share/mahout/conf

.include "../../joyent/hadoop/Makefile.common"
.include "../../mk/bsd.pkg.mk"
