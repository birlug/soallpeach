set -eu

SEED=$(echo $((1 + RANDOM % 10)))
BASE_PATH=$(pwd)/workspace
cd workspace/code/$CHALLENGE_NAME
echo -n $SEED > payload.txt
mkdir data/

set +e
docker container rm "$CHALLENGE_NAME-container" -f &> /dev/null
set -eu

docker run -d --name "$CHALLENGE_NAME-container" -p "0:80" $CHALLENGE_NAME
PORT=$(docker port "$CHALLENGE_NAME-container" 80 | cut -d':' -f2)

timeout 60 bash -c "while [[ \"\$(curl -s -o /dev/null -w '%{http_code}' localhost:${PORT}/count)\" != \"200\" ]]; do sleep 1; done" || false

echo "POST http://localhost:${PORT}
@payload.txt" > $BASE_PATH/target.list
cp $BASE_PATH/target.list target.list

vegeta  -cpus 1 attack -rate $rate -duration=${duration}s  -targets $BASE_PATH/target.list | vegeta report -type=json | jq '.' > metrics.json
cat metrics.json
echo "::::METRICS="$(cat metrics.json)

