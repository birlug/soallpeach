set -ex
cd workspace
git clone --quiet  $REPOSITORY_URL $(pwd)/code
cd code/$CHALLENGE_NAME

if [[ -z "$BRANCH_NAME" ]]; then
    git checkout $BRANCH_NAME
fi

git log -1 --pretty="tformat:%H,%s"
