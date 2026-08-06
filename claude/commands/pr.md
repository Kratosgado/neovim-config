Create a draft PR and sync Jira. Argument ($ARGUMENTS): a ticket key, or `create`. If empty, tell the user to pass one and stop.

Steps:

1. Run `git-town diff-parent` and `git-town branch` — get diff and parent branch.
2. Ticket:
   - `create` → create a new Jira ticket via `createJiraIssue`, assigned to `atlassianUserInfo`'s accountId, status **Code Review** (transition after create if needed), label either frontend/backend, summary from the diff. Use its key below.
   - Else → transition the given key to **Code Review** (`getTransitionsForJiraIssue` + `transitionJiraIssue`).
3. `gh pr create --draft --base <parent> --assignee @me --label <scope>` with title `type(scope): subject` and a body containing summary, ticket link, test plan.
4. `addCommentToJiraIssue`: 2–4 sentence non-technical summary + PR link.
