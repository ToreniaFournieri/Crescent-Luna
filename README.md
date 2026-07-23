# Crescent-Luna

Chat-based adventure.

## Environment setup

The repository currently contains only this project description. There are no
application dependencies, build tools, environment variables, or external
services to configure yet.

After opening or cloning the repository, confirm that the workspace is
available with:

```sh
git status
git log -1 --oneline
```

A successful checkout should report a clean working tree on your current
branch. No additional setup is required until an application stack is added.

## Publishing changes

This checkout does not have a Git remote configured. For a normal local clone,
connect the checkout to the GitHub repository before pushing:

```sh
git remote add origin <repository-url>
git remote -v
git push -u origin HEAD
```

In a hosted or mobile development client, do not add a remote manually unless
the client explicitly exposes the checkout as a local clone. The client may
manage repository connections through its GitHub integration instead. In that
case, reconnect GitHub in the client's account settings, grant access to this
repository, and then retry **Push**.

If the client reports HTTP `403` while pushing or creating a pull request, the
request reached GitHub but the authenticated account or app was not allowed to
perform it. Check that:

- the GitHub account is signed in again and has write access to the repository;
- the GitHub app is installed for this repository with **Contents: write** and
  **Pull requests: write** permissions;
- organization SSO has been authorized for the account, app, or access token;
- a protected branch is not being used as the push target (push a feature
  branch instead); and
- the repository URL belongs to the intended owner and has not been renamed or
  transferred.

After correcting access, retry the push. If it succeeds but automatic pull
request creation still returns `403`, create the pull request from GitHub's web
interface or ask a repository administrator to grant the app pull-request
access.

To isolate the failure, first check whether the new branch appears on GitHub.
If it does not, the integration lacks repository contents access. If it does
appear but no pull request is created, contents access is working and the
missing permission is specifically pull-request creation.

## Development status

The application has not been scaffolded yet. When implementation begins, add
the required runtime version, dependency installation command, environment
variables, and start/test commands to this document.
