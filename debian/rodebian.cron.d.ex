#
# Regular cron jobs for the rodebian package
#
0 4	* * *	root	[ -x /usr/bin/rodebian_maintenance ] && /usr/bin/rodebian_maintenance
