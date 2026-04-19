Delete the current branch and its worktree (if applicable).

## Steps

1. Detect the repo's default branch by parsing the `HEAD branch` line from `git remote show origin`. If the remote is unreachable, fall back to `master`.
2. Get the current branch name. If it is the default branch, stop and tell the user.
3. Determine if the current directory is inside a linked worktree by checking whether `git rev-parse --git-common-dir` differs from `git rev-parse --git-dir`. If so, note the worktree path from `git rev-parse --show-toplevel` and the main working tree path from `git worktree list` (the first entry).
4. If in a worktree: change directory to the main working tree, then run `git worktree remove <worktree-path>`.
5. Switch to the default branch.
6. Delete the branch with `git branch -D <branch>`.
