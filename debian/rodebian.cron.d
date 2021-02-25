#
# Regular cron jobs for the rodebian package
#
# synchronise at :55 minutes every 4 hours from 00:55 
#55 0/4	* * *	root	[ -x /sbin/rodebian ] && /sbin/rodebian sync
