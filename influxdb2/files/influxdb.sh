#!@RCD_SCRIPTS_SHELL@

# PROVIDE: influxdb
# REQUIRE: DAEMON
# KEYWORD: shutdown

if [ -f /etc/rc.subr ]
then
        . /etc/rc.subr
fi

name="influxdb"
rcvar=$name
influxdb_user="@INFLUXDB_USER@"
influxdb_group="@INFLUXDB_GROUP@"
influxdb_chdir="@DATADIR@"
STDERR="@LOGDIR@/influxdb.log"
command="@PREFIX@/bin/influxd"
command_args="1>/dev/null 2>> $STDERR &"

load_rc_config $name
run_rc_command "$1"
