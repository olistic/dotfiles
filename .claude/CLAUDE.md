## Preferences

- Lead with the answer, not the reasoning — keep responses short and direct
- When making changes, prefer atomic commits over large batches
- Default to TypeScript when the language isn't specified or obvious from context
- When a task has multiple reasonable interpretations, ask — don't guess

## Philosophy

- No speculative features — only build what's needed now
- No premature abstraction — three similar lines beat a premature helper
- Replace, don't deprecate — if something is unused, delete it completely
- Clarity over cleverness — straightforward code wins
- Justify new dependencies — prefer the standard library when it's close enough
- Verify at every level — run the linter, the tests, the build

## Commit conventions

- Use [Conventional Commits](https://www.conventionalcommits.org) with scope when applicable
- Keep descriptions under 72 characters, imperative mood
- One logical change per commit
- Never push directly to main/master — use feature branches
- Never commit secrets, credentials, or tokens

## Hard limits

- 100 lines per function max
- 5 positional parameters max
- Fix every warning from every tool; inline-ignore only with a justification comment

## Comments

Only add a comment when it explains *why*, not *what*. Good reasons to comment:

- Non-obvious behavior (e.g., why a catch block swallows an error)
- Security rationale (e.g., why env vars are restricted)
- External API quirks (e.g., Fly's 408 on wait timeout)
- Ordering constraints (e.g., attach logs before starting container)
- Labeled strategies or steps in a multi-branch algorithm

Do not comment:

- Section headers that just name the variable/block below them
- Lines that duplicate an adjacent log message
- Self-evident operations (`// Create temp directory` above `mkdtemp`)
- Mock labels in tests unless the sequence is non-obvious

Style:

- JSDoc (`/** */`) for exported functions, public methods, and interface fields
- Inline `//` for everything else, on the line above the code (not end-of-line), except for unit-clarifying suffixes like `// 24 hours`
- Keep comments terse — one line when possible
- In tests, comment async flow (`// Flush microtasks so X resolves before Y.`) and test-ordering dependencies

Grammar:

- Capitalize the first word and any proper nouns (e.g. Claude, GitHub)
- End sentences and imperatives with a period
- Short labels in test mock sequences (e.g., `// Create Machine`, `// Wait for stopped`) don't need a period
- Unit suffixes (e.g., `// 24 hours`) and transformation labels (e.g., `// Bold: **text** → *text*`) don't need a period

## Tool usage

- Never use `cat`, `head`, `tail`, or `sed` via Bash to read or edit files — use the Read and Edit tools
- Never use `grep` or `rg` via Bash — use the Grep tool
- Never use `find` or `ls` via Bash to search for files — use the Glob tool
- Reserve Bash for commands that genuinely require shell execution (git, npm, build tools, etc.)
