# Creates a Project board with 3 columns to simulate an ongoing sprint
# TODO: create a number of Cards to simulate real action

# See: https://developer.github.com/v3/projects/#create-a-repository-project
ACCEPT_HEADER="application/vnd.github.v3+json"  

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating new Project."
PROJECT_ID=`curl -s -H "Authorization: Token $GITHUB_TOKEN" -H "Accept: $ACCEPT_HEADER" -H "Content-type: application/json" -X POST -d @$DIR/project.json https://api.github.com/repos/${GITHUB_REPOSITORY}/projects | jq .id`
echo "📊 Project created with id: $PROJECT_ID"

echo "Creating Columns"
TODO_COL_ID=`curl -s -H "Authorization: Token $GITHUB_TOKEN" -H "Accept: $ACCEPT_HEADER" -H "Content-type: application/json" -X POST -d @$DIR/todo.json https://api.github.com/projects/$PROJECT_ID/columns | jq .id`
echo "[1/3] ✅ TODO column created. id=$TODO_COL_ID"

PROG_COL_ID=`curl -s -H "Authorization: Token $GITHUB_TOKEN" -H "Accept: $ACCEPT_HEADER" -H "Content-type: application/json" -X POST -d @$DIR/inProgress.json https://api.github.com/projects/$PROJECT_ID/columns | jq .id`
echo "[2/3] ✅ In Progress column created. id=$PROG_COL_ID"

DONE_COL_ID=`curl -s -H "Authorization: Token $GITHUB_TOKEN" -H "Accept: $ACCEPT_HEADER" -H "Content-type: application/json" -X POST -d @$DIR/done.json https://api.github.com/projects/$PROJECT_ID/columns | jq .id`
echo "[3/3] ✅ Done column created. id=$DONE_COL_ID"