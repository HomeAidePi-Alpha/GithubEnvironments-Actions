import sys
import requests

def deleteAllWorkflowRunsByOwnerByRepo(owner,repo, token, workflow_id):
    print("Hello Alpha-Actions")
    print('owner:"', owner, '"')
    print('repo:"', repo, '"')
    print('token len:"', len(token), '"')
    print('token first7:"', token[0:7], '"')
    print('workflow_id:"' , workflow_id, '"')
    from ghapi.all import GhApi
    api = GhApi(owner = owner, repo = repo, token=token)
    response = api.actions.list_repo_workflows(owner, repo)
    workflows = response.workflows
    for workflow in workflows:
        # escapement if workflow id was provided to check and escape if not a match
        # if workflow_id and workflow_id != workflow.id: 
        #     continue
        # add headers for github api raw request
        url = workflow.url + "/runs"
        authorization = "Bearer " + token 
        accept = 'application/vnd.github.v3+json'
        headers = {'Accept' : accept, 'Authorization' : authorization}
        print(url) 
        print(headers)
        # make raw github api request
        response = requests.get(url, headers)
        print(response)
        print(response.text)
        runs = response.text.workflow_runs
        print(runs)
        # find all the runs and delete them one by one 
        for run in runs:
            print(run.id)
            api.actions.delete_workflow_run(owner, repo, run.id)

if __name__ == "__main__":
    owner = sys.argv[1]
    repo = sys.argv[2]
    token = sys.argv[3]
    workflow_id = sys.argv[4]
    deleteAllWorkflowRunsByOwnerByRepo(owner, repo, token, workflow_id)