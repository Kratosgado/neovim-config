Create a draft PR and sync Jira. Argument ($ARGUMENTS): a ticket key, or `create`. If empty, tell the user to pass one and stop.

Steps:

1. Run `git-town diff-parent` and `git-town branch` — get diff and parent branch.
2. Ticket:
   - `create` → create a new Jira ticket via `createJiraIssue`, assigned to `atlassianUserInfo`'s accountId, label either frontend/backend, summary from the diff. To place it in the active sprint: find the active sprint id (query the board's sprints with state=active via `fetch` against the agile API, or `searchJiraIssuesUsingJql` with `sprint in openSprints()` on a recent issue and read its `customfield_10020`/sprint field), then set the sprint custom field on create — or `editJiraIssue` immediately after to add it. Then transition to **Code Review** (`getTransitionsForJiraIssue` + `transitionJiraIssue`). Use its key below.
   - Else → transition the given key to **Code Review** (`getTransitionsForJiraIssue` + `transitionJiraIssue`).
3. `gh pr create --draft --base <parent> --assignee @me --label <scope>` with title `type(scope): subject` and a body containing summary, ticket link, test plan.
4. `addCommentToJiraIssue`: 2–4 sentence non-technical summary + PR link.
