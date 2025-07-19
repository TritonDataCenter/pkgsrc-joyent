#
# This is an example configuration file for Percona Cluster.  Please see
# the following wiki tutorial:
#
#	https://github.com/joyent/pkgsrc/wiki/use:percona-cluster
#
# for more information on how to configure and bootstrap your cluster.
#

[mysqld]
innodb_autoinc_lock_mode=2
pxc_strict_mode=ENFORCING
wsrep_provider=@LOCALBASE@/lib/mysql/plugin/libgalera_smm.so
wsrep_sst_method=xtrabackup-v2

#
# Modify these to match your particular cluster settings.
#
wsrep_cluster_address=gcomm://192.168.1.10,192.168.1.11,192.168.1.12
wsrep_cluster_name=test-cluster

#
# Modify these to match the host this node is running on.
#
wsrep_node_name=pxc0
wsrep_node_address=192.168.1.10
