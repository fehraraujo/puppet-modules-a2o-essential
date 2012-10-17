###########################################################################
# a2o Essential Puppet Modules                                            #
#-------------------------------------------------------------------------#
# Copyright (c) 2012 Bostjan Skufca                                       #
#-------------------------------------------------------------------------#
# This source file is subject to version 2.0 of the Apache License,       #
# that is bundled with this package in the file LICENSE, and is           #
# available through the world-wide-web at the following url:              #
# http://www.apache.org/licenses/LICENSE-2.0                              #
#-------------------------------------------------------------------------#
# Authors: Bostjan Skufca <my_name [at] a2o {dot} si>                     #
###########################################################################



### Runtime dirs
class   a2o_essential_linux_mysql::files::daemon_runtime   inherits   a2o_essential_linux_mysql::base {

    File {
	ensure   => directory,
        owner    => mysql,
        group    => mysql,
        mode     => 755,
    }

    file { '/var/mysql/binlog': }
    file { '/var/mysql/data':   mode => 700 }
    file { '/var/mysql/log':    }
    file { '/var/mysql/log/processlist_logs':    }
    file { '/var/mysql/run':    }
    file { '/var/mysql/tmp':    }
}



### Config files
class   a2o_essential_linux_mysql::files::daemon_config   inherits   a2o_essential_linux_mysql::base {

    File {
        owner    => root,
        group    => root,
        mode     => 644,
    }

    # Directories
    file { '/etc/mysql':          ensure => directory, mode => 755 }
    file { '/etc/mysql/conf.d':   ensure => directory, mode => 755 }

    # Files
    file { '/etc/mysql/my.cnf':         source => "puppet:///modules/$thisPuppetModule/my.cnf" }
}



### Files required for mysql daemon
class   a2o_essential_linux_mysql::files::daemon   inherits   a2o_essential_linux_mysql::base {

    include 'a2o_essential_linux_mysql::files::daemon_runtime'
    include 'a2o_essential_linux_mysql::files::daemon_config'
}
