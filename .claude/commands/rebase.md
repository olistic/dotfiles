Rebase the current branch against a base branch.

## Steps

1. Detect the repo's default branch by parsing the `HEAD branch` line from `git remote show origin`. If the remote is unreachable, fall back to `master`.
2. Determine the base branch: use `$ARGUMENTS` if provided, otherwise use the detected default branch.
3. Verify the current branch is not the base branch. If it is, stop and tell the user.
4. Run `git fetch origin <base>`.
5. Run `git rebase origin/<base>`.
6. If the rebase stops with conflicts, resolve each conflicting file, stage it with `git add`, then run `git rebase --continue`. Repeat until the rebase completes.
