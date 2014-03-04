#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#
# PROVIDE: collectd 
# REQUIRE: DAEMON
# KEYWORD: shutdown
#
# You will need to set some variables in /etc/rc.conf to start collectd:
#
# collectd=YES
#

if [ -f /etc/rc.subr ]
then
    . /etc/rc.subr
fi

name="collectd"
rcvar=${name}
command=@PREFIX@/sbin/collectd
pidfile="@VARBASE@/run/collectd.pid"
required_files=@PKG_SYSCONFDIR@/collectd.conf

load_rc_config ${name}
run_rc_command "$1"
