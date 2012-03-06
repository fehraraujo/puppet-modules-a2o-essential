#!/bin/bash
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



### Init
export SRCROOT="<%= compileDir %>" &&
mkdir -p $SRCROOT &&
cd $SRCROOT &&



### Set versions and directories
export PVERSION_LIBFFI="<%= packageSoftwareVersion %>" &&



### libffi
# CheckURI: http://sourceware.org/libffi/
cd $SRCROOT && . ../_functions.sh &&
export PNAME="libffi" &&
export PVERSION="$PVERSION_LIBFFI" &&
export PDIR="$PNAME-$PVERSION" &&
export PFILE="$PDIR.tar.gz" &&
export PURI="ftp://sourceware.org/pub/libffi/$PFILE" &&
rm -rf $PDIR &&
GetUnpackCd &&
./configure &&
make -j 2 &&
make install &&
ldconfig &&
cd $SRCROOT &&
rm -rf $PDIR &&



exit 0
