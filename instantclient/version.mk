# $NetBSD$

.include "../../mk/bsd.prefs.mk"

ORACLE_VERSION=		11_2
ORACLE_IC_HOME=		oracle/instantclient_${ORACLE_VERSION}
ORACLE_BASE_URL=	http://www.oracle.com/technetwork/topics

.if ${OPSYS} == "SunOS"
. if ${MACHINE_ARCH} == "x86_64" || defined(ABI:M64)
OS_PLATFORM=		solaris.x64
ORACLE_IC_DOWNLOAD=	${ORACLE_BASE_URL}/solx8664soft-097204.html
. else
OS_PLATFORM=		solaris.x32
ORACLE_IC_DOWNLOAD=	${ORACLE_BASE_URL}/solx86soft-092689.html
. endif
.endif

MESSAGE_SUBST+=		ORACLE_IC_DOWNLOAD=${ORACLE_IC_DOWNLOAD}
MESSAGE_SUBST+=		ORACLE_IC_HOME=${ORACLE_IC_HOME} 
PLIST_SUBST+=		ORACLE_IC_HOME=${ORACLE_IC_HOME} 
