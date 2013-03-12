# $NetBSD: options.mk,v 1.3 2013/03/05 01:59:51 taca Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.squid
PKG_SUPPORTED_OPTIONS=	inet6 snmp ssl squid-backend-diskd squid-backend-null \
		squid-backend-ufs squid-carp squid-unlinkd \
		squid-kerberos-helper squid-ldap-helper squid-pam-helper
PKG_OPTIONS_LEGACY_OPTS=	diskd:squid-backend-diskd \
	null:squid-backend-null ufs:squid-backend-ufs \
	linux-netfilter:squid-netfilter ipf-transparent:squid-ipf \
	pf-transparent:squid-pf unlinkd:squid-unlinkd \
	arp-acl:squid-arp-acl pam-helper:squid-pam-helper carp:squid-carp

PLIST_VARS+=	diskd snmp unlinkd
PLIST_VARS+=	ba_LDAP ba_MSNT ba_NCSA ba_NIS ba_PAM ba_getpwnam
PLIST_VARS+=	da_LDAP
PLIST_VARS+=	na_SMB
PLIST_VARS+=	ta_kerberos
PLIST_VARS+=	eacl_ip_user eacl_LDAP_group eacl_unix_group

PKG_SUGGESTED_OPTIONS=	inet6 snmp ssl squid-backend-diskd squid-carp \
		squid-pam-helper squid-unlinkd

.include "../../mk/bsd.prefs.mk"

.if !empty(OPSYS:MLinux)
PKG_SUPPORTED_OPTIONS+=	squid-netfilter
.endif

# some release of NetBSD lacks <ipl.h> header of IP Filter 4.x
.if ${OPSYS} != "NetBSD" || ${OS_VERSION:M[01].*} || exists(/usr/include/netinet/ipl.h)
PKG_SUPPORTED_OPTIONS+=	squid-ipf
.endif

.if ${OPSYS} == "FreeBSD" || ${OPSYS} == "NetBSD" || ${OPSYS} == "OpenBSD" || ${OPSYS} == "DragonFly"
PKG_SUPPORTED_OPTIONS+=	squid-pf
.endif

.if (${OPSYS} == "FreeBSD" || ${OPSYS} == "NetBSD") && \
	!empty(PKG_SUPPORTED_OPTIONS:Msquid-ipf)
PKG_SUGGESTED_OPTIONS+=	squid-ipf
.endif

.if ${OPSYS} == "OpenBSD"
PKG_SUGGESTED_OPTIONS+=	squid-pf
.endif

.if ${OPSYS} == "Darwin"
PKG_SUPPORTED_OPTIONS+=	squid-ipfw
PKG_SUGGESTED_OPTIONS+=	squid-ipfw
.endif

# limited platform support squid-arp-acl
.if !empty(OPSYS:MFreeBSD) || !empty(OPSYS:MNetBSD) || !empty(OPSYS:MOpenBSD) || !empty(OPSYS:MLinux) || !empty(OPSYS:MSunOS)
PKG_SUPPORTED_OPTIONS+=	squid-arp-acl
.endif

.include "../../mk/bsd.options.mk"

SQUID_BACKENDS?=		ufs null
SQUID_BASIC_AUTH_HELPERS?=	MSNT NCSA NIS getpwnam
SQUID_DIGEST_AUTH_HELPERS?=	password
SQUID_NTLM_AUTH_HELPERS?=	SMB
SQUID_EXTERNAL_ACL_HELPERS?=	fileuser_ip unix_group

# squid's code has preference as:
#	squid-ipf > squid-pf > squid-netfilter
# So, options.mk introduce preference as:
#	squid-netfilter > squid-pf > squid-ipf
.if !empty(PKG_OPTIONS:Msquid-netfilter)
CONFIGURE_ARGS+=	--enable-linux-netfilter
.elif !empty(PKG_OPTIONS:Msquid-pf)
CONFIGURE_ARGS+=	--enable-pf-transparent
.elif !empty(PKG_OPTIONS:Msquid-ipf)
CONFIGURE_ARGS+=	--enable-ipf-transparent
.elif !empty(PKG_OPTIONS:Msquid-ipfw)
CONFIGURE_ARGS+=	--enable-ipfw-transparent
.endif

