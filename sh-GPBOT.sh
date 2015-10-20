#!/bin/bash

input=$1
output=$2
rm -rf ${output}
seed=$3
nodo=$4
echo "nodo:  ${nodo}"

shift 4

while [ $# != 0 ]; do
    flag="$1"
    case "$flag" in
        -G) if [ $# -gt 1 ]; then
              arg="$2"
              shift
	      G=$arg
            fi
            ;;
        -P) if [ $# -gt 1 ]; then
              arg="$2"
              shift
	      P=$arg
            fi
            ;;
        -M) if [ $# -gt 1 ]; then
              arg="$2"
              shift
	      M=$arg
            fi
            ;;
        -N) if [ $# -gt 1 ]; then
              arg="$2"
              shift
	      N=$arg
            fi
            ;;
         *) echo "Unrecognized flag or argument: $flag"
            ;;
        esac
    shift
done

#Escribir el archivo de propiedades
archivo_mapas="30Selected.list"
#archivo_mapas="All.list"
#archivo_temp="Temp.list"

archivo_propiedades="configuration.properties_${seed}_${nodo}"
rm -rf ${archivo_propiedades}
#Generar lista de M mapas
#sort -R ${archivo_mapas} | head -n ${M} > ${archivo_temp}
size=$( wc -l ${archivo_mapas} |awk '{print $1;}')
select=$( echo $(( $RANDOM %${size-1} + 1)) )
#echo "size: ${size} y select: ${select}"
#mapas_seleccionados=$(cat ${archivo_temp})
mapas_seleccionados=$( head -n ${select} ${archivo_mapas}  |tail  -n 1 )

echo "planetwars.fitness.maplist = " $mapas_seleccionados >> ${archivo_propiedades}
echo "algorithm.evolutionary.generations = ${G}" >> ${archivo_propiedades}
echo "algorithm.evolutionary.population.size = ${P}" >> ${archivo_propiedades}
echo "planetwars.fitness.runspermap = ${N}" >> ${archivo_propiedades}

echo "./lanzarGA-GPBOT.sh ${archivo_propiedades} ${nodo}"
./lanzarGA-GPBOT.sh ${archivo_propiedades} ${nodo} > ${output}.temp

#./TestScript.sh > ${output}.temp

aptitud=$( head -1 ${output}.temp |awk -F":" '{print $1;}' |awk -F"[" '{print $2;}' )
aptitud=${aptitud/./,} #Las operaciones de awk se realizan con notación ',' en vez de '.'
aptitud=$( echo "${aptitud} ${M} ${N}" |awk '{printf "%.8f \n", ($1/(($2)*($3)))}' )
#aptitud=$( echo "${aptitud} ${nodo}" |awk '{printf "%.8f \n", $1*$2}' )
aptitud_punto=${aptitud/,/.}
echo "Aptitud: ${aptitud_punto}"
echo ${aptitud_punto} > ${output}
#cat ${output}
rm -rf ${output}.temp ${archivo_propiedades}
