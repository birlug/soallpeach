set -ex

cd workspace

git clone --quiet  $REPOSITORY_URL $(pwd)/code
cd code/

if [[ -v BRANCH_NAME ]]; then
    git checkout $BRANCH_NAME
fi

cd $CHALLENGE_NAME

git --no-pager log -1 --pretty="tformat:%H,%s"
