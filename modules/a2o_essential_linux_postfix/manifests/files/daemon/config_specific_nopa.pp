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



### Common config files
class   a2o_essential_linux_postfix::files::daemon::config_specific_nopa   inherits   a2o_essential_linux_postfix::base {

    File {
	ensure   => present,
        owner    => root,
        group    => root,
        mode     => 644,
	require  => File['/usr/local/postfix'],
    }

    # Main config files
    file { '/etc/postfix/master.cf':         content => template("$thisPuppetModule/master.cf")      }
    file { '/etc/postfix/main.cf-global':    content => template("$thisPuppetModule/main.cf-global") }
}
