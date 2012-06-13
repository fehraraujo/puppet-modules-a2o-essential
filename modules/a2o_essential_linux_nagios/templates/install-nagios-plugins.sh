#!/bin/bash



# Compile directory
export SRCROOT="<%= compileDir %>" &&
mkdir -p $SRCROOT &&
cd $SRCROOT &&



### Set versions and directories
export PVERSION_PLUGINS="<%= softwareVersion %>" &&
export PDESTDIR_PLUGINS="<%= destDir %>" &&
export PDESTDIR_PERL="<%= externalDestDir_perl %>" &&
export PDESTDIR_OPENSSL="<%= externalDestDir_openssl %>" &&
export PDESTDIR_OPENLDAP="<%= externalDestDir_openldap %>" &&
export PDESTDIR_MYSQL="<%= externalDestDir_mysql %>" &&



### Download and install
# CheckURI: http://www.nagios.org/download/plugins/
cd $SRCROOT && . ../_functions.sh &&
export PNAME="nagios-plugins" &&
export PVERSION="$PVERSION_PLUGINS" &&
export PDIR="$PNAME-$PVERSION" &&
export PFILE="$PDIR.tar.gz" &&
export PURI="http://switch.dl.sourceforge.net/sourceforge/nagiosplug/$PFILE" &&

rm -rf $PDIR &&
GetUnpackCd &&


# Fix broken perl module compilation
cd perlmods &&
tar -xzf Params-Validate-0.88.tar.gz &&
cd Params-Validate-0.88 &&
mv Validate.xs Validate.xs.orig &&
cat Validate.xs.orig | fgrep -v 'case SVt_RV:' > Validate.xs &&
cd .. &&
mv Params-Validate-0.88.tar.gz Params-Validate-0.88.tar.gz.orig &&
tar -c -z -f Params-Validate-0.88.tar.gz Params-Validate-0.88 &&
rm -rf Params-Validate-0.88 &&
cd .. &&


export CFLAGS="-I$PDESTDIR_OPENLDAP/include" &&
export LDFLAGS="-L$PDESTDIR_OPENLDAP/lib" &&


./configure --prefix=$PDESTDIR_PLUGINS \
  --enable-perl-modules \
  --with-trusted-path="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin" \
  --with-perl=$PDESTDIR_PERL/bin/perl \
  --with-openssl=$PDESTDIR_OPENSSL \
  --with-mysql=$PDESTDIR_MYSQL &&
make &&
make install &&

cd $SRCROOT &&
rm -rf $PDIR
