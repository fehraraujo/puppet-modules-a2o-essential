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



### Required packages
class   a2o-essential-redhat::packages   inherits   a2o-essential-redhat::base {

    Package {
	provider => yum,
	ensure   => present,
    }

    package { 'gcc':          }
    package { 'gcc-c++':      }
    package { 'gettext':      }
    package { 'libtool':      }
    package { 'make':         }
    package { 'mc':           }
    package { 'patch':        }
    package { 'pkgconfig':    }
    package { 'xz':           }
    package { 'zlib':         }
    package { 'zlib-devel':   }
}
