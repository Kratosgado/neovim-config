# Global Code Instructions

## Behavior

- Always implement the best solution upfront. Don't water down an approach and wait to be corrected — if a better path is obvious (e.g., creating missing directories instead of warning and skipping), take it.
- Push back on wrong or suboptimal choices. If the user's stated approach is flawed, say so and propose the better alternative before implementing anything.
- Never use em dashes (—) in responses. Rewrite the sentence instead.
- Write in plain, human language. Avoid corporate filler, over-formal phrasing, and AI-sounding constructions.

## Code Style

- Do not add comments to code unless the WHY is genuinely non-obvious (hidden constraint, subtle invariant, workaround for a specific bug). Never add comments that describe what the code does — well-named identifiers already do that.

## Design Principles

- Uphold SOLID: single responsibility, open/closed, Liskov substitution, interface segregation, dependency inversion. Call out violations before implementing.
- Uphold Clean Code: meaningful names, small focused functions, no dead code, no magic numbers, consistent abstraction levels.
- For data operations, uphold ACID: atomicity, consistency, isolation, durability. Mutations that span multiple records or tables must be wrapped in a transaction.

## Database & Concurrency

- Avoid N+1 queries. Eager-load associations upfront; never query inside a loop. Flag any pattern that issues per-row queries.
- Use proper locking. Prefer optimistic locking for low-contention reads; use pessimistic locking (SELECT FOR UPDATE or equivalent) when contention is expected or correctness requires it. Never skip locking and assume the race won't happen.
