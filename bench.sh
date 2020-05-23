set -e
set -x

DCMD="docker run -ti -v $(pwd)/benchouts:/outs --security-opt seccomp=unconfined --entrypoint /bin/sh "
PBCMD="pyperformance run --rigorous -o outs"

TG="conda"
echo $TG
docker build -f dockerfiles/$TG.df -t pyb:$TG .
$DCMD pyb:$TG -c "/opt/conda/envs/py38/bin/python -m ${PBCMD}/$TG.json"

TG="arch"
echo $TG
docker build -f dockerfiles/$TG.df -t pyb:$TG .
$DCMD pyb:$TG -c "${PBCMD}/$TG.json"


TG="alpine"
echo $TG
docker build -f dockerfiles/$TG.df -t pyb:$TG .
$DCMD pyb:$TG -c "${PBCMD}/$TG.json"

TG="slim"
echo $TG
docker build -f dockerfiles/$TG.df -t pyb:$TG .
$DCMD pyb:$TG -c "${PBCMD}/$TG.json"

