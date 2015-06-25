#!/bin/bash

# Variables
# $1 map
set -x
tree1="${1}"
tree2="${2}"
tree3="${3}"
tree4="${4}"
id=${6}
#folder= '/home/antares/PlanetWars_PG_Estudio_Fitness/environment'
echo ${folder}
map=${5}
java -jar environment/PlayGame-1.2.jar > environment/simula${id}.txt 2> environment/berror${id}.txt environment/maps/4/${map} 10000 10000 environment/log${id}.txt "java -jar environment/gpagent.jar $tree1 " "java -jar environment/gpagent.jar $tree2 " "java -jar environment/gpagent.jar $tree3 " "java -jar 
environment/gpagent.jar $tree4 " ;
perl environment/analizaCoGPBOT.pl environment/berror${id}.txt > environment/error${id}.txt;

echo "Termino"
