## Commit conventions

- Use [Conventional Commits](https://www.conventionalcommits.org) with scope when applicable
- Keep descriptions under 72 characters, imperative mood
- One logical change per commit

## Preferences

- Don't add emojis unless asked
- Be concise — lead with the answer, not the reasoning
- When making changes, prefer atomic commits over large batches
- Ask before making destructive or hard-to-reverse operations
- Default to TypeScript when the language isn't specified or obvious from context
- When unsure about intent, ask — don't guess

## Tool usage

- **Never** use `cat`, `head`, `tail`, or `sed` via Bash to read or edit files — use the Read and Edit tools
- **Never** use `grep` or `rg` via Bash — use the Grep tool
- **Never** use `find` or `ls` via Bash to search for files — use the Glob tool
- Reserve Bash for commands that genuinely require shell execution (git, npm, build tools, etc.)
