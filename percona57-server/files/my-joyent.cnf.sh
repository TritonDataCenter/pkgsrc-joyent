#
# Joyent Percona configuration, based on my-large.cnf
#

# The following options will be passed to all MySQL clients
[client]
#password       = your_password
port            = 3306
socket          = /tmp/mysql.sock
default-character-set = utf8

# The MySQL server
[mysqld]
user = mysql
port = 3306
basedir = @PREFIX@
datadir = @MYSQL_DATADIR@
socket = /tmp/mysql.sock
bind-address = 127.0.0.1
default-storage-engine = innodb
character-set-server = utf8
skip-external-locking
skip_name_resolve

server-id = 1

# MyISAM settings
key_buffer_size = 16M
sort_buffer_size = 1M
read_buffer_size = 1M
read_rnd_buffer_size = 4M
myisam_sort_buffer_size = 64M

# InnoDB settings
innodb_data_home_dir = @MYSQL_DATADIR@
innodb_log_group_home_dir = @MYSQL_DATADIR@
innodb_data_file_path = ibdata1:100M:autoextend
innodb_buffer_pool_size = 16M
innodb_log_file_size = 400M
innodb_log_buffer_size = 8M
innodb_flush_log_at_trx_commit = 2
innodb_lock_wait_timeout = 50
innodb_file_per_table
innodb_doublewrite = 0
innodb_io_capacity = 1500
innodb_read_io_threads = 8
innodb_write_io_threads = 8

# Slow query log settings
# The default logs all full table scans,tmp tables,filesorts on disk queries
#use_global_long_query_time = 1
#long_query_time = 0.5
slow_query_log_file = @VARBASE@/log/mysql/slowquery.log
slow_query_log = 1
log_slow_filter = "full_scan,tmp_table_on_disk,filesort_on_disk"
log_slow_verbosity = "full"

# Other general MySQL settings
table_open_cache = 512
thread_cache_size = 1000
#query_cache_size = 16M
#query_cache_strip_comments
query_cache_type = 0
back_log = 64
tmpdir = /var/tmp
max_connections = 1000
max_allowed_packet = 24M
max_join_size = 4294967295
net_buffer_length = 2K
thread_stack = 256K
tmp_table_size = 64M
max_heap_table_size = 64M

# Replication settings (master to slave)
# This is not enabled by default.  There are more steps
# to this besides uncommenting the lines below.
# See: http://wiki.joyent.com/wiki/display/jpc2/Replication
#
binlog_format=mixed
log-bin = @VARBASE@/log/mysql/bin.log
#log-bin-index = @VARBASE@/log/mysql/log-bin.index
log-error = @VARBASE@/log/mysql/error.log
#report-host = percona
#relay_log_purge = 1
expire_logs_days = 7
#slave-skip-errors = 1062
#binlog-ignore-db = mysql

# Handlersocket settings
# See: https://github.com/ahiguti/HandlerSocket-Plugin-for-MySQL
#
# The port number to bind to (for read requests)
#loose_handlersocket_port = 9998
# The port number to bind to (for write requests)
#loose_handlersocket_port_wr = 9999
# The number of worker threads (for read requests)
#loose_handlersocket_threads = 16
# The number of worker threads (for write requests)
#loose_handlersocket_threads_wr = 1
# To allow handlersocket accept many concurrent
# connections, make open_files_limit as large as
# possible.
#open_files_limit = 65535

[mysqldump]
quick
max_allowed_packet = 16M

[mysql]
no-auto-rehash
# Remove the next comment character if you are not familiar with SQL
#safe-updates

[myisamchk]
key_buffer_size = 128M
sort_buffer_size = 128M
read_buffer = 2M
write_buffer = 2M

[mysqlhotcopy]
interactive-timeout
