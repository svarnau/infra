#!/bin/bash

MODULE_PATH=/etc/puppet/modules

function remove_module {
  local SHORT_MODULE_NAME=$1
  if [ -n "$SHORT_MODULE_NAME" ]; then
    rm -Rf "$MODULE_PATH/$SHORT_MODULE_NAME"
  else
    echo "ERROR: remove_module requires a SHORT_MODULE_NAME."
  fi
}

# Array of modules to be installed key:value is module:version.
declare -A MODULES
#NOTE: if we previously installed kickstandproject-ntp we nuke it here
# since puppetlabs-ntp and kickstandproject-ntp install to the same dir
if grep kickstandproject-ntp /etc/puppet/modules/ntp/Modulefile &> /dev/null; then
  remove_module "ntp"
fi

remove_module "gearman" #remove old saz-gearman
remove_module "limits" # remove saz-limits (required by saz-gearman)

MODULES["puppetlabs-ntp"]="0.2.0"

MODULES["openstackci-dashboard"]="0.0.8"

# freenode #puppet 2012-09-25:
# 18:25 < jeblair> i would like to use some code that someone wrote,
# but it's important that i understand how the author wants me to use
# it...
# 18:25 < jeblair> in the case of the vcsrepo module, there is
# ambiguity, and so we are trying to determine what the author(s)
# intent is
# 18:30 < jamesturnbull> jeblair: since we - being PL - are the author
# - our intent was not to limit it's use and it should be Apache
# licensed
MODULES["openstackci-vcsrepo"]="0.0.8"

MODULES["puppetlabs-apache"]="0.0.4"
MODULES["puppetlabs-apt"]="1.1.0"
MODULES["puppetlabs-haproxy"]="0.4.1"
MODULES["puppetlabs-mysql"]="0.6.1"
MODULES["puppetlabs-postgresql"]="3.0.0"
MODULES["puppetlabs-stdlib"]="3.2.0"
MODULES["saz-memcached"]="2.0.2"
MODULES["spiette-selinux"]="0.5.1"
MODULES["rafaelfc-pear"]="1.0.3"
MODULES["maestrodev-maven"]="1.1.7"

MODULE_LIST=`puppet module list`

# Transition away from old things
if [ -d /etc/puppet/modules/vcsrepo/.git ]
then
    rm -rf /etc/puppet/modules/vcsrepo
fi

for MOD in ${!MODULES[*]} ; do
  # If the module at the current version does not exist upgrade or install it.
  if ! echo $MODULE_LIST | grep "$MOD ([^v]*v${MODULES[$MOD]}" >/dev/null 2>&1
  then
    # Attempt module upgrade. If that fails try installing the module.
    if ! puppet module upgrade $MOD --version ${MODULES[$MOD]} >/dev/null 2>&1
    then
      # This will get run in cron, so silence non-error output
      puppet module install $MOD --version ${MODULES[$MOD]} >/dev/null
    fi
  fi
done
