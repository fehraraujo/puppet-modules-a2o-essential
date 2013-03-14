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



### Software package: mysql
class   a2o_essential_linux_mysql::package::mysql   inherits   a2o_essential_linux_mysql::package::base {

    # Package / Software details
    # CheckURI: http://ftp.arnes.si/mysql/Downloads/
    $softwareName     = 'mysql'
    if $version_major == '5.5' {
	$softwareVersion  = '5.5.30'
	$packageRelease   = '1'
    } else {
	$softwareVersion  = '5.1.68'
	$packageRelease   = '2'
    }
    $packageTag       = "$softwareName-$softwareVersion-$packageRelease"
    $destDir          = "/usr/local/$packageTag"


    ### Additinal versions
    $externalDestDir_openssl = '/usr/local/openssl-1.0.1e-2'


    # Install is version specific?
    if $version_major == '5.5' {
	$installScriptTplUri = "$thisPuppetModule/install-mysql.sh_5.5"
    } else {
	$installScriptTplUri = "$thisPuppetModule/install-mysql.sh"
    }


    ### Package
    if $version_major == '5.5' {
	$require = [
	    Package['cmake'],
	    Package['openssl'],
	]
    } else {
	$require = [
	    Package['openssl'],
	]
    }
    a2o-essential-unix::compiletool::package::generic { "$packageTag":
	require             => $require,
	installScriptTplUri => $installScriptTplUri,
    }


    ### Symlink
    file { "/usr/local/$softwareName":
	ensure  => "$packageTag",
	require => [
	    Package["$softwareName"],
	],
	backup   => false,
    }
}
