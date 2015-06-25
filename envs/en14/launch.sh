#!/bin/bash

# Variables
# $1 map
set -x
tree="${1}"
#folder= '/home/antares/PlanetWars_PG_Estudio_Fitness/environment'
echo ${folder}
map=${2}
 java -jar environment/PlayGame-1.2.jar 2> environment/berror${3}.txt environment/maps/${map} 10000 1000 environment/log${3}.txt "java -jar environment/bots/gpagent.jar $tree " "java -jar environment/bots/GenebotEje8.jar";
#cp environment/error${3}.txt environment/berror${3}.txt 
perl environment/analizaCo_TurnosResultado.pl environment/berror${3}.txt > environment/error${3}.txt;

echo "Termino"
