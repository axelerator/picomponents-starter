#!/bin/bash

project_root=$(dirname $0)/..

sed -i 's/    mountedUnderRoot/   Just "picomponents-starter"/g' $project_root/src/Route.elm

$(dirname $0)/build.sh 

mkdir $project_root/dist
cp $project_root/main.js $project_root/dist
cp $project_root/index.html $project_root/dist
cp $project_root/picomponents.js $project_root/dist/
cp -r $project_root/assets $project_root/dist/

ln $project_root/dist/login $project_root/dist/index.html
ln $project_root/dist/signup $project_root/dist/index.html
ln $project_root/dist/home $project_root/dist/index.html
ln $project_root/dist/preferences $project_root/dist/index.html
