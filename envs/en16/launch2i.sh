#!/bin/bash

# Variables
# $1 map
set -x
tree1="${1}"
tree2="${2}"
id=${4}
#folder= '/home/antares/PlanetWars_PG_Estudio_Fitness/environment'
echo ${folder}
map=${3}
# java -jar environment/PlayGame-1.2.jar > environment/simula${id}.txt 2> environment/berror${id}.txt environment/maps/${map} 10000 10000 environment/log${id}.txt "java -jar environment/gpagent.jar $tree1 " "java -jar environment/gpagent.jar $tree2 " ;
java -jar environment/PlayGame-1.2.jar > environment/simula${id}.txt 2> environment/berror${id}.txt environment/maps/${map} 10000 10000 environment/log${id}.txt "java -jar environment/gpagent.jar $tree1 " "java -jar environment/gpagent.jar $tree2 " 

perl environment/analizaCoGPBOT.pl environment/berror${id}.txt > environment/error${id}.txt;

echo "Termino"
