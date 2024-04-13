#!/bin/bash

project_root=$(dirname $0)/..

sed -i 's/mountedUnder = Nothing/mountedUnder = Just "picomponents-starter"/g' $project_root/src/Route.elm

$(dirname $0)/build.sh 

mkdir $project_root/dist
cp $project_root/main.js $project_root/dist
cp $project_root/index.html $project_root/dist
cp $project_root/picomponents.js $project_root/dist/
cp -r $project_root/assets $project_root/dist/