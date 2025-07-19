#!@SMF_METHOD_SHELL@
#
# $NetBSD$
#

. /lib/svc/share/smf_include.sh

PIDFILE="@MYSQL_DATADIR@/mysql.pid"

ulimit -n 10240

case "$1" in
start)
	if [ ! -d @MYSQL_DATADIR@/mysql ]; then
		@LOCALBASE@/sbin/mysqld --initialize --user=mysql \
		    --basedir=@LOCALBASE@ \
		    --datadir=@MYSQL_DATADIR@ \
		    --pid-file=${PIDFILE} \
		    --log-error=@VARBASE@/log/mysql/error.log
	fi

	@LOCALBASE@/sbin/mysqld --user=mysql \
	    --basedir=@LOCALBASE@ \
	    --datadir=@MYSQL_DATADIR@ \
	    --pid-file=${PIDFILE} \
	    --log-error=@VARBASE@/log/mysql/error.log &
	;;
stop)
	[ -f ${PIDFILE} ] && kill `@HEAD@ -1 ${PIDFILE}`
	;;
*)
	echo "Usage: $0 {start|stop}" >&2
	exit 1
	;;
esac

exit $SMF_EXIT_OK
