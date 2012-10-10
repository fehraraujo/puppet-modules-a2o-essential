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



### Required users and groups
class   a2o_essential_linux_bind::users_groups {

    $user  = 'named'
    $uid   = '53'
    $gid   = '53'
    $home  = '/var/named'
    $shell = '/bin/false'

    # Create group, user, homedir
    a2o-essential-unix::usergroup::daemon { "$user":
	uid   => "$uid",
	gid   => "$gid",
	home  => "$home",
	shell => "$shell",
    }
}
