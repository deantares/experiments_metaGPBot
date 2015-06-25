#!/bin/bash
set -x
individuo=${1}
node=${2}
path=$(pwd)

cat template.properties >> ${1};
echo "planetwars.environment.folder = /home/antares/experiments_metaGPBot/envs/en${2}" >> ${1};

com="cd ${path} ; java -jar -Xmx2048m PG_SC.jar ${1} 1"

ssh compute-0-$2 "${com}"

