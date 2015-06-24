#!/bin/bash
#set -x
path=$(pwd)
#com="cd ${path} ; echo \"hola mundo\" > sal ; echo \$HOSTNAME >> sal;"

com="cd ${path} ; nohup java -jar -Xmx2048m PG_SC.jar planetwars-SC.properties 2 \& ; rm nohup.out ;"

nohup ssh compute-0-0 "${com}" &
nohup ssh compute-0-1 "${com}" &
nohup ssh compute-0-2 "${com}" &
nohup ssh compute-0-3 "${com}" &
nohup ssh compute-0-4 "${com}" &
nohup ssh compute-0-5 "${com}" &
nohup ssh compute-0-6 "${com}" &
nohup ssh compute-0-7 "${com}" &
nohup ssh compute-0-8 "${com}" &
nohup ssh compute-0-9 "${com}" &
nohup ssh compute-0-10 "${com}" &
nohup ssh compute-0-11 "${com}" &
nohup ssh compute-0-12 "${com}" &
nohup ssh compute-0-13 "${com}" &
nohup ssh compute-0-14 "${com}" &
nohup ssh compute-0-15 "${com}" &
nohup ssh compute-0-16 "${com}" &
nohup ssh compute-0-17 "${com}" &
rm nohup.out
