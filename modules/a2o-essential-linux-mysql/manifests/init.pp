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



### Base class
class   a2o-essential-linux-mysql::base {
    $thisPuppetModule = 'a2o-essential-linux-mysql'
}



### Helper files
class   a2o-essential-linux-mysql::files   inherits   a2o-essential-linux-mysql::base {

    # Template
    File {
        owner    => root,
        group    => root,
        mode     => 755,
    }

    # Database dump and restore files
    file { '/opt/scripts/mysql':   ensure => directory, mode => 755 }
    file { '/opt/scripts/mysql/dump.mysql.sh':     source => "puppet:///modules/$thisPuppetModule/dump.mysql.sh"   }
    file { '/opt/scripts/mysql/import.mysql.sh':   source => "puppet:///modules/$thisPuppetModule/import.mysql.sh" }
}



### Final all-containing class
class   a2o-essential-linux-mysql {
    include 'a2o-essential-linux-mysql::files'
}
