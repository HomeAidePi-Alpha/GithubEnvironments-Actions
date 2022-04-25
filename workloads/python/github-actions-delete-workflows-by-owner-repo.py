import sys

def deleteAllWorkflowRunsByOwnerByRepo(owner,repo):
    print("Hello Alpha-Actions")
    print('owner:"', owner, '"')
    print('repo:"', repo, '"')
    from ghapi.all import GhApi
    api = GhApi()

    runs = api.actions.list_workflow_runs_for_repo(owner, repo)
    for run in runs.workflow_runs:
        api.actions.delete_workflow_run(owner, repo, run.id)

if __name__ == "__main__":
    owner = sys.argv[1]
    repo = sys.argv[2]
    deleteAllWorkflowRunsByOwnerByRepo(owner, repo)