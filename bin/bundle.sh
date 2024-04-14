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
arr_variable=("login" "signup" "home" "preferences")
for i in "${arr_variable[@]}"
do
    mkdir $project_root/dist/$i
    cp $project_root/index.html $project_root/dist/$i/
    # change relative paths to point one folder up
    sed -i -E 's/(src|href)="([^h])/\1="..\/\2/g' $project_root/dist/$i/index.html
    cat $project_root/dist/$i/index.html
done
   
