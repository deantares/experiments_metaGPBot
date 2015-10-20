#!/bin/bash

dir=TrainingSets
rm -f ${dir}/*.*~
rm -f ${dir}/*.conv

#To run TESTS
MPIEXEC=/opt/sun-ct/bin/mpiexec
Nproc=4
BINARY_NAME=./EVOCA
ejecutable=sh-GPBOT.sh
archivo_configuracion=conf-GPBOT.config
lista=30Selected.list
semilla=0
NSeeds=6
MaxM=5
MaxEval=50
MaxTime=0
Min=0 #1=minimizar, 0=maximizar


${MPIEXEC} -np ${Nproc} ${BINARY_NAME} ${ejecutable} ${archivo_configuracion} ${lista} ${semilla} ${NSeeds} ${MaxM} ${MaxEval} ${MaxTime} ${Min} > EVOCA-${archivo_configuracion}-${lista}-${semilla}.out
                 
