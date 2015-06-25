#!/bin/bash
#set -x
individuo=${1}
node=${2}
path=$(pwd)


echo "planetwars.environment.folder = /home/antares/experiments_metaGPBot/envs/en${2}/environment" >> ${1};
cp $1 envs/en${2}/$1 ;
cat envs/en${2}/head.properties >> envs/en${2}/${1};

com="cd ${path} ; cd envs/en${2}; java -jar -Xmx2048m PG_META.jar ${1} 1 >/dev/null"

ssh compute-0-$2 "${com}"

