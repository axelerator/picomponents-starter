#!/bin/bash

project_root=$(dirname $0)/..

sed -i 's/    mountedUnderRoot/   Just "picomponents-starter"/g' $project_root/src/Route.elm

$(dirname $0)/build.sh 

mkdir $project_root/dist
cp $project_root/main.js $project_root/dist
cp $project_root/index.html $project_root/dist
cp $project_root/picomponents.js $project_root/dist/
cp -r $project_root/assets $project_root/dist/

# in case someone reloads on one of these paths we also want to load the index.html
ln -s index.html $project_root/dist/login
ln -s index.html $project_root/dist/signup
ln -s index.html $project_root/dist/home
ln -s index.html $project_root/dist/preferences
