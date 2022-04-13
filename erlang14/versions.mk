# $NetBSD: Makefile.versions,v 1.12 2012/01/19 10:17:56 fhajny Exp $

ERLANG_VERSION=			14.1.4
DIST_VERSION_MAJOR=		R14B04
#DIST_VERSION_MINOR=		1

ERLANG_VERSIONS=				\
	appmon			2.1.13		\
	asn1			1.6.18		\
	common_test		1.5.5		\
	compiler		4.7.5		\
	cosEvent		2.1.11		\
	cosEventDomain		1.1.11		\
	cosFileTransfer		1.1.12		\
	cosNotification		1.1.17		\
	cosProperty		1.1.14		\
	cosTime			1.1.11		\
	cosTransactions		1.2.11		\
	crypto			2.0.4		\
	debugger		3.2.6		\
	dialyzer		2.4.4		\
	diameter		0.10		\
	docbuilder		0.9.8.11	\
	edoc			0.7.9		\
	erl_docgen		0.2.6		\
	erl_interface		3.7.5		\
	erts			5.8.5		\
	et			1.4.4		\
	eunit			2.2.1		\
	gs			1.5.14		\
	hipe			3.8.1		\
	ic			4.2.27		\
	inets			5.7.1		\
	inviso			0.6.2		\
	jinterface		1.5.4		\
	kernel			2.14.5		\
	megaco			3.15.1.1	\
	mnesia			4.5		\
	observer		0.9.10		\
	odbc			2.10.11		\
	orber			3.6.22		\
	os_mon			2.2.7		\
	otp_mibs		1.0.6		\
	parsetools		2.0.6		\
	percept			0.8.6		\
	pman			2.7.1		\
	public_key		0.13		\
	reltool			0.5.7		\
	runtime_tools		1.8.6		\
	sasl			2.1.10		\
	snmp			4.21.1		\
	ssh			2.0.8		\
	ssl			4.1.6		\
	stdlib			1.17.5		\
	syntax_tools		1.6.7.1		\
	test_server		3.4.5		\
	toolbar			1.4.2		\
	tools			2.6.6.5		\
	tv			2.1.4.7		\
	typer			0.9.2		\
	webtool			0.8.9		\
	wx			0.99		\
	xmerl			1.2.10

PLIST_SUBST+=	VERSION=${DIST_VERSION_MAJOR}

.for name version in ${ERLANG_VERSIONS}
VERSION.${name}=	${version}
PLIST_SUBST+=		VERSION.${name}=${version}
PRINT_PLIST_AWK+=	{if ($$0 ~ /\/${name}-${version}\//) {sub(/\/${name}-${version}\//,"/${name}-$${VERSION.${name}}/", $$0);}}
.endfor

PRINT_PLIST_AWK+=	{if ($$0 ~ /\/releases\/${DIST_VERSION_MAJOR}\//) {sub(/\/releases\/${DIST_VERSION_MAJOR}\//,"/releases/$${VERSION}/", $$0);}}