.if !empty(PKG_OPTIONS:Msquid-arp-acl)
CONFIGURE_ARGS+=	--enable-arp-acl
.endif

.if !empty(PKG_OPTIONS:Msquid-carp)
CONFIGURE_ARGS+=	--enable-carp
.endif

.if !empty(PKG_SUPPORTED_OPTIONS:Minet6) && empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !empty(PKG_OPTIONS:Msquid-kerberos-helper)
.include "../../mk/krb5.buildlink3.mk"
SQUID_NEGOTIATE_AUTH_HELPERS+=	kerberos
.endif

.if !empty(PKG_OPTIONS:Msquid-ldap-helper)
.include "../../databases/openldap-client/buildlink3.mk"
SQUID_BASIC_AUTH_HELPERS+=	LDAP
SQUID_DIGEST_AUTH_HELPERS+=	LDAP
SQUID_EXTERNAL_ACL_HELPERS+=	LDAP_group
.endif

.if !empty(PKG_OPTIONS:Msquid-pam-helper)
.  include "../../mk/pam.buildlink3.mk"
SQUID_BASIC_AUTH_HELPERS+=	PAM
.endif

.if !empty(PKG_OPTIONS:Msnmp)
CONFIGURE_ARGS+=	--enable-snmp
PLIST.snmp=		yes
.else
CONFIGURE_ARGS+=	--disable-snmp
.endif

.if !empty(PKG_OPTIONS:Mssl)
CONFIGURE_ARGS+=	--enable-ssl --with-openssl=${SSLBASE:Q}
.  include "../../security/openssl/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Msquid-backend-diskd)
SQUID_BACKENDS+=	diskd
PLIST.diskd=		yes
.endif

.if empty(PKG_OPTIONS:Msquid-unlinkd)
CONFIGURE_ARGS+=	--disable-unlinkd
.else
PLIST.unlinkd=		yes
.endif

.if empty(SQUID_BASIC_AUTH_HELPERS)
CONFIGURE_ARGS+=	--disable-auth-basic
.else
CONFIGURE_ARGS+=	--enable-auth-basic=${SQUID_BASIC_AUTH_HELPERS:Q}
.  for i in ${SQUID_BASIC_AUTH_HELPERS}
PLIST.ba_${i}=		yes
.  endfor
.endif

.if empty(SQUID_DIGEST_AUTH_HELPERS)
CONFIGURE_ARGS+=	--disable-auth-digest
.else
CONFIGURE_ARGS+=	--enable-auth-digest=${SQUID_DIGEST_AUTH_HELPERS:Q}
.  for i in ${SQUID_DIGEST_AUTH_HELPERS}
PLIST.da_${i}=		yes
.  endfor
.endif

.if empty(SQUID_NEGOTIATE_AUTH_HELPERS)
CONFIGURE_ARGS+=	--disable-auth-negotiate
.else
CONFIGURE_ARGS+=	--enable-auth-negotiate=${SQUID_NEGOTIATE_AUTH_HELPERS:Q}
.  for i in ${SQUID_NEGOTIATE_AUTH_HELPERS}
PLIST.ta_${i}=		yes
.  endfor
.endif

.if empty(SQUID_NTLM_AUTH_HELPERS)
CONFIGURE_ARGS+=	--disable-auth-ntlm
.else
CONFIGURE_ARGS+=	--enable-auth-ntlm=${SQUID_NTLM_AUTH_HELPERS:Q}
.  for i in ${SQUID_NTLM_AUTH_HELPERS}
PLIST.na_${i}=		yes
.  endfor
.endif

.if empty(SQUID_EXTERNAL_ACL_HELPERS)
CONFIGURE_ARGS+=	--disable-external-acl-helpers
.else
CONFIGURE_ARGS+=	--enable-external-acl-helpers=${SQUID_EXTERNAL_ACL_HELPERS:Q}
.  for i in ${SQUID_EXTERNAL_ACL_HELPERS}
PLIST.eacl_${i}=	yes
.  endfor
.endif
