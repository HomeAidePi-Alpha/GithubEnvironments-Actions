import sys

def deleteAllWorkflowRunsByOwnerByRepo(owner,repo, token):
    print("Hello Alpha-Actions")
    print('owner:"', owner, '"')
    print('repo:"', repo, '"')
    print('token len:"', len(token), '"')
    print('token first7:"', token[0:7], '"')
    from ghapi.all import GhApi
    api = GhApi(owner = owner, repo = repo, token=token)
    print(api)
    workflows = api.actions.list_workflows_for_repo(owner, repo)
    print(workflows)
    runs = api.actions.list_workflow_runs_for_repo(owner, repo, branch="main")
    print(runs)
    for run in runs.workflow_runs:
        print(run.id)
        api.actions.delete_workflow_run(owner, repo, run.id)

if __name__ == "__main__":
    owner = sys.argv[1]
    repo = sys.argv[2]
    token = sys.argv[3]
    deleteAllWorkflowRunsByOwnerByRepo(owner, repo, token)