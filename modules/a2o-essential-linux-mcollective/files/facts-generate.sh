#!/bin/sh
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


### Config
FACT_FILE_DEST="/etc/mcollective/facts.yaml"
FACT_FILE_DEST_TMP="$FACT_FILE_DEST.tmp"
FACT_FILE_LIST="/etc/mcollective/facts-global.yaml
/etc/mcollective/facts-facter.yaml
/etc/mcollective/facts-site.yaml
/etc/mcollective/facts-local.yaml"
PUPPET_CONF_FILE="/etc/puppet/puppet.conf"
PUPPET_CONF_FILE_SYS="/etc/puppet-sys/puppet.conf"


### Set general umask
umask 0077


### Gather facter facts
/usr/local/puppet/bin/facter --yaml > /etc/mcollective/facts-facter.yaml


### Init new facts.yaml file
echo '# Generated by /etc/mcollective/facts-generate.sh periodically.' > $FACT_FILE_DEST_TMP
echo "--- " >> $FACT_FILE_DEST_TMP


### Poppulate with content
for FACT_FILE in $FACT_FILE_LIST; do
    if [ -e $FACT_FILE ]; then
	cat $FACT_FILE | grep -v '^---' >> $FACT_FILE_DEST_TMP
    fi
done


### Add puppet environment
PUPPET_ENV=`cat $PUPPET_CONF_FILE | grep environment | awk '{print $3}'`
PUPPET_ENV_SYS=`cat $PUPPET_CONF_FILE_SYS | grep environment | awk '{print $3}'`
echo "  env: $PUPPET_ENV" >> $FACT_FILE_DEST_TMP
echo "  environment: $PUPPET_ENV" >> $FACT_FILE_DEST_TMP
echo "  puppet_env: $PUPPET_ENV" >> $FACT_FILE_DEST_TMP
echo "  puppet_environment: $PUPPET_ENV" >> $FACT_FILE_DEST_TMP
echo "  env_sys: $PUPPET_ENV_SYS" >> $FACT_FILE_DEST_TMP
echo "  environment_sys: $PUPPET_ENV_SYS" >> $FACT_FILE_DEST_TMP
echo "  puppet_env_sys: $PUPPET_ENV_SYS" >> $FACT_FILE_DEST_TMP
echo "  puppet_environment_sys: $PUPPET_ENV_SYS" >> $FACT_FILE_DEST_TMP


### Move to production location
mv $FACT_FILE_DEST_TMP $FACT_FILE_DEST
