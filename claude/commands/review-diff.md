Review the changes on the current branch.

## 1. Gather the diff

Run these commands:
- `git-town diff-parent` — to get the diff of changes on this branch vs its parent
- `git branch --show-current` — to confirm the current branch

## 2. Review the changes

Go through the diff carefully and evaluate:

- **Correctness** — does the logic do what it's supposed to?
- **Edge cases** — are there inputs or states that could break this?
- **Security** — any injection risks, exposed secrets, or unsafe operations?
- **Code quality** — is it clear, well-named, and free of unnecessary complexity?
- **Consistency** — does it follow the patterns and conventions already in the codebase?

## 3. Report findings

Structure the review as:

- **Summary** — one sentence on the overall quality
- **Issues** — list any bugs, risks, or problems found, ordered by severity (critical → minor)
- **Suggestions** — optional improvements that are not blockers
- **Verdict** — Approve / Request changes / Needs discussion
