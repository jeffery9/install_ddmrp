#! /bin/bash

cwd=$(pwd)

for repo in $(cat repo.list)
do
echo $repo
 git submodule add http://github.com/oca/$repo $repo

done
