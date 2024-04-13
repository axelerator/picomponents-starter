#!/bin/bash


dir=$(dirname $0)/..

elm make $dir/src/Main.elm --output=$dir/main.js


