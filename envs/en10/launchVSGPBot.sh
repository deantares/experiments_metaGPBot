#!/bin/bash

# Variables
# $1 map
#set -x
tree1="${1}"
tree2="${2}"
id=${4}
echo ${folder}
map=${3}
java -jar environment/PlayGame-1.2.jar > environment/simula${id}.txt 2> environment/berror${id}.txt environment/maps/${map} 1000 1000 environment/log${id}.txt "java -jar environment/gpagent.jar $tree1 " "java -jar environment/gpagent.jar $tree2 "

perl environment/analizaCoGPBOT.pl environment/berror${id}.txt > environment/error${id}.txt;
cat environment/error${id}.txt
#echo "Termino"
