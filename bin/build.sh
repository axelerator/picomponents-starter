#!/bin/bash


dir=$(dirname $0)/..
sed -i 's/mountedUnder = Nothing/mountedUnder = Just <| s "picomponents-starter"/g' $dir/src/Route.elm

elm make $dir/src/Main.elm --output=$dir/main.js


