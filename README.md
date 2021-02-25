# rodebian

A read-only root filesystem implementation for Debian systems

Inspired by and derived from voyage-util, part of the Voyage Linux distrbution, by Punky Tse.

Significant changes include:

* For systems using systemd, not sysvinit
* Allow multiple concurrent read-write requestors without conflict
* License updated from GPLv2 to GPLv3

## Configuration

Configure directories for which read-write access is required in `/etc/default/rodebian`

Writeable directories are in volatile storage (system memory).

`RODEBIAN_SYNC_DIRS` is a list of directories that should be writeable and having contents that should be preserved if possible.

Contents of these directories are synchronised to non-volatile storage on request and system reboot, and restored on system boot.

`RODEBIAN_RW_DIRS` is a list of directories that should be writeable and where contents are not required to be preserved.

Contents of these directories are not retained when the system is restarted.

`MEM` is the size of the tmpfs filesystem used to store the read-write directories. Defaults to the smaller of 2GB or 20% of the system memory.


## Usage

`remountrw [lockname]` re-mounts the root filesystem read-write.

The read-write request is recorded for the requesting user unless an (optional) lock name is provided.

If a lock name is not supplied, and the $USER environment variable is empty, an anonymous lock is created.

`remountro [lockname]` removes the lock and, if no other locks remain, remounts the root filesystem read-only.

If other locks remain, they are listed and the system remains read-write until the corresponding requests are reversed.

The primary use of the `[lockname]` is to prevent conflict when used in system scripts.

In interactive use the lockname should normally be omitted so that the read-write locking will be based on username.

`rodebian sync` synchronises read-write directories to non-volatile storage. May be run periodically by cron.

## License

The software is license is GPL v3

## Source

rodebian source is available at [https://github.com/dareader/rodebian](https://github.com/dareader/rodebian)

voyage-util source is available at [http://svn.voyage.hk/repos/voyage/trunk/voyage-util/](http://svn.voyage.hk/repos/voyage/trunk/voyage-util/)

voyage-util version 0.17 was used in the creation of rodebian

