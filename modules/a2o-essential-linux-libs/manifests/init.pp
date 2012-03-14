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
# Authors: Bostjan Skufca <bostjan@a2o.si>                                #
###########################################################################



### Base class
class a2o-essential-linux-libs::base {
    $thisPuppetModule = "a2o-essential-linux-libs"

    # External packages
    $externalPackageDestdir_openssl = '/usr/local/openssl-1.0.0h-1'

    # Where the packages will be compiled
    $compileDir = '/var/src/libs'
}



### Libs required for ganglia installation
class a2o-essential-linux-libs::ganglia {
    include 'a2o-essential-linux-libs::apr'
    include 'a2o-essential-linux-libs::apr-util'
    include 'a2o-essential-linux-libs::cairo'
    include 'a2o-essential-linux-libs::confuse'
    include 'a2o-essential-linux-libs::expat'
    include 'a2o-essential-linux-libs::fontconfig'
    include 'a2o-essential-linux-libs::freetype'
    include 'a2o-essential-linux-libs::glib'
    include 'a2o-essential-linux-libs::libffi'
    include 'a2o-essential-linux-libs::libiconv'
    include 'a2o-essential-linux-libs::libpng'
    include 'a2o-essential-linux-libs::libxml2'
    include 'a2o-essential-linux-libs::pango'
    include 'a2o-essential-linux-libs::pcre'
    include 'a2o-essential-linux-libs::pixman'
    include 'a2o-essential-linux-libs::rrdtool'
}

### Final all-containing class
class a2o-essential-linux-libs::all {
    include 'a2o-essential-linux-libs::apr'
    include 'a2o-essential-linux-libs::apr-util'
    include 'a2o-essential-linux-libs::berkeley-db'
    include 'a2o-essential-linux-libs::cairo'
    include 'a2o-essential-linux-libs::confuse'
    include 'a2o-essential-linux-libs::eventlog'
    include 'a2o-essential-linux-libs::expat'
    include 'a2o-essential-linux-libs::fontconfig'
    include 'a2o-essential-linux-libs::freetype'
    include 'a2o-essential-linux-libs::gdbm'
    include 'a2o-essential-linux-libs::gettext'
    include 'a2o-essential-linux-libs::glib'
    include 'a2o-essential-linux-libs::libffi'
    include 'a2o-essential-linux-libs::libiconv'
    include 'a2o-essential-linux-libs::libpng'
    include 'a2o-essential-linux-libs::libxml2'
    include 'a2o-essential-linux-libs::pango'
    include 'a2o-essential-linux-libs::pcre'
    include 'a2o-essential-linux-libs::pixman'
    include 'a2o-essential-linux-libs::rrdtool'
    include 'a2o-essential-linux-libs::zlib'
}

#class a2o-essential-linux-libs::package::libs {
    ### Require all libs
    ### Create fake package libs with nothing to install
#}

#class a2o-essential-linux-libs {
    ### Include all libs and libs package
#}
