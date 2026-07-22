Run the following steps to create a PR and update the ticket.

The ticket key is: $ARGUMENTS

## 1. Understand the branch context

Run these commands to gather context:

- `git-town diff-parent` — to see what changed on this branch vs its parent
- `git-town branch` — to identify the parent branch (use it as the PR base) and the crrent branch

## 2. Create the pull request

Use `gh pr create` with:

- `--base` set to the parent branch identified above
- A concise title following conventional commit style
- A well-structured body with a summary of changes and a test plan

## 3. Comment on the ticket

Using the ticket key from $ARGUMENTS, post a comment on the Jira ticket explaining what was done in plain, non-technical language — as if explaining to a product manager or stakeholder. Focus on what changed from a user/business perspective, not implementation details. Keep it to 2–4 sentences.

If no ticket key was provided, skip this step and remind the user to run `/pr TICKET-123` with the ticket key.
