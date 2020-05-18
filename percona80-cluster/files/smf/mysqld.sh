#!@SMF_METHOD_SHELL@

. /lib/svc/share/smf_include.sh

#
# The data and log directories are created with the appopriate permissions
# by OWN_DIRS_PERMS, no need to duplicate here.
#
MYSQL_DATADIR="@MYSQL_DATADIR@"
MYSQL_LOGDIR="@VARBASE@/log/mysql"
MYSQL_USER="@MYSQL_USER@"
MYSQL_GROUP="@MYSQL_GROUP@"

PIDFILE="${MYSQL_DATADIR}/mysql.pid"
LOGFILE="${MYSQL_LOGDIR}/error.log"

ulimit -n 10240

case "$1" in
bootstrap)
	#
	# Bootstrap is only required on the first cluster node and is executed
	# manually by the administrator prior to node synchronization.  It is
	# also the only node that requires creation of the default tables.
	#
	# We use the existence of the "mysql" directory to determine whether
	# the tables have been created or not.  It's unclear if this method is
	# particularly robust.
	#
	if [ ! -d ${MYSQL_DATADIR}/mysql ]; then
		@LOCALBASE@/sbin/mysqld \
		    --user=${MYSQL_USER} \
		    --initialize-insecure
	fi
	@LOCALBASE@/sbin/mysqld \
	    --user=${MYSQL_USER} \
	    --pid-file=${PIDFILE} \
	    --log-error=${LOGFILE} \
	    --wsrep-cluster-address="gcomm://" &
	;;
start)
	#
	# Startup on joining nodes requires the SSL certificates to be copied
	# into place, which can really only be done manually.  Therefore we do
	# not attempt to initialize anything here, and assume that will be done
	# correctly by the administrator.
	#
	@LOCALBASE@/sbin/mysqld \
	    --user=${MYSQL_USER} \
	    --pid-file=${PIDFILE} \
	    --log-error=${LOGFILE} &
	;;
*)
	#
	# Stop is handled by killing the contract in the manifest.
	#
	echo ""
	echo "Usage: $0 [ bootstrap | start ]"
	echo ""
	exit ${SMF_EXIT_ERR}
	;;
esac

exit ${SMF_EXIT_OK}
