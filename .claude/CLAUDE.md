## Preferences

- Lead with the answer, not the reasoning — keep responses short and direct
- When making changes, prefer atomic commits over large batches
- Default to TypeScript when the language isn't specified or obvious from context
- When a task has multiple reasonable interpretations, ask — do NOT guess

## Philosophy

- No speculative features — only build what's needed now
- No premature abstraction — three similar lines beat a premature helper
- Replace, do NOT deprecate — if something is unused, delete it completely
- Clarity over cleverness — straightforward code wins
- Justify new dependencies — prefer the standard library when it's close enough
- Verify at every level — run the linter, the tests, the build

## Commit conventions

- Use [Conventional Commits](https://www.conventionalcommits.org) with scope when applicable
- Keep descriptions under 72 characters, imperative mood
- One logical change per commit
- NEVER push directly to main/master — use feature branches
- NEVER commit secrets, credentials, or tokens
- Only use `--amend --no-edit` when fixing a change from the immediately preceding commit — otherwise create a new commit

## Naming

- Do NOT use abbreviations for variable names — spell them out for clarity (exceptions: universally understood short forms like `args`, `ctx`, `err`, `i`, `j`, `params`, `props`, `ref`)

## Hard limits

- 50 lines per function max
- 250 lines per file max
- 5 positional parameters max
- Fix every warning from every tool; inline-ignore only with a justification comment

## Comments

- Only add a comment when it explains *why*, not *what*
- Do NOT comment self-evident operations, duplicate adjacent log messages, section headers that just name the variable/block below them, or separator lines (`// ---`, `// ===`, `// ****`)
- Use JSDoc (`/** */`) for exported functions, public methods, and interface fields
- Inline `//` on the line above the code, except for unit-clarifying suffixes like `// 24 hours`
- Capitalize the first word; end sentences with a period

## Tool usage

- NEVER use `cat`, `head`, `tail`, or `sed` via Bash to read or edit files — use the Read and Edit tools
- NEVER use `grep` or `rg` via Bash — use the Grep tool
- NEVER use `find` or `ls` via Bash to search for files — use the Glob tool
- Reserve Bash for commands that genuinely require shell execution (git, npm, build tools, etc.)
- Always use `git branch -D` when deleting branches — squash & merge leaves them "unmerged" to git

## Worktrees

- Worktree directory: `.worktrees/` (local to each project root)
