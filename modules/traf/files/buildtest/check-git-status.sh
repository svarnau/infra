#!/bin/bash
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

rc=0   #so far, so good

git_dir="$1"

if [[ -z $git_dir ]]
then
  echo "Error: git directory required"
  exit 1
fi

cd $git_dir || exit 1

modified=$(git ls-files -m | wc -l)
unignored=$(git ls-files -o --exclude-standard | wc -l)

if [[ $modified != 0 ]]
then
  echo "Error: Build modified $modified versioned file(s)"
  echo "==========="
  git ls-files -m
  echo "==========="
  rc=2
fi
if [[ $unignored != 0 ]]
then
  echo "Error: Build created $unignored untracked file(s)"
  echo "       Update .gitignore files"
  echo "==========="
  git ls-files -o --exclude-standard
  echo "==========="
  rc=2
fi

exit $rc
