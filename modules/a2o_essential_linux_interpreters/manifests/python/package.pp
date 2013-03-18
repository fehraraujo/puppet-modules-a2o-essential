###########################################################################
# a2o Essential Puppet Modules                                            #
#-------------------------------------------------------------------------#
# Copyright (c) Bostjan Skufca                                            #
#-------------------------------------------------------------------------#
# This source file is subject to version 2.0 of the Apache License,       #
# that is bundled with this package in the file LICENSE, and is           #
# available through the world-wide-web at the following url:              #
# http://www.apache.org/licenses/LICENSE-2.0                              #
#-------------------------------------------------------------------------#
# Authors: Bostjan Skufca <my_name [at] a2o {dot} si>                     #
###########################################################################



### Software package: python
class   a2o_essential_linux_interpreters::python::package   inherits   a2o_essential_linux_interpreters::python::base {

    # Package / Software details
    # CheckURI: http://www.python.org/download/
    $softwareName     = 'python'
    $softwareVersion  = '2.7.3'
    $packageRelease   = '1'
    $packageTag       = "$softwareName-$softwareVersion-$packageRelease"
    $destDir          = "/usr/local/$packageTag"


    ### Package
    $require = [
        Package['openssl'],
    ]
    a2o-essential-unix::compiletool::package::generic { "$packageTag": require => $require, }


    ### Major Version Symlink
    file { "/usr/local/$softwareName-2.7":
	ensure  => link,
	target  => "$packageTag",
	require => [
	    Package["$softwareName"],
	],
	backup   => false,
    }

    ### Main Symlink
    file { "/usr/local/$softwareName":
	ensure  => link,
	target  => "$softwareName-2.7",
	require => [
	    Package["$softwareName"],
	    File["/usr/local/$softwareName-2.7"],
	],
	backup   => false,
    }
}
