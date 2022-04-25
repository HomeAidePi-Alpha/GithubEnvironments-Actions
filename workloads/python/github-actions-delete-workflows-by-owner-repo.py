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
    print(api)
    response = api.actions.list_repo_workflows(owner, repo)
    print(response)
    workflows = response.workflows
    for workflow in workflows:
        print(workflow)
        url = 'https://api.github.com/repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs'.format(owner = owner, repo = repo, workflow_id = workflow_id)
        authorization = 'Bearer {token}'.format(token = token)
        accept = 'application/vnd.github.v3+json'
        headers = {'Accept' : accept, 'Proxy-Authorization' : authorization}
        response = requests.get(url, headers)
        print(response)
        runs = response.workflow_runs
        print(runs)
        for run in runs:
            print(run.id)
            api.actions.delete_workflow_run(owner, repo, run.id)

if __name__ == "__main__":
    owner = sys.argv[1]
    repo = sys.argv[2]
    token = sys.argv[3]
    workflow_id = sys.argv[4]
    deleteAllWorkflowRunsByOwnerByRepo(owner, repo, token, workflow_id)