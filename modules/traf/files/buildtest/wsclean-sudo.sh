#!/bin/sh
# @@@ START COPYRIGHT @@@
#
# (C) Copyright 2014 Hewlett-Packard Development Company, L.P.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
# @@@ END COPYRIGHT @@@

source /usr/local/bin/traf-functions.sh
log_banner

if [[ -z "$WORKSPACE" ]]
then
  echo "WORKSPACE variable not set"
  exit 1
fi

set -x

if id tinstall 2>/dev/null
then
  sudo -n -u tinstall rm -rf $WORKSPACE/traf_inst 
fi

if id trafodion 2>/dev/null
then
  sudo -n -u trafodion rm -rf $WORKSPACE/phx_test_run $WORKSPACE/traf_run
  sudo -n -u trafodion rm -rf $WORKSPACE/rundir $WORKSPACE/sql-regress-logs
fi
